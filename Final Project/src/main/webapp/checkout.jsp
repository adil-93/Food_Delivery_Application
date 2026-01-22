<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart" %>
<%@ page import="com.tap.model.CartItem" %>
<%@ page import="com.tap.model.User" %>
<%@ page import="java.util.Map" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout - FoodExpress</title>
    <style>
        /* GLOBAL STYLES */
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: "Segoe UI", Roboto, Arial, sans-serif; }
        body { background-color: #E8DFF7; min-height: 100vh; color: #222; padding: 20px; }

        /* CONTAINER */
        .container {
            max-width: 600px;           
            margin: 30px auto;
            background-color: #ffffff;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
        }

        /* BACK TO CART BUTTON */
        .back-link {
            display: inline-block;
            padding: 10px 20px;
            background: #B57EDC; 
            color: #fff;
            font-weight: 700;
            font-size: 1rem;
            border-radius: 8px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(181, 126, 220, 0.3);
            margin-bottom: 20px;
        }
        .back-link:hover {
            background: #9F6ACD;
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(159, 106, 205, 0.4);
        }

        /* PAGE TITLE */
        h1 { color: #4B2C91; margin-bottom: 30px; text-align: center; font-size: 2rem; }

        /* ORDER SUMMARY */
        .order-summary {
            background-color: #f8f4fc;
            padding: 20px;
            border-radius: 12px;
            margin-bottom: 30px;
            border: 1px solid rgba(123, 74, 188, 0.2);
        }
        .order-summary h2 { color: #4B2C91; margin-bottom: 15px; font-size: 1.5rem; }

        .cart-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 10px;
            background-color: #ffffff;
            border-radius: 8px;
            margin-bottom: 10px;
            box-shadow: 0 3px 10px rgba(123, 74, 188, 0.1);
        }
        .item-details { flex: 1; }
        .item-name { font-weight: 700; font-size: 1.1rem; color: #4B2C91; margin-bottom: 4px; }
        .item-quantity { font-size: 0.9rem; color: #666; }
        .item-price { font-weight: 700; color: #7B4ABC; font-size: 1rem; }

        .total-amount {
            display: flex; justify-content: space-between;
            padding: 15px 10px;
            margin-top: 15px;
            border-top: 2px solid #7B4ABC;
            font-size: 1.3rem; font-weight: 700; color: #4B2C91;
        }

        /* CHECKOUT FORM */
        .checkout-form { width: 100%; }
        .form-section { margin-bottom: 25px; }
        .form-section h3 {
            color: #4B2C91;
            margin-bottom: 12px;
            font-size: 1.3rem;
            border-bottom: 2px solid #7B4ABC;
            padding-bottom: 8px;
        }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 6px; color: #555; font-weight: 600; font-size: 1rem; }
        input[type="text"], input[type="email"], input[type="tel"], textarea, select {
            width: 100%;
            padding: 10px 12px;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            font-family: inherit;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus, input[type="email"]:focus, input[type="tel"]:focus, textarea:focus, select:focus {
            outline: none; border-color: #7B4ABC;
        }
        textarea { resize: vertical; min-height: 80px; }

        /* PLACE ORDER BUTTON */
        .btn-place-order {
            background: linear-gradient(135deg, #B57EDC 0%, #9F6ACD 100%);
            color: #fff;
            padding: 14px 0;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1.1rem;
            font-weight: 700;
            width: 100%;
            margin-top: 20px;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(181, 126, 220, 0.3);
        }
        .btn-place-order:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(159, 106, 205, 0.4);
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .container { padding: 20px; margin: 20px; }
            h1 { font-size: 1.8rem; }
            .cart-item { flex-direction: column; align-items: flex-start; }
            .item-price { margin-top: 8px; }
        }
    </style>
</head>
<body>

<%
    Cart cart = (Cart) session.getAttribute("cart");
    User user = (User) session.getAttribute("user");
    Integer restaurantId = (Integer) session.getAttribute("restaurantId");

    if (cart == null || cart.getItems().isEmpty()) {
        response.sendRedirect("cart.jsp");
        return;
    }

    double totalAmount = 0.0;
    for (CartItem item : cart.getItems().values()) {
        totalAmount += item.getQuantity() * item.getPrice();
    }
%>

<div class="container">
    <a href="cart.jsp" class="back-link">← Back to Cart</a>

    <h1>Checkout</h1>

    <!-- ORDER SUMMARY -->
    <div class="order-summary">
        <h2>Order Summary</h2>
        <%
            for (CartItem item : cart.getItems().values()) {
        %>
        <div class="cart-item">
            <div class="item-details">
                <div class="item-name"><%= item.getName() %></div>
                <div class="item-quantity">
                    Quantity: <%= item.getQuantity() %> × ₹<%= String.format("%.2f", item.getPrice()) %>
                </div>
            </div>
            <div class="item-price">
                ₹<%= String.format("%.2f", item.getQuantity() * item.getPrice()) %>
            </div>
        </div>
        <%
            }
        %>
        <div class="total-amount">
            <span>Total Amount:</span>
            <span>₹<%= String.format("%.2f", totalAmount) %></span>
        </div>
    </div>

    <!-- CHECKOUT FORM -->
    <form action="checkout" method="post" class="checkout-form">
        <input type="hidden" name="restaurantId" value="<%= restaurantId %>">
        <input type="hidden" name="redirectAfterLogin" value="checkout">

        <!-- DELIVERY DETAILS -->
        <div class="form-section">
            <h3>Delivery Details</h3>
            <div class="form-group">
                <label for="fullname">Full Name</label>
                <input type="text" name="fullname" id="fullname" required placeholder="Enter your full name">
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="tel" name="phone" id="phone" required placeholder="Enter phone number">
            </div>
           
            <div class="form-group">
                <label for="address">Delivery Address</label>
                <textarea name="address" id="address" required placeholder="Enter full delivery address"></textarea>
            </div>
        </div>

        <!-- PAYMENT INFORMATION -->
        <!-- PAYMENT INFORMATION -->
<div class="form-section">
    <h3>Payment Information</h3>

    <div class="form-group">
        <label for="paymentMethod">Payment Method</label>
        <select name="paymentMethod" id="paymentMethod" required>
            <option value="">-- Select Payment Method --</option>
            <option value="Cash on Delivery">Cash on Delivery</option>
            <option value="UPI">UPI</option>
        </select>
    </div>

    <div class="form-group">
        <label for="upiApp">Select UPI App <span style="font-size:0.85rem; color:#666;">(if UPI selected)</span></label>
        <select name="upiApp" id="upiApp">
            <option value="">-- Select UPI App --</option>
            <option value="PhonePe">PhonePe</option>
            <option value="Paytm">Paytm</option>
            <option value="Razorpay">Razorpay</option>
            <option value="GooglePay">Google Pay</option>
        </select>
    </div>
</div>
        

        <button type="submit" class="btn-place-order">Place Order</button>
    </form>
</div>

</body>
</html>
