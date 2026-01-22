package com.tap.DAOimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrdersDAO;
import com.tap.model.Orders;
import com.tap.utility.db_connection;

public class OrdersDAOImpl implements OrdersDAO {

    private static final String ADD_ORDER =
        "INSERT INTO orders (user_id, restaurant_id, address, payment_method, status, order_date, total_amount) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?)";

    private static final String GET_ORDER =
        "SELECT * FROM orders WHERE order_id = ?";

    private static final String UPDATE_ORDER =
        "UPDATE orders SET user_id=?, restaurant_id=?, address=?, payment_method=?, " +
        "status=?, order_date=?, total_amount=? WHERE order_id=?";

    private static final String DELETE_ORDER =
        "DELETE FROM orders WHERE order_id=?";

    private static final String GET_BY_USER =
        "SELECT * FROM orders WHERE user_id=?";

    private static final String GET_BY_RESTAURANT =
        "SELECT * FROM orders WHERE restaurant_id=?";

    @Override
    public int addOrder(Orders order) {
    	int orderId=0;
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(ADD_ORDER, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setString(3, order.getAddress());
            ps.setString(4, order.getPaymentMethod());
            ps.setString(5, order.getStatus());
            ps.setTimestamp(6, order.getOrderDate());
            ps.setDouble(7, order.getTotalAmount());

            int affectedRows = ps.executeUpdate();
            if(affectedRows == 0) {
            	throw new SQLException("Creating order failed, no rws affected.");
            }
            
            ResultSet res = ps.getGeneratedKeys();
            while(res.next()) {
            	orderId = res.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
		return orderId;
		
	
    }

    @Override
    public Orders getOrder(int orderId) {
        Orders order = null;

        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_ORDER)) {

            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                order = new Orders();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setRestaurantId(rs.getInt("restaurant_id"));
                order.setAddress(rs.getString("address"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    @Override
    public void updateOrder(Orders order) {
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_ORDER)) {

            ps.setInt(1, order.getUserId());
            ps.setInt(2, order.getRestaurantId());
            ps.setString(3, order.getAddress());
            ps.setString(4, order.getPaymentMethod());
            ps.setString(5, order.getStatus());
            ps.setTimestamp(6, order.getOrderDate());
            ps.setDouble(7, order.getTotalAmount());
            ps.setInt(8, order.getOrderId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteOrder(int orderId) {
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_ORDER)) {

            ps.setInt(1, orderId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Orders> getOrdersByUserId(int userId) {
        List<Orders> list = new ArrayList<>();

        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_BY_USER)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setRestaurantId(rs.getInt("restaurant_id"));
                order.setAddress(rs.getString("address"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));

                list.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<Orders> getOrdersByRestaurant(int restaurantId) {
        List<Orders> list = new ArrayList<>();

        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_BY_RESTAURANT)) {

            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Orders order = new Orders();
                order.setOrderId(rs.getInt("order_id"));
                order.setUserId(rs.getInt("user_id"));
                order.setRestaurantId(rs.getInt("restaurant_id"));
                order.setAddress(rs.getString("address"));
                order.setPaymentMethod(rs.getString("payment_method"));
                order.setStatus(rs.getString("status"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));

                list.add(order);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
