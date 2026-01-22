package com.tap.DAO;

import java.util.List;
import com.tap.model.OrderItems;   // REQUIRED import

public interface OrderItemsDAO {

    void addOrderItem(OrderItems orderItem);

    OrderItems getOrderItem(int orderItemId);

    void updateOrderItem(OrderItems orderItem);

    void deleteOrderItem(int orderItemId);

    List<OrderItems> getAllOrderItems();
}
