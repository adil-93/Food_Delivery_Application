package com.tap.DAO;

import java.util.List;
import com.tap.model.Orders;

public interface OrdersDAO {

    int addOrder(Orders order);

    Orders getOrder(int orderId);

    void updateOrder(Orders order);

    void deleteOrder(int orderId);

    List<Orders> getOrdersByUserId(int userId);


    List<Orders> getOrdersByRestaurant(int restaurantId);
}
