<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Log In</title>
    <style>
        body {
                font-family: Arial, sans-serif;
                background: linear-gradient(135deg, #1c1c1c, #3a3a3a); /* Smooth dark gray */
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            .form-container {
                background: #fff;
                padding: 30px 40px;
                border-radius: 15px;
                box-shadow: 0 8px 20px rgba(0,0,0,0.25);
                width: 350px;
                animation: fadeIn 0.5s ease-in-out;
            }

            h1 {
                font-size: 1.8rem;
                            color: #2e59d9; /* Standard professional blue */
                            font-weight: bold;
                            margin-bottom: 20px;
            }

            label {
                font-weight: bold;
                display: block;
                margin-top: 15px;
                color: #333;
            }

            input[type="username"],
            input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                margin-top: 8px;
                border: 1px solid #ccc;
                border-radius: 8px;
                outline: none;
                font-size: 14px;
                transition: all 0.3s ease;
            }

            input[type="username"]:focus,
            input[type="password"]:focus {
                border-color: #4e73df;
                box-shadow: 0 0 8px rgba(78, 115, 223, 0.4);
            }

            input[type="submit"] {
                width: 100%;
                padding: 12px;
                margin-top: 20px;
                background: linear-gradient(90deg, #1cc88a, #17a673);
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                transition: background 0.3s ease, transform 0.1s ease;
            }

            input[type="submit"]:hover {
                background: linear-gradient(90deg, #17a673, #13855c);
                transform: scale(1.03);
            }

            input[type="submit"]:active {
                transform: scale(0.98);
            }

            @keyframes fadeIn {
                from {opacity: 0; transform: translateY(-10px);}
                to {opacity: 1; transform: translateY(0);}
            }

            /* Responsive */
            @media (max-width: 400px) {
                .form-container {
                    width: 90%;
                    padding: 20px;
                }
            }
    </style>
</head>
<body>
 <div class="form-container">
            <form action="${pageContext.request.contextPath}/user/logIn" method="get">
            <h1 class ="text-4xl font-bold mb-8 text-center text-navy-800">Enter Your Details</h1>

                <label for="username">username:</label><br>
                <input type="username" id="username" name="username" required><br>

                <label for="password">Password:</label><br>
                <input type="password" id="password" name="password" required><br>

                <input type="submit" value="Log In">
            </form>
        </div>
</body>
</html>
