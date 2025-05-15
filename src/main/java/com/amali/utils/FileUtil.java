package com.amali.utils;

import com.amali.models.FoodItem;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
    public static List<FoodItem> loadMenuItems(String filePath) {
        List<FoodItem> items = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                String[] parts = line.split(",");
                if (parts.length >= 3) {
                    items.add(new FoodItem(
                            parts[0].trim(),
                            parts[1].trim(),
                            parts[2].trim(),
                            Double.parseDouble(parts[3].trim()))
                    );
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return items;
    }

    public static void saveOrder(String filePath, List<FoodItem> items) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filePath, true))) {
            for (FoodItem item : items) {
                writer.println(item.getId() + "," + item.getName() + "," + item.getPrice());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}