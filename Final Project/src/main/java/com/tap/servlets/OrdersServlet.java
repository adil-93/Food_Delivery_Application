package com.tap.servlets;

import com.tap.DAO.OrdersDAO;
import com.tap.DAOimplementation.OrdersDAOImpl;
import com.tap.model.Orders;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/orders")
public class OrdersServlet extends HttpServlet {

    private OrdersDAO ordersDAO = new OrdersDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUserid();  // FIXED: correct getter name

        List<Orders> ordersList = ordersDAO.getOrdersByUserId(userId);

        request.setAttribute("ordersList", ordersList);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
}
