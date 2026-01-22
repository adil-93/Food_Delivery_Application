package com.tap.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<Integer, CartItem> items = new HashMap<>();

    public Map<Integer, CartItem> getItems() {
        return items;
    }

    public void addItem(CartItem item) {
        if (items.containsKey(item.getItemId())) {
            CartItem existing = items.get(item.getItemId());
            existing.setQuantity(existing.getQuantity() + item.getQuantity());
        } else {
            items.put(item.getItemId(), item);
        }
    }

    public void updateItem(int itemId, int quantity) {
        if (items.containsKey(itemId)) {
            if (quantity <= 0) {
                items.remove(itemId);
            } else {
                items.get(itemId).setQuantity(quantity);
            }
        }
    }

    public void removeItem(int itemId) {
        items.remove(itemId);
    }

    public void clear() {
        items.clear();
    }

    public double getTotalPrice() {
        double total = 0;
        for (CartItem item : items.values()) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }
}
