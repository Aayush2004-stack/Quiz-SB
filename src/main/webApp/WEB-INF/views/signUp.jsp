<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f172a, #1e293b); /* dark navy slate */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #f1f5f9;
        }
        .form-card {
            background: rgba(30, 41, 59, 0.9); /* semi-transparent slate */
            backdrop-filter: blur(12px);
            border-radius: 16px;
            padding: 40px 35px;
            width: 380px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            animation: fadeIn 0.5s ease-in-out;
        }
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(-15px);}
            to {opacity: 1; transform: translateY(0);}
        }
        .input-field {
            width: 100%;
            padding: 12px 14px;
            margin-top: 10px;
            background: #1e293b;
            border: 1px solid #334155;
            border-radius: 10px;
            outline: none;
            color: #f1f5f9;
            font-size: 0.95rem;
            transition: border 0.2s, box-shadow 0.2s;
        }
        .input-field:focus {
            border-color: #38bdf8;
            box-shadow: 0 0 8px rgba(56,189,248,0.4);
        }
        .submit-btn {
            width: 100%;
            margin-top: 22px;
            padding: 12px;
            background: linear-gradient(90deg, #2563eb, #4f46e5);
            color: white;
            font-weight: 600;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1rem;
            transition: transform 0.1s, background 0.3s;
        }
        .submit-btn:hover {
            background: linear-gradient(90deg, #1d4ed8, #4338ca);
            transform: scale(1.03);
        }
        .login-section {
            margin-top: 18px;
            font-size: 0.9rem;
            color: #94a3b8;
            text-align: center;
        }
        .login-section a {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 22px;
            background: linear-gradient(90deg, #14b8a6, #0d9488);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: 600;
            transition: background 0.3s, transform 0.1s;
        }
        .login-section a:hover {
            background: linear-gradient(90deg, #0d9488, #0f766e);
            transform: scale(1.03);
        }
    </style>
</head>
<body>
    <div class="form-card">
        <form action="${pageContext.request.contextPath}/user/signUp" method="post">
            <h1 class="text-3xl font-bold mb-6 text-center bg-gradient-to-r from-sky-400 to-indigo-400 bg-clip-text text-transparent">
                Create Account
            </h1>

            <label for="fullName" class="block mt-3 text-sm font-semibold">Full Name</label>
            <input type="text" id="fullName" name="fullName" class="input-field" required>

            <label for="username" class="block mt-3 text-sm font-semibold">Username</label>
            <input type="text" id="username" name="username" class="input-field" required>

            <label for="password" class="block mt-3 text-sm font-semibold">Password</label>
            <input type="password" id="password" name="password" class="input-field" required>

            <input type="submit" value="Sign Up" class="submit-btn">
        </form>

        <div class="login-section">
            <p>Already have an account?</p>
            <a href="${pageContext.request.contextPath}/logInView">Log In</a>
        </div>
    </div>
</body>
</html>