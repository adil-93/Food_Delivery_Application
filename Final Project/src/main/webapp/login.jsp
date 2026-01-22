<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - FoodExpress</title>
    <style>
        /* GLOBAL STYLES */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Roboto, Arial, sans-serif;
        }

        body {
            height: 100vh;
            background-color: #E8DFF7; /* Matches menu/cart pages */
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        /* LOGIN CARD */
        .login-card {
            background: #ffffff;
            width: 380px;
            padding: 35px 30px;
            border-radius: 12px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .login-card h2 {
            margin-bottom: 25px;
            color: #4B2C91; /* Dark lavender */
            font-size: 2rem;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border-radius: 6px;
            border: 2px solid #ddd;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        input:focus {
            outline: none;
            border-color: #7B4ABC; /* Dark lavender focus */
        }

        .login-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #B57EDC 0%, #9F6ACD 100%);
            color: #ffffff;
            border: none;
            border-radius: 8px;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            margin-top: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(159, 106, 205, 0.5);
        }

        /* REGISTER LINK */
        .register-link {
            margin-top: 20px;
            font-size: 0.95rem;
            color: #555;
        }

        .register-link a {
            color: #7B4ABC;
            text-decoration: none;
            font-weight: 600;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        /* LAVENDER HEART POP-UP */
        /* LAVENDER HEART POP-UP */
.heart-popup {
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%) scale(0);
    font-size: 6rem;             /* larger heart */
    color: #B57EDC;              /* medium lavender */
    opacity: 0;
    animation: popHeart 2s forwards;
    z-index: 10000;              /* make sure it’s above everything */
}

@keyframes popHeart {
    0% { transform: translate(-50%, -50%) scale(0); opacity: 0; }
    30% { transform: translate(-50%, -50%) scale(1.2); opacity: 1; }
    60% { transform: translate(-50%, -50%) scale(1); opacity: 1; }
    100% { transform: translate(-50%, -50%) scale(1); opacity: 1; }
}
        
    </style>
</head>
<body>

<%
    String success = request.getParameter("success");
    if ("true".equals(success)) {
%>
<div class="heart-popup">♥</div>
<% } %>

<div class="login-card">
    <h2>Login</h2>

    <!-- LOGIN FORM -->
    <form action="login" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required>
        </div>

        <button type="submit" class="login-btn">Login</button>
    </form>

    <!-- REGISTER LINK -->
    <div class="register-link">
        New user? <a href="register.jsp">Create an account</a>
    </div>
</div>

</body>
</html>
