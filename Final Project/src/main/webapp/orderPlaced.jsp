<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Placed - FoodExpress</title>

    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family: "Segoe UI", Roboto, Arial, sans-serif; }

        html, body { width: 100%; height: 100%; }

        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            background-image: url('<%= request.getContextPath() %>/Images/submission-page.jpeg');
            background-repeat: no-repeat;
            background-position: center center;
            background-size: cover;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.25);
            z-index: -1;
        }

        .order-container {
            max-width: 520px;
            width: 100%;
            background: rgba(255,255,255,0.95);
            padding: 40px 30px;
            border-radius: 18px;
            box-shadow: 0 12px 35px rgba(0,0,0,0.15);
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .success-icon { font-size: 4rem; color: #7B4ABC; margin-bottom: 15px; }
        h1 { font-size: 2.1rem; color: #4B2C91; margin-bottom: 12px; }
        .message { font-size: 1.05rem; color: #555; line-height: 1.6; margin-bottom: 30px; }

        .btn-group { display: flex; gap: 15px; justify-content: center; flex-wrap: wrap; }
        .btn { padding: 12px 22px; font-size: 1rem; font-weight: 700; border-radius: 10px; text-decoration: none; transition: all 0.3s ease; border: none; cursor: pointer; }
        .btn-home { background: linear-gradient(135deg, #B57EDC, #9F6ACD); color: #ffffff; }
        .btn-home:hover { transform: translateY(-2px); }

        /* SPARKS */
        .spark {
            position: fixed;
            bottom: 0;
            width: 8px;
            height: 8px;
            background-color: hsl(0, 100%, 50%);
            border-radius: 50%;
            z-index: 999;
            opacity: 0.9;
            pointer-events: none;
            animation: flyUp linear forwards;
        }

        @keyframes flyUp {
            0% { transform: translateY(0) rotate(0deg); opacity: 1; }
            100% { transform: translateY(-90vh) rotate(720deg); opacity: 0; }
        }
    </style>
</head>

<body>

    <div class="order-container">
        <div class="success-icon">✔</div>
        <h1>Order Placed Successfully!</h1>
        <p class="message">
            Thank you for your order. Your delicious food is being prepared and
            will be delivered soon.
        </p>
        <div class="btn-group">
            <a href="home" class="btn btn-home">Go to Home</a>
        </div>
    </div>

    <script>
        // Sparks from bottom
        function createSpark() {
            const spark = document.createElement('div');
            spark.classList.add('spark');

            // random horizontal position
            spark.style.left = Math.random() * 100 + 'vw';
            // random size
            const size = Math.random() * 6 + 4;
            spark.style.width = size + 'px';
            spark.style.height = size + 'px';
            // random color
            const hue = Math.random() * 360;
            spark.style.backgroundColor = `hsl(${hue}, 90%, 60%)`;
            // random animation duration
            spark.style.animationDuration = (Math.random() * 2 + 2) + 's';

            document.body.appendChild(spark);

            // remove spark after animation
            setTimeout(() => { spark.remove(); }, 4000);
        }

        // Trigger multiple sparks
        function launchSparks(count = 50) {
            for (let i=0; i<count; i++) {
                setTimeout(createSpark, i*100);
            }
        }

        window.addEventListener('load', () => {
            launchSparks(50);
            // optional: repeat every second
            let repeat = 2;
            for (let i=1; i<=repeat; i++){
                setTimeout(() => launchSparks(50), i*1000);
            }
        });
    </script>

</body>
</html>
