package com.amali.models;

import java.io.Serializable;

public class FoodItem implements Serializable {
    private String id;
    private String name;
    private String category;
    private double price;

    public FoodItem(String id, String name, String category, double price) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
    }

    // Getters
    public String getId() {
        return id;
    }
    public String getName() {
        return name;
    }
    public String getCategory() {
        return category;
    }
    public double getPrice() {
        return price;
    }

    @Override
    public String toString() {
        return name + " (Rs. " + price + ")";
    }
}

