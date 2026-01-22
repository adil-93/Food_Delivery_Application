package com.tap.model;

import java.sql.Timestamp;

public class Orders {

    private int orderId;
    private int userId;
    private int restaurantId;
    private String address;
    private String paymentMethod;
    private String status;
    private Timestamp orderDate;
    private double totalAmount;

    // No-argument constructor
    public Orders() {
    }

    // Parameterized constructor (FIXED)
    public Orders(int orderId, int userId, int restaurantId, String address,
                  String paymentMethod, String status,
                  Timestamp orderDate, double totalAmount) {

        this.orderId = orderId;
        this.userId = userId;
        this.restaurantId = restaurantId;
        this.address = address;
        this.paymentMethod = paymentMethod;
        this.status = status;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
    }

    // Getters and Setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @Override
    public String toString() {
        return "Orders [orderId=" + orderId +
               ", userId=" + userId +
               ", restaurantId=" + restaurantId +
               ", address=" + address +
               ", paymentMethod=" + paymentMethod +
               ", status=" + status +
               ", orderDate=" + orderDate +
               ", totalAmount=" + totalAmount + "]";
    }
}
