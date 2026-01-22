package com.tap.servlets;

import java.io.IOException;

import com.tap.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");

        String ogPassword = "Dec2025";

        if (password != null && password.equals(ogPassword)) {

            // 1️⃣ Create a User object
            User user = new User();
            user.setUserid(1);       // Replace with actual DB user ID if available
            user.setUsername(username);

            // 2️⃣ Store the User object in session
            HttpSession session = req.getSession();
            session.setAttribute("user", user);  // ✅ store proper User object

            // 3️⃣ Redirect to order placed page
            resp.sendRedirect("orderPlaced.jsp");

        } else {
            resp.sendRedirect("login.jsp?error=invalid");
        }
    }
}
