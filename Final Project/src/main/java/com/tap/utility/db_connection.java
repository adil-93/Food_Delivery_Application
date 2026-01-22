package com.tap.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class db_connection {

    private static final String URL =
        "jdbc:mysql://localhost:3306/daoaug";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "Adil@9392";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (Exception e) {
            throw new RuntimeException("Database connection failed", e);
        }
    }
}
