.

🍔 Food Delivery Application (Java Web App)
📌 Project Description

The Food Delivery Application is a Java-based web application developed using JSP, Servlets, JDBC, and MySQL following the MVC architecture.
It allows users to register, log in, browse restaurants and menus, add food items to a cart, place orders, and view order history.

This project focuses on real-time backend logic, database connectivity, and layered architecture using DAO and Model classes.

🏗️ Project Architecture

MVC (Model–View–Controller)

Model – Business objects (User, Restaurant, Menu, Orders, Cart, etc.)

View – JSP pages for UI

Controller – Servlets handling requests and responses

DAO Layer – Database operations using JDBC

Utility Layer – Database connection handling

📂 Project Structure
Food_Delivery_Application
│
├── src/main/java/com/tap
│   ├── DAO
│   │   ├── UserDAO
│   │   ├── RestaurantDAO
│   │   ├── MenuDAO
│   │   ├── OrdersDAO
│   │   └── OrderItemsDAO
│   │
│   ├── DAOimplementation
│   │   ├── UserDAOImpl
│   │   ├── RestaurantDAOImpl
│   │   ├── MenuDAOImpl
│   │   ├── OrdersDAOImpl
│   │   └── OrderItemsDAOImpl
│   │
│   ├── model
│   │   ├── User
│   │   ├── Restaurant
│   │   ├── Menu
│   │   ├── Orders
│   │   ├── OrderItems
│   │   ├── Cart
│   │   └── CartItem
│   │
│   ├── servlets
│   │   ├── LoginServlet
│   │   ├── RegistrationServlet
│   │   ├── HomeServlet
│   │   ├── MenuServlet
│   │   ├── CartServlet
│   │   ├── CheckoutServlet
│   │   ├── OrdersServlet
│   │   └── OrderPlacedServlet
│   │
│   └── utility
│       └── db_connection
│
├── build/classes
├── WebContent (JSP files)
└── README.md

🚀 Features

User Registration & Login

View restaurants and food menus

Add food items to cart

Place food orders

View order history

Session-based cart management

JDBC-based database interaction

🛠️ Technologies Used
Backend

Java

JSP & Servlets

JDBC

Database

MySQL

Frontend

HTML

CSS

Tools & Server

Eclipse IDE

Apache Tomcat

Git & GitHub

🗄️ Database Tables

users – stores user details

restaurants – restaurant information

menu – food items and prices

orders – order summary

order_items – ordered food details

🎯 Learning Outcomes

Strong understanding of Servlet lifecycle

Hands-on experience with JDBC and DAO pattern

Implementation of MVC architecture

Session management and cart handling

Real-time Java web application development

👤 Author

Adil Shaik
Java Full Stack Developer



