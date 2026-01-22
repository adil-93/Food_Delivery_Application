package com.tap.model;

public class OrderItems {

    private int orderItemId;
    private int orderId;
    private int menuId;
    private int quantity;
    private double itemTotal;
    private String menuItem;

    // No-argument constructor
    public OrderItems() {
    }

    // Parameterized constructor
    public OrderItems(int orderItemId, int orderId, int menuId,
                      int quantity, double itemTotal, String menuItem) {

        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.menuId = menuId;
        this.quantity = quantity;
        this.itemTotal = itemTotal;
        this.menuItem = menuItem;
    }

    // Getters and Setters
    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getMenuId() {
        return menuId;
    }

    public void setMenuId(int menuId) {
        this.menuId = menuId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getItemTotal() {
        return itemTotal;
    }

    public void setItemTotal(double itemTotal) {
        this.itemTotal = itemTotal;
    }

    public String getMenuItem() {
        return menuItem;
    }

    public void setMenuItem(String menuItem) {
        this.menuItem = menuItem;
    }

    @Override
    public String toString() {
        return "OrderItems [orderItemId=" + orderItemId +
               ", orderId=" + orderId +
               ", menuId=" + menuId +
               ", quantity=" + quantity +
               ", itemTotal=" + itemTotal +
               ", menuItem=" + menuItem + "]";
    }
}
