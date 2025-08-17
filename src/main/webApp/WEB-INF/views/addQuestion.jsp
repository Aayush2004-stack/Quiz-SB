<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Add Question</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1b1f3b, #0f2027);
    color: #eee;
    min-height: 100vh;
  }

  .main-container {
    display: flex;
    gap: 30px;
    max-width: 1200px;
    margin: 100px auto 50px; /* space below nav */
    padding: 0 20px;
    flex-wrap: wrap;
  }

  .form-container, .existing-questions {
    background: #222a4a;
    border-radius: 12px;
    padding: 25px 30px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.7);
  }

  .form-container {
    flex: 1 1 400px;
    min-width: 300px;
  }

  .existing-questions {
    flex: 1 1 400px;
    min-width: 300px;
    max-height: 600px;
    overflow-y: auto;
  }

  h2 {
    font-size: 1.8rem;
    font-weight: 700;
    color: #4e73df;
    margin-bottom: 20px;
    text-align: center;
  }

  label {
    display: block;
    margin-top: 15px;
    margin-bottom: 6px;
    font-weight: 600;
    font-size: 1rem;
  }

  input[type="text"],
  input[type="hidden"] {
    width: 100%;
    padding: 10px 12px;
    font-size: 1rem;
    border: 1.5px solid #4e73df;
    border-radius: 8px;
    background-color: #1e2546;
    color: #eee;
    box-sizing: border-box;
  }

  input[type="text"]:focus {
    outline: none;
    border-color: #1cc88a;
    box-shadow: 0 0 8px #1cc88a;
  }

  input[type="submit"] {
    margin-top: 25px;
    width: 100%;
    background-color: #1cc88a;
    border: none;
    color: white;
    font-weight: 700;
    font-size: 1.1rem;
    padding: 12px 0;
    border-radius: 10px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  input[type="submit"]:hover {
    background-color: #13855c;
  }

  /* Existing questions table */
  table {
    width: 100%;
    border-collapse: collapse;
    background: #1e2546;
    box-shadow: inset 0 0 10px #0008;
    color: #ddd;
  }

  th, td {
    padding: 10px 12px;
    border: 1px solid #3a3f6b;
    text-align: left;
    font-size: 0.95rem;
  }

  thead tr {
    background-color: #4e73df;
    font-weight: 700;
    color: white;
  }

  tbody tr:nth-child(even) {
    background-color: #2a3055;
  }

  tbody tr:hover {
    background-color: #3f4ba5;
    color: #fff;
  }

</style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="main-container">

  <!-- Form Left Side -->
  <div class="form-container">
    <h2>Add New Question</h2>
    <form action="${pageContext.request.contextPath}/question/addQuestion" method="post">
        <input type="hidden" name="quizId" value="${quizId}" />

        <label for="title">Question title:</label>
        <input type="text" id="title" name="title" required>

        <label for="option1">Option 1:</label>
        <input type="text" id="option1" name="option1" required>

        <label for="option2">Option 2:</label>
        <input type="text" id="option2" name="option2" required>

        <label for="option3">Option 3:</label>
        <input type="text" id="option3" name="option3" required>

        <label for="correctOption">Option 4 (Correct Option):</label>
        <input type="text" id="correctOption" name="correctOption" required>

        <input type="submit" value="Create">
    </form>
  </div>

  <!-- Existing Questions Right Side -->
  <div class="existing-questions">
    <h2>Existing Questions</h2>
    <table>
      <thead>
        <tr>
          <th>ID</th>
          <th>Title</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="question" items="${questions}">
          <tr>
            <td>${question.questionId}</td>
            <td>${question.title}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

</div>

</body>
</html>