<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List, com.tap.model.Restaurant" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shaik's Kitchen | Restaurants</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: "Segoe UI", Roboto, Arial, sans-serif;
        }

        /* ===== Page Background ===== */
        body {
            background-color: #E8DFF7; /* light lavender */
            color: #222;
        }

        header {
            background-color: #ffffff;
            padding: 14px 30px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            position: sticky;
            top: 0;
            z-index: 100;
        }

       /* Container layout */
.nav-container {
    display: flex;
    align-items: center;
    justify-content: space-between; /* ensures left/center/right alignment */
    max-width: 1300px;
    margin: auto;
    padding: 0 20px; /* optional padding on sides */
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

/* Search CENTER */
.search-bar {
    flex: 1; /* center will take remaining space */
    max-width: 400px;
    margin: 0 20px; /* optional spacing */
}

.search-bar input {
    width: 100%;
    padding: 10px 14px;
    border-radius: 8px;
    border: 2px solid #e0ccff;
    font-size: 0.95rem;
    outline: none;
    transition: all 0.3s ease;
}

.search-bar input:focus {
    border-color: #c89cff;
    box-shadow: 0 0 8px rgba(200, 156, 255, 0.3);
}

/* Nav RIGHT */
.nav-right {
    flex: 0 0 auto; /* take only as much space as needed */
    display: flex;
   }

.nav-right ul {
    display: flex;
    list-style: none;
    gap: 22px;
}

/* Navigation buttons */
.nav-right ul li a {
    text-decoration: none;
    font-weight: 500;
    color: #fff;
    background-color: #d9b3ff;
    padding: 10px 18px;
    border-radius: 12px;
    transition: all 0.3s ease;
    font-size: 0.95rem;
}

.nav-right ul li a:hover {
    background-color: #c89cff;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.15);
}
       
        /* ===== Main Container ===== */
        .container {
            width: 100%;
            margin: 30px auto 0;
            padding-bottom: 40px;
            background-color: #f3f0fa; /* REQUIRED for visibility */
        }

        .container h1 {
            margin-bottom: 24px;
            font-size: 1.8rem;
            color: #333;
            font-weight: 600;
            padding: 0 30px;
        }

        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
            padding: 0 30px;
        }

        /* ===== Restaurant Card ===== */
        .restaurant-card {
            background-color: #ffffff;
            border-radius: 14px;
            overflow: hidden;
            border: 1px solid #e1e1e8;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            position: relative;
        }

        .restaurant-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 14px 30px rgba(0, 0, 0, 0.14);
        }

        .restaurant-card a {
            text-decoration: none;
            color: inherit;
            display: block;
        }

        .restaurant-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .availability {
            position: absolute;
            top: 12px;
            left: 12px;
            padding: 6px 14px;
            font-size: 0.83rem;
            font-weight: 600;
            border-radius: 18px;
            color: #fff;
        }

        .available {
            background-color: #28a745;
        }

        .closed {
            background-color: #dc3545;
        }

        .card-body {
            padding: 20px;
            background-color: #ffffff;
        }

        .card-body h2 {
            font-size: 1.25rem;
            margin-bottom: 8px;
            color: #222;
            font-weight: 600;
        }

        .cuisine {
            font-size: 0.95rem;
            color: #666;
            margin-bottom: 12px;
        }

       .restaurant-metadata {
    display: flex;
    align-items: center;
    gap: 18px;
    font-size: 0.9rem;
    margin-top: 8px;
    color: #555; /* base text color */
}

.restaurant-metadata .rating {
    display: flex;
    align-items: center;
    font-weight: 600;
}

.restaurant-metadata .rating .star {
    color: #28a745; /* green star */
    margin-right: 4px;
    font-size: 1rem;
}

.restaurant-metadata .rating .rating-number {
    color: #222; /* rating number dark/neutral */
}

.restaurant-metadata .eta {
    display: flex;
    align-items: center;
    gap: 4px;
    color: #888;
    font-weight: 500;
    font-size: 0.88rem;
}
       

        footer {
            text-align: center;
            padding: 20px;
            font-size: 0.85rem;
            color: #777;
            margin-top: 40px;
        }

        /* ===== Welcome Section ===== */
        .welcome-section {
            height: 420px;
            background: url("images/home-image.jpg") center / cover no-repeat;
            display: flex;
            align-items: center;
            padding: 0 60px;
            color: white;
        }

        .welcome-content h1 {
            font-size: 2.5rem;
            margin-bottom: 16px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
        }

        .welcome-content p {
            font-size: 1.1rem;
            line-height: 1.6;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
        }
        
       /* Footer overall */
.footer {
    background-color: #dfcfff; /* very light lavender */
    color: #4d2e8c; /* dark lavender for text contrast */
    padding: 40px 30px 20px;
    font-family: "Segoe UI", Roboto, Arial, sans-serif;
}

/* Container grid */
.footer-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 32px;
    max-width: 1300px;
    margin: auto;
}

/* Brand & description */
.footer-brand .logo {
    font-size: 1.8rem;
    font-weight: 700;
    color: #6A4C8B; /* darker lavender for contrast */
    margin-bottom: 12px;
}

.footer-brand p {
    font-size: 0.95rem;
    line-height: 1.6;
    color: #4d2e8c; /* text readable on light lavender */
}

/* Footer headings */
.footer-links h3,
.footer-contact h3,
.footer-social h3 {
    font-size: 1.1rem;
    margin-bottom: 12px;
    color: #6A4C8B; /* headings darker for contrast */
}

/* Lists */
.footer-links ul {
    list-style: none;
    padding: 0;
}

.footer-links ul li {
    margin-bottom: 8px;
}

.footer-links ul li a {
    color: #4d2e8c; /* text links visible */
    text-decoration: none;
    transition: all 0.3s ease;
}

.footer-links ul li a:hover {
    color: #6A4C8B; /* darker lavender on hover */
}

/* Social icons */
.social-icons a {
    display: inline-block;
    font-size: 1.2rem;
    margin-right: 12px;
    color: #4d2e8c;
    transition: all 0.3s ease;
}

.social-icons a:hover {
    color: #6A4C8B;
    transform: scale(1.2);
}

/* Footer bottom */
.footer-bottom {
    text-align: center;
    margin-top: 30px;
    font-size: 0.85rem;
    color: #4d2e8c; /* consistent with text */
    border-top: 1px solid rgba(106,76,139,0.2);
    padding-top: 16px;
}
       
 .typing-animation {
  font-size: 2rem;
  font-weight: 600;
  color: #6A4C8B;
  min-height: 60px;
  display: flex;
  align-items: center;
  margin-bottom: 20px;
}

.typing-text::after {
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
    <div class="nav-container">

        <!-- LEFT: Logo -->
        <div class="logo">
            <img src="images/dishora.avif" alt="Dishora Logo">
            <span>Shaik's Kitchen</span>
        </div>

        <!-- CENTER: Search -->
        <div class="search-bar">
    <input type="text" placeholder="🔍 Search restaurants or cuisines">
    
</div>
        

        <!-- RIGHT: Navigation -->
        <nav class="nav-right">
            <ul>
                <li><a href="Home.jsp">🏠Home</a></li>
                <li><a href="login.jsp">→Login</a></li>
                <li><a href="register.jsp">👤+Register</a></li>
                <li><a href="cart.jsp">🛒Cart</a></li>
            </ul>
        </nav>

    </div>
</header>

<div class="welcome-section">
    <div class="welcome-content">
        <h1>Fresh Flavors, Delivered with Care</h1>
        <div class="typing-animation">
  <span class="typing-text"></span>
</div>
        
    </div>
</div>

<div class="container">
    <h1>Restaurants You May Like</h1>

    <div class="restaurant-grid">
        <%
            List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
            for (Restaurant r : restaurants) {
        %>
        <div class="restaurant-card">
            <a href="menu?restaurantId=<%= r.getRestaurantId() %>">
                <img src="<%= r.getImageUrl() %>">
                <div class="availability available">Available</div>
                <div class="card-body">
                    <h2><%= r.getRestaurantName() %></h2>
                    <div class="cuisine"><%= r.getCuisineType() %></div>
                    <div class="restaurant-metadata">
                        <span class="rating">
        <span class="star">★</span> <%= r.getRating() %>
    </span>
                        <span class="eta">⏱ <%= r.getEta() %> mins</span>
                    </div>
                </div>
            </a>
        </div>
        <%
            }
        %>
    </div>
</div>

<footer class="footer">
    <div class="footer-container">

        <!-- Logo & Description -->
        <div class="footer-brand">
            <h2 class="logo">Shaik's Kitchen</h2>
            <p>Fresh flavors delivered straight to your door. Your favorite restaurants, groceries, and sweets—all in one place.</p>
        </div>

        <!-- Quick Links -->
        <div class="footer-links">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="home.jsp">Home</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp">Profile</a></li>
            </ul>
        </div>

        <!-- Contact Info -->
        <div class="footer-contact">
            <h3>Contact Us</h3>
            <p>Email: support@Shaik.com</p>
            <p>Phone: +91 9392695312</p>
            <p>Address: 123 Shaik's Street, Food City</p>
        </div>

        <!-- Social Media -->
        <div class="footer-social">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#"><span>📘</span></a>
                <a href="#"><span>🐦</span></a>
                <a href="#"><span>📸</span></a>
                <a href="#"><span>▶️</span></a>
            </div>
        </div>

    </div>

    <div class="footer-bottom">
        © <%= java.time.Year.now() %> Shaik's Kitchen. All rights reserved.
    </div>
</footer>
<script>
const quotes = [
  "Fresh Flavors, Delivered with Care",
  "Your Favorite Restaurants at Your Doorstep",
  "Taste the Best Dishes from Local Gems",
  "Quick Delivery, Always Hot and Fresh"
];

const typingText = document.querySelector(".typing-text");
let quoteIndex = 0;
let charIndex = 0;
let typingSpeed = 100; // ms per character
let eraseSpeed = 50;   // ms per character
let delayBetween = 1500; // wait before erasing

function typeQuote() {
  if (charIndex < quotes[quoteIndex].length) {
    typingText.textContent += quotes[quoteIndex].charAt(charIndex);
    charIndex++;
    setTimeout(typeQuote, typingSpeed);
  } else {
    setTimeout(eraseQuote, delayBetween);
  }
}

function eraseQuote() {
  if (charIndex > 0) {
    typingText.textContent = quotes[quoteIndex].substring(0, charIndex - 1);
    charIndex--;
    setTimeout(eraseQuote, eraseSpeed);
  } else {
    quoteIndex = (quoteIndex + 1) % quotes.length; // loop to next quote
    setTimeout(typeQuote, 500);
  }
}

// start typing
typeQuote();
</script>


</body>
</html>
