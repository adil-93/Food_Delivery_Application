package com.tap.DAOimplementation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.RestaurantDAO;
import com.tap.model.Restaurant;
import com.tap.utility.db_connection;

public class RestaurantDAOImpl implements RestaurantDAO {
	
	private Connection connection;
	public RestaurantDAOImpl() throws ClassNotFoundException, SQLException{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = db_connection.getConnection();

	}

    private static final String ADD_RESTAURANT =
        "INSERT INTO restaurant (restaurant_id,restaurant_name, admin_id, address, cuisine_type, rating, eta, image_url, is_available) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String GET_RESTAURANT =
        "SELECT * FROM restaurant WHERE restaurant_id = ?";

    private static final String UPDATE_RESTAURANT =
        "UPDATE restaurant SET restaurant_name = ?, admin_id = ?, address = ?, cuisine_type = ?, " +
        "rating = ?, eta = ?, image_url = ?, is_available = ? WHERE restaurant_id = ?";

    private static final String DELETE_RESTAURANT =
        "DELETE FROM restaurant WHERE restaurant_id = ?";

    private static final String GET_ALL_RESTAURANTS =
        "SELECT * FROM restaurant";

    @Override
    public void addRestaurant(Restaurant r) {
        Connection connection = db_connection.getConnection();

        try (PreparedStatement ps = connection.prepareStatement(ADD_RESTAURANT)) {

            ps.setInt(1, r.getRestaurantId());
            ps.setString(2, r.getRestaurantName());
            ps.setInt(3, r.getAdminId());
            ps.setString(4, r.getAddress());
            ps.setString(5, r.getCuisineType());
            ps.setDouble(6, r.getRating());
            ps.setInt(7, r.getEta());
            ps.setString(8, r.getImageUrl());
            ps.setBoolean(9, r.isAvailable());

            ps.executeUpdate();
            System.out.println("Restaurant inserted successfully!");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Restaurant getRestaurant(int id) {
        Connection connection = db_connection.getConnection();
        Restaurant r = null;

        try (PreparedStatement ps = connection.prepareStatement(GET_RESTAURANT)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                r = new Restaurant(
                        rs.getInt("restaurant_id"),
                        rs.getString("restaurant_name"),
                        rs.getInt("admin_id"),
                        rs.getString("address"),
                        rs.getString("cuisine_type"),
                        rs.getDouble("rating"),
                        rs.getInt("eta"),
                        rs.getString("image_url"),
                        rs.getBoolean("is_available")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return r;
    }

    @Override
    public void updateRestaurant(Restaurant r) {
        Connection connection = db_connection.getConnection();

        try (PreparedStatement ps = connection.prepareStatement(UPDATE_RESTAURANT)) {

            ps.setString(1, r.getRestaurantName());
            ps.setInt(2, r.getAdminId());
            ps.setString(3, r.getAddress());
            ps.setString(4, r.getCuisineType());
            ps.setDouble(5, r.getRating());
            ps.setInt(6, r.getEta());
            ps.setString(7, r.getImageUrl());
            ps.setBoolean(8, r.isAvailable());
            ps.setInt(9, r.getRestaurantId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteRestaurant(int id) {
        Connection connection = db_connection.getConnection();

        try (PreparedStatement ps = connection.prepareStatement(DELETE_RESTAURANT)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        Connection connection = db_connection.getConnection();
        List<Restaurant> restaurantList = new ArrayList<>();

        try (PreparedStatement ps = connection.prepareStatement(GET_ALL_RESTAURANTS);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Restaurant r = new Restaurant(
                        rs.getInt("restaurant_id"),
                        rs.getString("restaurant_name"),
                        rs.getInt("admin_id"),
                        rs.getString("address"),
                        rs.getString("cuisine_type"),
                        rs.getDouble("rating"),
                        rs.getInt("eta"),
                        rs.getString("image_url"),
                        rs.getBoolean("is_available")
                );

                restaurantList.add(r);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return restaurantList;
    }
}
