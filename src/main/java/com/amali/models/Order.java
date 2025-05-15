package com.amali.models;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private String reservationId;
    private List<FoodItem> items;

    public Order(String reservationId) {
        this.reservationId = reservationId;
        this.items = new ArrayList<>();
    }

    public void addItem(FoodItem item) {
        items.add(item);
    }

    public List<FoodItem> getItems() {
        return new ArrayList<>(items);
    }

    public String getReservationId() {
        return reservationId;
    }

    public double getTotal() {
        return items.stream().mapToDouble(FoodItem::getPrice).sum();
    }
}