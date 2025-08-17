<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://cdn.tailwindcss.com"></script>

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Welcome User</title>
    <style>
      body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #1c1c1c, #3a3a3a);
        color: #fff;
        margin: 0;
        padding: 0;
        min-height: 100vh;
      }

      h1 {
        margin: 0;
      }

      .main-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        gap: 30px;
        padding-top: 50px; /* space below nav */
      }

      .btn-group {
        display: flex;
        flex-direction: column;
        gap: 20px;
        width: 250px;
      }

      .btn-link {
        display: block;
        text-align: center;
        padding: 15px 20px;
        background: #4e73df;
        border-radius: 10px;
        color: white;
        font-weight: 600;
        font-size: 1.1rem;
        text-decoration: none;
        transition: background-color 0.3s ease, transform 0.1s ease;
        user-select: none;
      }

      .btn-link:hover,
      .btn-link:focus {
        background: #2e59d9;
        transform: scale(1.05);
      }

      button {
        border: none;
        padding: 0;
        background: none;
        cursor: pointer;
        width: 100%;
      }
    </style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="main-content">

    <div class="btn-group">
      <button>
        <a href="${pageContext.request.contextPath}/category/getCategories" class="btn-link">Create Quiz</a>
      </button>

      <button>
        <a href="${pageContext.request.contextPath}/quiz/getQuiz" class="btn-link">My Quizzes</a>
      </button>

      <button>
        <a href="${pageContext.request.contextPath}/quiz/quizzes" class="btn-link">Play Quizzes</a>
      </button>
    </div>
</div>

</body>
</html>