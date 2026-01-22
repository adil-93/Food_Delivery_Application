<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tap.model.Cart, com.tap.model.CartItem" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shaik's Kitchen | Cart</title>

    <!-- ✅ INTERNAL CSS -->
    <style>
       
      * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Roboto, Arial, sans-serif;
}

/* BODY */
body {
    background-color: #E8DFF7;  /* Light lavender page background */
    min-height: 100vh;
    color: #222;                /* Default text for readability */
    padding: 20px;
}

/* HEADER */
header {
    background-color: rgba(255, 255, 255, 0.3);
    backdrop-filter: blur(10px);
    padding: 18px 32px;
    border-radius: 12px;
    margin-bottom: 30px;
}

.header-container {
    max-width: 1200px;
    margin: auto;
    display: flex;
    align-items: center;
}

.brand {
    font-size: 1.8rem;
    font-weight: 700;
    color: #7B4ABC;             /* Dark lavender for brand */
}

/* CONTAINER */
.container {
    max-width: 900px;
    margin: 0 auto;
    padding: 0 20px;
}

/* CART TITLE */
.cart-title {
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 30px;
    text-align: center;
    color: #4B2C91;             /* Dark lavender title */
    text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
}

/* CART ITEM */
.cart-item {
    background: #ffffff;        /* White card background */
    border-radius: 16px;
    padding: 24px;
    margin-bottom: 20px;
    box-shadow: 0 8px 24px rgba(0,0,0,0.1);
    border: 1px solid rgba(0,0,0,0.05);
    color: #222;                /* Dark text inside card */
}

.cart-details {
    margin-bottom: 20px;
}

.item-name {
    font-size: 1.3rem;
    font-weight: 700;
    margin-bottom: 8px;
    color: #4B2C91;             /* Dark lavender for item names */
}

.item-price,
.item-total {
    font-size: 1.1rem;
    font-weight: 600;
    color: #333;                /* Dark gray for price/total */
    margin-bottom: 4px;
}

/* QUANTITY + ACTIONS ROW */
.quantity-row {
    display: flex;
    justify-content: space-between; /* left = quantity, right = buttons */
    align-items: center;
    gap: 10px;
}

/* Quantity on the left */
.quantity {
    display: flex;
    align-items: center;
    gap: 12px;
}

.qty-btn {
    width: 40px;
    height: 40px;
    border-radius: 10px;
    border: 2px solid #7B4ABC;
    background-color: rgba(123, 74, 188, 0.2);
    color: #7B4ABC;
    font-size: 20px;
    font-weight: 700;
    cursor: pointer;
    transition: all 0.3s ease;
}

.qty-btn:hover:not(:disabled) {
    background-color: #7B4ABC;
    color: #fff;
    transform: scale(1.05);
}

.qty-btn:disabled {
    opacity: 0.3;
    cursor: not-allowed;
}

.qty-value {
    font-size: 1.2rem;
    font-weight: 700;
    min-width: 30px;
    text-align: center;
    color: #222;
}

/* ACTION BUTTONS CONTAINER (RIGHT SIDE) */
.item-actions {
    display: flex;
    gap: 10px;
}

/* Shared style for Add More + Remove */
.item-actions a,
.item-actions button.remove-btn {
    display: inline-block;
    padding: 10px 24px;
    background-color: #B57EDC; /* Medium lavender */
    color: #fff;
    font-weight: 700;
    font-size: 0.95rem;
    border-radius: 12px;
    text-decoration: none;
    cursor: pointer;
    transition: all 0.3s ease;
    text-align: center;
    border: none;
    box-shadow: 0 4px 12px rgba(181, 126, 220, 0.3);
}

.item-actions a:hover,
.item-actions button.remove-btn:hover {
    background-color: #9F6ACD;
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(159, 106, 205, 0.4);
}

/* TOTAL */
.total {
    margin-top: 35px;
    padding: 25px;
    background: #f0e7fc;        /* very light lavender */
    border-radius: 16px;
    text-align: right;
    font-size: 1.6rem;
    font-weight: 700;
    color: #4B2C91;             /* dark lavender total text */
    border: 1px solid rgba(123, 74, 188, 0.3);
    box-shadow: 0 8px 32px rgba(0,0,0,0.1);
}

/* CHECKOUT */
.checkout-section {
    margin-top: 25px;
    text-align: center;
}

.checkout-btn {
    background: linear-gradient(135deg, #B57EDC 0%, #9F6ACD 100%);
    color: #fff;
    border: none;
    padding: 16px 50px;
    border-radius: 30px;
    font-weight: 700;
    font-size: 1.1rem;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 8px 24px rgba(181, 126, 220, 0.4);
    text-transform: uppercase;
    letter-spacing: 1px;
}

.checkout-btn:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 32px rgba(159, 106, 205, 0.5);
}

/* EMPTY CART */
.empty-cart {
    text-align: center;
    padding: 60px 20px;
    background: #ffffff;       /* white card background */
    border-radius: 16px;
    border: 1px solid rgba(0,0,0,0.05);
}

.empty-cart p {
    font-size: 1.3rem;
    margin-bottom: 20px;
    color: #222;
}

/* RESPONSIVE */
@media (max-width: 768px) {
    .cart-title {
        font-size: 1.6rem;
    }

    .quantity-row {
        flex-direction: column;
        align-items: stretch;
    }

    .item-actions {
        justify-content: flex-end;
        margin-top: 8px;
    }

    .quantity {
        justify-content: center;
        margin-bottom: 12px;
    }

    .remove-btn,
    .item-actions a {
        width: auto;
    }

    .total {
        font-size: 1.3rem;
        text-align: center;
    }
}
               
 /* Logo LEFT */
.logo {
    display: flex;
    align-items: center;
    gap: 8px;
    font-size: 1.6rem;
    font-weight: 700;
    color: #6A4C8B;
    white-space: nowrap;
    flex: 0 0 auto; /* take only as much space as needed */
    padding-left: 12px; /* slightly right */
}

.logo img {
    width: 26px;
    height: 26px;
    object-fit: contain;
}
       
    </style>
</head>

<body>

<header>
    <div class="logo">
            <img src="images/dishora.avif" alt="Dishora Logo">
            <span>Shaik's Kitchen</span>
        </div>
    
</header>

<div class="container">
<div class="cart-items">

<div class="cart-title">Your Cart</div>

<%
    Cart cart = (Cart) session.getAttribute("cart");

    Integer restaurantId = (Integer) session.getAttribute("restaurantId");
    if (restaurantId == null) {
        restaurantId = (Integer) session.getAttribute("oldRestaurantId");
    }

    if (cart != null && cart.getItems() != null && !cart.getItems().isEmpty()) {
        for (CartItem item : cart.getItems().values()) {
%>

<div class="cart-item">

    <div class="cart-details">
        <div class="item-name"><%= item.getName() %></div>
        <div class="item-price">Price: ₹<%= item.getPrice() %></div>
        <div class="item-total">Total: ₹<%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></div>
    </div>

    <div class="quantity-row">
        <div class="quantity">

            <!-- DECREASE -->
            <form action="cart" method="post" style="display: inline;">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                <input type="hidden" name="quantity" value="<%= item.getQuantity() - 1 %>">
                <button class="qty-btn" type="submit"
                    <%= item.getQuantity() == 1 ? "disabled" : "" %>>-</button>
            </form>

            <span class="qty-value"><%= item.getQuantity() %></span>

            <!-- INCREASE -->
            <form action="cart" method="post" style="display: inline;">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
                <input type="hidden" name="name" value="<%= item.getName() %>">
                <input type="hidden" name="price" value="<%= item.getPrice() %>">
                <input type="hidden" name="quantity" value="1">
                <button class="qty-btn" type="submit">+</button>
            </form>

        </div>

        <div class="item-actions" style="display: flex; gap: 10px; align-items: center;">
    <!-- ADD MORE ITEMS -->
    <button class="add more btn" type="submit"> <a href="home" class="action-btn add-more-btn">Add More Items</a></button>
   

    <!-- REMOVE -->
    <form action="cart" method="post" style="display: inline;">
        <input type="hidden" name="action" value="remove">
        <input type="hidden" name="itemId" value="<%= item.getItemId() %>">
        <button class="action-btn remove-btn" type="submit">Remove</button>
    </form>
</div>
        
    </div>

</div>

<%
        }
%>

<div class="total">
    Grand Total: ₹<%= String.format("%.2f", cart.getTotalPrice()) %>
</div>




<div class="checkout-section">
<%
    if (session.getAttribute("cart") != null) {
%>
    <form action="checkout.jsp" method="post">
        <input type="submit" value="Proceed to Checkout" class="checkout-btn">
    </form>
<%
    }
%>
</div>


<%
    } else {
%>

<div class="empty-cart">
    <p>Your cart is empty.</p>
    <div class="add-more-items">
        <a href="menu?restaurantId=<%= restaurantId != null ? restaurantId : "" %>">Add More Items</a>
    </div>
</div>

<%
    }
%>

</div>
</div>

</body>
</html>