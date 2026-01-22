package com.tap.DAOimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemsDAO;
import com.tap.model.OrderItems;
import com.tap.utility.db_connection;

public class OrderItemsDAOImpl implements OrderItemsDAO {

    private static final String ADD_ORDER_ITEM =
        "INSERT INTO order_items (order_id, menu_id, quantity, item_total, menu_item) " +
        "VALUES (?, ?, ?, ?, ?)";

    private static final String GET_ORDER_ITEM =
        "SELECT * FROM order_items WHERE order_item_id = ?";

    private static final String UPDATE_ORDER_ITEM =
        "UPDATE order_items SET order_id = ?, menu_id = ?, quantity = ?, item_total = ?, menu_item = ? " +
        "WHERE order_item_id = ?";

    private static final String DELETE_ORDER_ITEM =
        "DELETE FROM order_items WHERE order_item_id = ?";

    private static final String GET_ALL_ORDER_ITEMS =
        "SELECT * FROM order_items";

    @Override
    public void addOrderItem(OrderItems orderItem) {
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(ADD_ORDER_ITEM)) {

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getItemTotal());
            ps.setString(5, orderItem.getMenuItem());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderItems getOrderItem(int orderItemId) {
        OrderItems orderItem = null;

        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_ORDER_ITEM)) {

            ps.setInt(1, orderItemId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                orderItem = new OrderItems(
                    rs.getInt("order_item_id"),
                    rs.getInt("order_id"),
                    rs.getInt("menu_id"),
                    rs.getInt("quantity"),
                    rs.getDouble("item_total"),
                    rs.getString("menu_item")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItem;
    }

    @Override
    public void updateOrderItem(OrderItems orderItem) {
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_ORDER_ITEM)) {

            ps.setInt(1, orderItem.getOrderId());
            ps.setInt(2, orderItem.getMenuId());
            ps.setInt(3, orderItem.getQuantity());
            ps.setDouble(4, orderItem.getItemTotal());
            ps.setString(5, orderItem.getMenuItem());
            ps.setInt(6, orderItem.getOrderItemId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrderItem(int orderItemId) {
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_ORDER_ITEM)) {

            ps.setInt(1, orderItemId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<OrderItems> getAllOrderItems() {
        List<OrderItems> orderItemList = new ArrayList<>();

        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_ALL_ORDER_ITEMS);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                OrderItems orderItem = new OrderItems(
                    rs.getInt("order_item_id"),
                    rs.getInt("order_id"),
                    rs.getInt("menu_id"),
                    rs.getInt("quantity"),
                    rs.getDouble("item_total"),
                    rs.getString("menu_item")
                );
                orderItemList.add(orderItem);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItemList;
    }
}
