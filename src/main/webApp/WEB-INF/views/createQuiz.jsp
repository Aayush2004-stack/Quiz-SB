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
    background: radial-gradient(circle at top left, #1b1f3b 0%, #0f2027 50%, #0a0f1e 100%);
    color: #f0f0f0;
    min-height: 100vh;
  }

  .main-content {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 100px 20px 40px 20px; /* offset for sticky navbar */
  }

  .form-container {
    background: rgba(34, 42, 74, 0.9);
    padding: 30px 40px;
    border-radius: 16px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.65);
    width: 400px;
    backdrop-filter: blur(6px);
  }

  h2 {
    text-align: center;
    color: #5b8def;
    font-size: 1.8rem;
    margin-bottom: 25px;
    font-weight: 700;
  }

  label {
    display: block;
    margin-top: 15px;
    font-weight: 600;
    color: #c9c9c9;
  }

  input[type="text"],
  input[type="number"],
  textarea,
  select {
    width: 100%;
    padding: 10px 15px;
    margin-top: 6px;
    border: 1px solid rgba(255,255,255,0.1);
    border-radius: 10px;
    font-size: 1rem;
    background: rgba(0,0,0,0.3);
    color: #f0f0f0;
    transition: all 0.3s ease;
    resize: vertical;
  }

  input[type="text"]:focus,
  input[type="number"]:focus,
  textarea:focus,
  select:focus {
    background: rgba(0,0,0,0.5);
    border-color: #4e73df;
    box-shadow: 0 0 8px rgba(78,115,223,0.4);
    outline: none;
  }

  button[type="submit"] {
    margin-top: 25px;
    width: 100%;
    padding: 14px 0;
    background: linear-gradient(90deg, #1cc88a, #13855c);
    border: none;
    border-radius: 12px;
    color: #fff;
    font-weight: 700;
    font-size: 1.1rem;
    cursor: pointer;
    transition: all 0.3s ease;
  }

  button[type="submit"]:hover {
    background: linear-gradient(90deg, #17a673, #0f6c55);
    transform: scale(1.03);
  }
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="main-content">
    <div class="form-container">
        <h2>Create New Quiz</h2>
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