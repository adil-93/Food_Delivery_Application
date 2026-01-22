package com.tap.servlets;

import com.tap.model.User;
import com.tap.utility.db_connection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get user input from registration form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        response.setContentType("text/html");

        // Simple validation
        if (username == null || password == null || email == null || address == null ||
            username.isEmpty() || password.isEmpty() || email.isEmpty() || address.isEmpty()) {
            response.getWriter().println("All fields are required. Please go back and fill the form.");
            return;
        }

        try (Connection conn = db_connection.getConnection()) {

            // Check if username or email already exists
            String checkQuery = "SELECT * FROM users WHERE username = ? OR email = ?";
            try (PreparedStatement checkStmt = conn.prepareStatement(checkQuery)) {
                checkStmt.setString(1, username);
                checkStmt.setString(2, email);

                ResultSet rs = checkStmt.executeQuery();
                if (rs.next()) {
                    response.getWriter().println("Username or Email already exists. Please choose another.");
                    return;
                }
            }

            // Insert new user into database
            String insertQuery = "INSERT INTO users (username, password, email, address, role) VALUES (?, ?, ?, ?, ?)";
            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery)) {
                insertStmt.setString(1, username);
                insertStmt.setString(2, password); // In production, hash the password!
                insertStmt.setString(3, email);
                insertStmt.setString(4, address);
                insertStmt.setString(5, "customer"); // Default role

                int rows = insertStmt.executeUpdate();
                if (rows > 0) {
                    // Registration successful
                    response.sendRedirect("login.jsp");
                } else {
                    response.getWriter().println("Registration failed. Please try again.");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET request to registration page
        response.sendRedirect("register.jsp");
    }
}
