<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>$</title>
</head>
<body>
 <div class="form-container">
            <form action="${pageContext.request.contextPath}/user/logIn" method="get">
            <h1 class ="text-4xl font-bold mb-8 text-center text-navy-800">Enter Customer Details</h1>

                <label for="username">username:</label><br>
                <input type="username" id="username" name="username" required><br>

                <label for="password">Password:</label><br>
                <input type="password" id="password" name="password" required><br>

                <input type="submit" value="Log In">
            </form>
        </div>

login here
</body>
</html>
