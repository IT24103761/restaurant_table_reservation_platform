package com.amali.servlets;

import com.amali.models.FoodItem;
import com.amali.models.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.util.*;

@WebServlet("/add-to-order")
public class MenuServlet extends HttpServlet {
    private List<FoodItem> menuItems;

    @Override
    public void init() throws ServletException {
        menuItems = new ArrayList<>();
        // Initialize with sample data (in real app, load from file)
        menuItems.add(new FoodItem("R001", "Chicken Fried Rice", "Rice", 1200));
        menuItems.add(new FoodItem("R002", "Vegetable Rice", "Rice", 900));
        menuItems.add(new FoodItem("K001", "Chicken Kottu", "Kottu", 1100));
        menuItems.add(new FoodItem("K002", "Cheese Kottu", "Kottu", 1300));
        menuItems.add(new FoodItem("N001", "Chicken Noodles", "Noodles", 1000));
        menuItems.add(new FoodItem("D001", "Watalappan", "Dessert", 600));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("menuItems", menuItems);
        request.getRequestDispatcher("/menu.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String reservationId = (String) session.getAttribute("reservationId");

        if (reservationId == null) {
            reservationId = "RES-" + System.currentTimeMillis();
            session.setAttribute("reservationId", reservationId);
        }

        Order order = (Order) session.getAttribute("currentOrder");
        if (order == null) {
            order = new Order(reservationId);
            session.setAttribute("currentOrder", order);
        }

        String[] selectedItems = request.getParameterValues("foodItem");
        if (selectedItems != null) {
            for (String itemId : selectedItems) {
                menuItems.stream()
                        .filter(item -> item.getId().equals(itemId))
                        .findFirst()
                        .ifPresent(order::addItem);
            }
            saveOrderToFile(order);
        }

        response.sendRedirect("menu.jsp?success=true");
    }

    private void saveOrderToFile(Order order) {
        String filePath = getServletContext().getRealPath("/orders/") + order.getReservationId() + ".txt";
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath))) {
            for (FoodItem item : order.getItems()) {
                writer.println(item.getId() + "," + item.getName() + "," + item.getPrice());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}