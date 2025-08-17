<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quiz Result</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg,#1b1f3b,#0f2027);
        color: #f0f0f0;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    .main-content {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 80px 20px 40px 20px; /* space for nav */
    }
    .result-card {
        background: #222a4a;
        padding: 30px 25px;
        border-radius: 12px;
        text-align: center;
        box-shadow: 0 8px 25px rgba(0,0,0,0.7);
        max-width: 400px;
        width: 100%;
    }
    h1 {
        font-size: 2rem;
        color: #4e73df;
        margin-bottom: 20px;
    }
    p {
        font-size: 1.1rem;
        color: #c9c9c9;
        margin-bottom: 25px;
    }
    .btn-continue {
        display: inline-block;
        padding: 10px 20px;
        background-color: #13855c;
        color: white;
        font-weight: 600;
        border-radius: 10px;
        text-decoration: none;
        transition: background 0.3s ease, transform 0.1s ease;
    }
    .btn-continue:hover {
        background-color: #1cc88a;
        transform: scale(1.05);
    }
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="main-content">
    <div class="result-card">
        <h1>Quiz Finished 🎉</h1>
        <p>
            You scored
            <strong>${score}</strong>
            out of
            <strong>${total}</strong>
        </p>
        <a class="btn-continue" href="${pageContext.request.contextPath}/quiz/quizzes">Continue</a>
    </div>
</div>

</body>
</html>