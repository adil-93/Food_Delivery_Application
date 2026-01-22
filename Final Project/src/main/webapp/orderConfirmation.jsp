<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>

    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            background: linear-gradient(135deg, #ff6a00, #ee0979);
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
        }

        .confirmation-card {
            background: #ffffff;
            width: 420px;
            padding: 40px 30px;
            border-radius: 14px;
            text-align: center;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.25);
            animation: fadeIn 0.8s ease-in-out;
        }

        .checkmark {
            width: 90px;
            height: 90px;
            background: #28a745;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
        }

        .checkmark span {
            color: #ffffff;
            font-size: 50px;
            font-weight: bold;
        }

        h1 {
            color: #333333;
            margin-bottom: 12px;
        }

        p {
            color: #555555;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 30px;
        }

        .btn {
            display: inline-block;
            padding: 12px 26px;
            background: #ff6a00;
            color: #ffffff;
            text-decoration: none;
            font-size: 14px;
            font-weight: 600;
            border-radius: 25px;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: #e65c00;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>

    <div class="confirmation-card">
        <div class="checkmark">
            <span>✓</span>
        </div>

        <h1>Order Placed Successfully!</h1>

        <p>
            Thank you for your order.<br>
            Your delicious food is being prepared and will be delivered soon.
        </p>

        <a href="home.jsp" class="btn">Continue Ordering</a>
    </div>

</body>
</html>
    