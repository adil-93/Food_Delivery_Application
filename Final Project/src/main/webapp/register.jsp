<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register - FoodExpress</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-container {
            background-color: white;
            padding: 40px 50px;
            border-radius: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
            width: 400px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
            font-size: 2rem;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: #555;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        input[type="email"]:focus,
        textarea:focus {
            outline: none;
            border-color: #667eea;
        }

        textarea {
            resize: vertical;
            min-height: 80px;
        }

        .btn-register {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px;
            border: none;
            border-radius: 8px;
            width: 100%;
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            margin-top: 10px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(102, 126, 234, 0.6);
        }

        .login-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link:hover {
            color: #764ba2;
        }

    </style>
</head>
<body>

<div class="register-container">
    <h1>Create Account</h1>
    <form action="register" method="post">
        <div class="form-group">
            <label for="username">Username <span style="color:red;">*</span></label>
            <input type="text" id="username" name="username" placeholder="Enter username" required>
        </div>

        <div class="form-group">
            <label for="password">Password <span style="color:red;">*</span></label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>
        </div>

        <div class="form-group">
            <label for="email">Email <span style="color:red;">*</span></label>
            <input type="email" id="email" name="email" placeholder="Enter email" required>
        </div>

        <div class="form-group">
            <label for="address">Address <span style="color:red;">*</span></label>
            <textarea id="address" name="address" placeholder="Enter your address" required></textarea>
        </div>

        <button type="submit" class="btn-register">Create Account</button>
    </form>

    <a href="login.jsp" class="login-link">Already have an account? Login here</a>
</div>

</body>
</html>
