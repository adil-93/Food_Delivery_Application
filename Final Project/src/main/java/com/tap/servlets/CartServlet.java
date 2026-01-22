package com.tap.servlets;
import java.io.IOException;

import com.tap.model.Cart;
import com.tap.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Cart servlet HIT");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");

        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
            System.out.println("New cart created");
        }

        String action = request.getParameter("action");
        System.out.println("Action = " + action);

        boolean cartModified = false;

        if (action != null) {
            switch (action) {
                case "add":
                    cartModified = addItemToCart(request, cart);
                    break;
                case "update":
                    cartModified = updateCartItem(request, cart);
                    break;
                case "remove":
                    cartModified = removeItemFromCart(request, cart);
                    break;
                case "clear":
                    cart.clear();
                    cartModified = true;
                    break;
            }
        }

        session.setAttribute("cart", cart);
        System.out.println("Cart size = " + cart.getItems().size());

        if (cartModified) {
            response.sendRedirect("cart.jsp");
        } else {
            response.sendRedirect("menu.jsp");
        }
    }

    private boolean addItemToCart(HttpServletRequest request, Cart cart) {
        try {
            String itemId = request.getParameter("itemId");
            String name = request.getParameter("name");
            String price = request.getParameter("price");
            String quantity = request.getParameter("quantity");

            System.out.println("Add Params: " + itemId + ", " + name + ", " + price + ", " + quantity);

            if (itemId == null || name == null || price == null || quantity == null) {
                return false;
            }

            CartItem item = new CartItem(
                    Integer.parseInt(itemId),
                    name,
                    Integer.parseInt(quantity),
                    Double.parseDouble(price)
            );

            cart.addItem(item);
            return true;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean updateCartItem(HttpServletRequest request, Cart cart) {
        try {
            cart.updateItem(
                    Integer.parseInt(request.getParameter("itemId")),
                    Integer.parseInt(request.getParameter("quantity"))
            );
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private boolean removeItemFromCart(HttpServletRequest request, Cart cart) {
        try {
            cart.removeItem(Integer.parseInt(request.getParameter("itemId")));
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
