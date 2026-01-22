package com.tap.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.tap.DAOimplementation.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class HomeServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("home servlet called");
		
		try {
			RestaurantDAOImpl restaurantDAO = new RestaurantDAOImpl();
			List<Restaurant> allRestaurants = restaurantDAO.getAllRestaurants();
			req.setAttribute("restaurants", allRestaurants);
			
			RequestDispatcher rd = req.getRequestDispatcher("Home.jsp");
			rd.forward(req,  resp);
			
			
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

}
