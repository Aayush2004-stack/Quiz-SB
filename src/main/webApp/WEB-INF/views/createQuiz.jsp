<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Create Quiz</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1c1c1c, #3a3a3a);
    min-height: 100vh;
    padding: 0;
  }

  .main-content {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 80px 20px 20px 20px; /* space below nav */
    min-height: calc(100vh - 80px);
  }

  .form-container {
    background: #222;
    padding: 30px 40px;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.6);
    width: 400px;
    color: #eee;
  }

  label {
    display: block;
    margin-top: 15px;
    font-weight: 600;
    font-size: 1rem;
    color: #ddd;
  }

  input[type="text"],
  input[type="number"],
  textarea,
  select {
    width: 100%;
    padding: 10px 15px;
    margin-top: 6px;
    border: none;
    border-radius: 8px;
    font-size: 1rem;
    background: #333;
    color: #eee;
    box-sizing: border-box;
    transition: background-color 0.3s ease, box-shadow 0.3s ease;
    resize: vertical;
  }

  input[type="text"]:focus,
  input[type="number"]:focus,
  textarea:focus,
  select:focus {
    background-color: #444;
    outline: none;
    box-shadow: 0 0 8px #4e73df;
  }

  button[type="submit"] {
    margin-top: 25px;
    width: 100%;
    padding: 14px 0;
    background: linear-gradient(90deg, #4e73df, #224abe);
    border: none;
    border-radius: 10px;
    color: white;
    font-weight: 700;
    font-size: 1.2rem;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.1s ease;
  }

  button[type="submit"]:hover {
    background: linear-gradient(90deg, #224abe, #1a2c6f);
    transform: scale(1.03);
  }
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="main-content">
    <div class="form-container">
        <form action="${pageContext.request.contextPath}/quiz/insertQuiz" method="post">

            <label for="quizName">Quiz Name:</label>
            <input type="text" name="quizName" id="quizName" required>

            <label for="quizDescription">Quiz Description:</label>
            <textarea name="quizDescription" id="quizDescription" rows="4" required></textarea>

            <label for="noOfQuestionToPlay">Number of Questions to Play:</label>
            <input type="number" name="noOfQuestionToPlay" id="noOfQuestionToPlay" min="1" required>

            <label for="categoryId">Select Category:</label>
            <select name="categoryId" id="categoryId" required>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.categoryId}">${category.categoryName}</option>
                </c:forEach>
            </select>

            <button type="submit">Create Quiz</button>
        </form>
    </div>
</div>

</body>
</html>