<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://cdn.tailwindcss.com"></script>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Quizzes</title>
<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1b1f3b, #0f2027);
    color: #f0f0f0;
    min-height: 100vh;
  }

  h1 {
    text-align: center;
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 30px;
    color: #4e73df;
  }

  /* Space below fixed nav */
  .main-content {
    padding: 90px 20px 20px 20px; /* adjust top padding if nav height changes */
    max-width: 1100px;
    margin: 0 auto;
  }

  .card-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 20px;
  }

  .quiz-card {
    background: #222a4a;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.7);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  .quiz-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.8);
  }

  .quiz-title {
    font-size: 1.5rem;
    font-weight: 600;
    margin-bottom: 10px;
    color: #4e73df;
  }

  .quiz-desc {
    font-size: 0.95rem;
    color: #c9c9c9;
    margin-bottom: 15px;
  }

  .quiz-info {
    font-size: 0.9rem;
    margin-bottom: 20px;
    color: #aaa;
  }

  /* Button style */
  .btn-link {
    display: inline-block;
    padding: 10px 18px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.95rem;
    transition: background-color 0.3s ease, transform 0.1s ease;
    color: white;
  }
  .btn-playQuiz {
    background-color: #13855c; /* dark green */
  }
  .btn-playQuiz:hover {
    background-color: #1cc88a; /* light green */
  }
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="main-content">
    <h1>Available Quizzes</h1>

    <div class="card-container">
        <c:forEach var="quiz" items="${availableQuizzes}">
            <div class="quiz-card">
                <div class="quiz-title">${quiz.quizName}</div>
                <div class="quiz-desc">${quiz.quizDescription}</div>
                <div class="quiz-info">Questions: ${quiz.noOfQuestionsToPlay}</div>
                <c:set var="questionIndex" value="0"/>
                <a class="btn-link btn-playQuiz"
                   href="${pageContext.request.contextPath}/quiz/playQuiz/${quiz.quizId}/${questionIndex}">
                   Play Quiz
                </a>
            </div>
        </c:forEach>
    </div>
</div>

</body>
</html>