package com.tap.DAOimplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.MenuDAO;
import com.tap.model.Menu;
import com.tap.utility.db_connection;

public class MenuDAOImpl implements MenuDAO {

    private static final String ADD_MENU =
        "INSERT INTO menu (restaurant_id, name, description, price, rating, image_url, type, is_available) " +
        "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String GET_MENU =
        "SELECT * FROM menu WHERE menu_id = ?";

    private static final String UPDATE_MENU =
        "UPDATE menu SET restaurant_id = ?, name = ?, description = ?, price = ?, rating = ?, " +
        "image_url = ?, type = ?, is_available = ? WHERE menu_id = ?";

    private static final String DELETE_MENU =
        "DELETE FROM menu WHERE menu_id = ?";

    private static final String GET_ALL_MENUS_BY_RESTAURANT =
        "SELECT * FROM menu WHERE restaurant_id = ?";

    // ✅ Constructor (OPTIONAL)
    public MenuDAOImpl() {
        // No need to manually load driver in modern JDBC
    }

    @Override
    public void addMenu(Menu menu) {
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(ADD_MENU)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setDouble(5, menu.getRating());
            ps.setString(6, menu.getImageUrl());
            ps.setString(7, menu.getType());
            ps.setBoolean(8, menu.isAvailable());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Menu getMenu(int menuId) {
        Menu menu = null;

        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_MENU)) {

            ps.setInt(1, menuId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                menu = new Menu(
                    rs.getInt("menu_id"),
                    rs.getInt("restaurant_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getDouble("rating"),
                    rs.getString("image_url"),
                    rs.getString("type"),
                    rs.getBoolean("is_available")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menu;
    }

    @Override
    public void updateMenu(Menu menu) {
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_MENU)) {

            ps.setInt(1, menu.getRestaurantId());
            ps.setString(2, menu.getName());
            ps.setString(3, menu.getDescription());
            ps.setDouble(4, menu.getPrice());
            ps.setDouble(5, menu.getRating());
            ps.setString(6, menu.getImageUrl());
            ps.setString(7, menu.getType());
            ps.setBoolean(8, menu.isAvailable());
            ps.setInt(9, menu.getMenuId());

            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteMenu(int menuId) {
        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_MENU)) {

            ps.setInt(1, menuId);
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Menu> getAllMenusByRestaurant(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();

        try (Connection con = db_connection.getConnection();
             PreparedStatement ps = con.prepareStatement(GET_ALL_MENUS_BY_RESTAURANT)) {

            ps.setInt(1, restaurantId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Menu menu = new Menu(
                    rs.getInt("menu_id"),
                    rs.getInt("restaurant_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getDouble("rating"),
                    rs.getString("image_url"),
                    rs.getString("type"),
                    rs.getBoolean("is_available")
                );
                menuList.add(menu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }
}
