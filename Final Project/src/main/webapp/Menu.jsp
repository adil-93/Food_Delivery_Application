<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.tap.model.Menu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shaik's Kitchen | Menu</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        
        * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Roboto, Arial, sans-serif;
}

body {
    background-color: #E8DFF7;
    color: #222;
}

/* HEADER */
header {
    background-color: #ffffff;
    padding: 16px 30px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.08);
    position: sticky;
    top: 0;
    z-index: 100;
}

.header-container {
    max-width: 1200px;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.brand {
    font-size: 1.7rem;
    font-weight: 700;
    color: #e23744;
}
/* HEADER TEXT */
header .brand,
header h3 {
    font-weight: 700;                /* Bold text */
    color: #7B4ABC;                  /* Darker lavender */
}


/* GRID LAYOUT */
.container {
    max-width: 1200px;
    margin: 30px auto;
    padding: 0 20px;
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 24px;
}

/* MENU CARD */
.menu-item {
    background-color: #ffffff;  /* Light lavender background */
    border-radius: 18px;
    box-shadow: 0 8px 24px rgba(0,0,0,0.08);
    display: flex;
    flex-direction: column;
    overflow: hidden;
    transition: transform 0.25s ease, box-shadow 0.25s ease;
}


.menu-item:hover {
    transform: translateY(-6px);
    box-shadow: 0 14px 32px rgba(0,0,0,0.15);
}

/* IMAGE (TOP, FULL WIDTH) */
.item-image {
    width: 100%;
    height: 180px;
    overflow: hidden;
    order: -1; /* IMAGE FIRST */
}

.item-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    display: block;
}

/* DETAILS */
.item-details {
    padding: 14px;
    display: flex;
    flex-direction: column;
    flex-grow: 1;
    order: 2;
}

.item-name {
    font-size: 1.05rem;
    font-weight: 600;
    margin-bottom: 6px;
}

.item-desc {
    font-size: 0.85rem;
    color: #666;
    margin-bottom: 10px;
    line-height: 1.4;
}

.item-price {
    font-size: 1rem;
    font-weight: 700;
    color: #2e7d32;
    margin-bottom: 12px;
}

/* ADD TO CART */
.cart-form {
    margin-top: auto;
}

.cart-form button {
    width: 100%;
    border: 1px solid #B57EDC;
    background-color: #B57EDC;
    color: #ffffff;
    font-weight: 600;
    padding: 10px 0;
    border-radius: 10px;
    cursor: pointer;
    transition: all 0.2s ease;
}

.cart-form button:hover {
    background-color: #9F6ACD; /* slightly darker lavender */
    border-color: #9F6ACD;
}


/* MOBILE */
@media (max-width: 480px) {
    .item-image {
        height: 140px;
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

.menu-message-container {
    display: flex;
    justify-content: center;  /* center horizontally */
    align-items: center;      /* center vertically if needed */
    width: 100%;              /* take full width of parent */
    margin: 20px 0;           /* spacing above the grid */
    min-height: 50px;         /* reserve space for the animation */
}

.menu-typing-text {
    font-size: 1.5rem;
    font-weight: 600;
    color: #6A4C8B;           /* matches your theme */
    white-space: nowrap;       /* prevent wrapping */
}

.menu-typing-text::after {
    content: '|';
    animation: blink 0.7s infinite;
    margin-left: 5px;
}

@keyframes blink {
  0%, 50%, 100% { opacity: 1; }
  25%, 75% { opacity: 0; }
}


             
        
    </style>
</head>

<body>

<header>
    <div class="header-container">
         <div class="logo">
            <img src="images/dishora.avif" alt="Dishora Logo">
            <span>Shaik's Kitchen</span>
        </div>
        
       <div class="logo">
            <img src="images/menu-logo.png" alt="Dishora Logo">
            <span>Menu</span>
        </div>
    </div>
</header>

<div class="menu-message-container">
    <span class="menu-typing-text"></span>
</div>


<div class="container">

<%
    List<Menu> menuList = (List<Menu>) request.getAttribute("menus");

    if (menuList != null) {
        for (Menu m : menuList) {
%>

    <div class="menu-item">

        <div class="item-details">
            <div class="item-name"><%= m.getName() %></div>

            <div class="item-desc"><%= m.getDescription() %></div>

            <div class="item-price">₹ <%= m.getPrice() %></div>

            <!-- ✅ FIXED ADD TO CART FORM -->
            <form action="cart" method="post" class="cart-form">

                <input type="hidden" name="action" value="add">

                <input type="hidden" name="restaurantId" value="<%= m.getRestaurantId() %>">

                <input type="hidden" name="itemId" value="<%= m.getMenuId() %>">

                <!-- 🔴 THESE WERE MISSING EARLIER -->
                <input type="hidden" name="name" value="<%= m.getName() %>">
                <input type="hidden" name="price" value="<%= m.getPrice() %>">

                <input type="hidden" name="quantity" value="1">

                <button type="submit">Add To Cart</button>

            </form>
        </div>

        <div class="item-image">
            <img src="<%= m.getImageUrl() %>" alt="<%= m.getName() %>">
        </div>

    </div>

<%
        }
    } else {
%>

    <p>No menu items available.</p>

<%
    }
%>

</div>

<script>
const menuMessages = [
    "Good vibes, full plates, happy hearts! ❤️🍴😋",
    "Eat, laugh, love… and then repeat! 😍🍽️😂",
    "Happiness is served on a plate! 💜🥗🍕",
    "Food + Fun + Friends = Perfect Day! 😋🍰🥳",
    "Life’s too short for boring meals! ❤️🍔🍩"
];

const menuTypingText = document.querySelector(".menu-typing-text");
let msgIndex = 0;
let charIndex = 0;
let typingSpeed = 100;  // ms per character
let eraseSpeed = 50;    // ms per character
let delayBetween = 1500; // wait before erasing

function typeMenuMessage() {
  if (charIndex < menuMessages[msgIndex].length) {
    menuTypingText.textContent += menuMessages[msgIndex].charAt(charIndex);
    charIndex++;
    setTimeout(typeMenuMessage, typingSpeed);
  } else {
    setTimeout(eraseMenuMessage, delayBetween);
  }
}

function eraseMenuMessage() {
  if (charIndex > 0) {
    menuTypingText.textContent = menuMessages[msgIndex].substring(0, charIndex - 1);
    charIndex--;
    setTimeout(eraseMenuMessage, eraseSpeed);
  } else {
    msgIndex = (msgIndex + 1) % menuMessages.length; // loop to next message
    setTimeout(typeMenuMessage, 500);
  }
}

// start typing
typeMenuMessage();
</script>



</body>
</html>
