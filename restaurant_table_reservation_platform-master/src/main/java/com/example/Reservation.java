package com.example;

import java.time.LocalDate;
import java.time.LocalTime;

public class Reservation {
    private String customerName;
    private String phoneNumber;
    private int guests;
    private LocalDate reservationDate;
    private LocalTime reservationTime;
    private int tableNumber;
    private String capacityCategory;

    // Add constructor, getters and setters
    // (Generate these in your IDE or manually)

    public Reservation(String customerName, String phoneNumber, int guests, LocalDate reservationDate, LocalTime reservationTime, int tableNumber, String capacityCategory) {
        this.customerName = customerName;
        this.phoneNumber = phoneNumber;
        this.guests = guests;
        this.reservationDate = reservationDate;
        this.reservationTime = reservationTime;
        this.tableNumber = tableNumber;
        this.capacityCategory = capacityCategory;
    }

    public Reservation() {

    }

    public String getCustomerName() {
        return customerName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public int getGuests() {
        return guests;
    }

    public LocalDate getReservationDate() {
        return reservationDate;
    }

    public LocalTime getReservationTime() {
        return reservationTime;
    }

    public int getTableNumber() {
        return tableNumber;
    }

    public String getCapacityCategory() {
        return capacityCategory;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setGuests(int guests) {
        this.guests = guests;
    }

    public void setReservationDate(LocalDate reservationDate) {
        this.reservationDate = reservationDate;
    }

    public void setReservationTime(LocalTime reservationTime) {
        this.reservationTime = reservationTime;
    }

    public void setTableNumber(int tableNumber) {
        this.tableNumber = tableNumber;
    }

    public void setCapacityCategory(String capacityCategory) {
        this.capacityCategory = capacityCategory;
    }
}