package com.tap.servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.tap.DAOimplementation.MenuDAOImpl;
import com.tap.model.Menu;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        System.out.println("MenuServlet called");
        
        // Get restaurantId parameter with null check
        String ridParam = req.getParameter("restaurantId");
        
        // Validate parameter
        if (ridParam == null || ridParam.equals("null") || ridParam.isEmpty()) {
            resp.sendRedirect("home.jsp");
            return;
        }
        
        int rid = Integer.parseInt(ridParam);
        
        // Get menu list from database
        MenuDAOImpl daoImpl = new MenuDAOImpl();
        List<Menu> menuList = daoImpl.getAllMenusByRestaurant(rid);
        
        // Set attribute and forward to Menu.jsp
        req.setAttribute("menus", menuList);
        RequestDispatcher rd = req.getRequestDispatcher("Menu.jsp");
        rd.forward(req, resp);
    }
}
