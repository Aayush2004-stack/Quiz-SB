<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>My Quizzes</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1b1f3b, #0f2027);
    color: #f0f0f0;
    min-height: 100vh;
    padding: 0;
  }

  .main-content {
    padding: 80px 20px 20px 20px; /* space below nav */
    min-height: calc(100vh - 80px);
  }

  h1 {
    text-align: center;
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 30px;
    color: #4e73df;
  }

  .card-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 20px;
    max-width: 1200px;
    margin: 0 auto;
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
    font-size: 1.4rem;
    font-weight: 600;
    margin-bottom: 8px;
    color: #4e73df;
  }

  .quiz-desc {
    font-size: 0.95rem;
    color: #c9c9c9;
    margin-bottom: 12px;
  }

  .quiz-info {
    font-size: 0.9rem;
    margin-bottom: 15px;
    color: #aaa;
  }

  .btn-group {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
  }

  /* Button style */
  .btn-link {
    display: inline-block;
    padding: 8px 14px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.9rem;
    transition: background-color 0.3s ease, transform 0.1s ease;
    color: white;
    text-align: center;
  }

  .btn-activate { background-color: #13855c; }
  .btn-activate:hover { background-color: #1cc88a; }

  .btn-deactivate { background-color: #e74a3b; }
  .btn-deactivate:hover { background-color: #b02a20; }

  .btn-delete { background-color: #e74a3b; }
  .btn-delete:hover { background-color: #b02a20; }

  .btn-questions { background-color: #4e73df; }
  .btn-questions:hover { background-color: #375ab7; }
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="main-content">
  <h1>My Quizzes</h1>

  <div class="card-container">
      <c:forEach var="quiz" items="${quizzes}">
          <div class="quiz-card">
              <div class="quiz-title">${quiz.quizName}</div>
              <div class="quiz-desc">${quiz.quizDescription}</div>
              <div class="quiz-info">ID: ${quiz.quizId}</div>
              <div class="quiz-info">Questions: ${quiz.noOfQuestionsToPlay}</div>

              <div class="btn-group">
                  <c:choose>
                      <c:when test="${quiz.status == 'active'}">
                          <a class="btn-link btn-activate"
                             href="${pageContext.request.contextPath}/quiz/setStatus/${quiz.quizId}/${quiz.status}">
                              Active
                          </a>
                      </c:when>
                      <c:otherwise>
                          <a class="btn-link btn-deactivate"
                             href="${pageContext.request.contextPath}/quiz/setStatus/${quiz.quizId}/${quiz.status}">
                              Not Active
                          </a>
                      </c:otherwise>
                  </c:choose>

                  <a class="btn-link btn-delete"
                     href="${pageContext.request.contextPath}/quiz/deleteQuiz/${quiz.quizId}"
                     onclick="return confirm('Are you sure you want to delete this quiz?');">
                     Delete
                  </a>

                  <a class="btn-link btn-questions"
                     href="${pageContext.request.contextPath}/question/getQuestion/${quiz.quizId}">
                     View Questions
                  </a>
              </div>
          </div>
      </c:forEach>
  </div>
</div>

</body>
</html>