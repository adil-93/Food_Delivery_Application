package com.tap.servlets;

import com.tap.DAO.OrdersDAO;
import com.tap.DAOimplementation.OrdersDAOImpl;
import com.tap.model.Orders;
import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private OrdersDAO ordersDAO = new OrdersDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get form data
        String address = request.getParameter("address");
        String paymentMethod = request.getParameter("paymentMethod");
        Integer restaurantId = (Integer) session.getAttribute("restaurantId");
        Double totalAmount = (Double) session.getAttribute("totalAmount"); // or calculate from cart

        if (restaurantId == null || totalAmount == null) {
            response.sendRedirect("cart.jsp");
            return;
        }

        // Create Order object
        Orders order = new Orders();
        order.setUserId(user.getUserid());
        order.setRestaurantId(restaurantId);
        order.setAddress(address);
        order.setPaymentMethod(paymentMethod);
        order.setStatus("Placed");
        order.setOrderDate(new Timestamp(System.currentTimeMillis()));
        order.setTotalAmount(totalAmount);

        // Save to DB
        int orderId = ordersDAO.addOrder(order);

        if (orderId > 0) {
            // Clear cart after order
            session.removeAttribute("cart");
            response.sendRedirect("orderPlaced.jsp");
        } else {
            response.sendRedirect("checkout.jsp?error=fail");
        }
    }
}
