<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Quizzes</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
  body {
    margin:0;
    font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
    background: linear-gradient(135deg,#1b1f3b,#0f2027);
    color:#f0f0f0;
    min-height:100vh;
  }

  h1 {
    text-align:center;
    font-size:2.2rem;
    font-weight:700;
    margin-bottom:20px;
    color:#4e73df;
  }

  /* Category filter styling */
  .category-buttons {
    text-align:center;
    margin-bottom:25px;
  }
  .category-btn {
    display:inline-block;
    margin:3px;
    padding:6px 14px;
    border-radius:20px;
    background:#4e73df;
    color:white;
    font-size:0.9rem;
    font-weight:500;
    cursor:pointer;
    transition: background 0.3s, transform 0.1s;
  }
  .category-btn:hover {
    background:#1cc88a;
    transform:scale(1.05);
  }
  .category-btn.active {
    background:#1cc88a;
  }

  /* Quiz card container */
  .card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
  }
  .quiz-card {
    background: #222a4a;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 6px 20px rgba(0,0,0,0.6);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height:220px;
    width: 300px;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }
  .quiz-card:hover {
    transform:translateY(-5px);
    box-shadow:0 10px 25px rgba(0,0,0,0.7);
  }

  .quiz-title {
    font-size:1.3rem;
    font-weight:600;
    margin-bottom:8px;
    color:#4e73df;
  }
  .quiz-desc {
    font-size:0.9rem;
    color:#c9c9c9;
    margin-bottom:10px;
    flex-grow:1;
  }
  .quiz-info {
    font-size:0.85rem;
    margin-bottom:12px;
    color:#aaa;
  }

  .btn-playQuiz {
    display:inline-block;
    padding:8px 15px;
    border-radius:10px;
    background-color:#13855c;
    color:white;
    font-weight:600;
    text-decoration:none;
    text-align:center;
    transition: background 0.3s, transform 0.1s;
    margin-top:5px;
  }
  .btn-playQuiz:hover {
    background-color:#1cc88a;
    transform:scale(1.05);
  }

  .coming-soon {
    background:#444 !important;
    opacity:0.85;
    text-align:center;
    font-style:italic;
  }
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="main-content">
    <!-- Active Quizzes -->
    <h1>Available Quizzes</h1>

    <!-- Category buttons -->
    <div class="category-buttons">
        <span class="category-btn active" onclick="filterQuizzes('all')">All</span>
        <c:forEach var="entry" items="${categoryQuizMap}">
            <span class="category-btn" onclick="filterQuizzes('${entry.key}')">${entry.key}</span>
        </c:forEach>
    </div>

    <!-- Active quiz container -->
    <div class="card-container" id="quizContainer">
        <c:forEach var="entry" items="${categoryQuizMap}">
            <c:set var="categoryName" value="${entry.key}" />
            <c:set var="quizzes" value="${entry.value}" />
            <c:forEach var="quiz" items="${quizzes}">
                <c:if test="${quiz.status eq 'active'}">
                    <div class="quiz-card" data-category="${categoryName}">
                        <div class="quiz-title">${quiz.quizName}</div>
                        <div class="quiz-desc">${quiz.quizDescription}</div>
                        <div class="quiz-info">Questions: ${quiz.noOfQuestionsToPlay}</div>
                        <c:set var="questionIndex" value="0"/>
                        <a class="btn-playQuiz" href="${pageContext.request.contextPath}/quiz/playQuiz/${quiz.quizId}/${questionIndex}">Play Quiz</a>
                        <a class="btn-playQuiz"
                           href="${pageContext.request.contextPath}/scoreBoard/quizScore/${quiz.quizId}"
                           style="background-color:#4e73df;">
                           View Scoreboard
                        </a>
                    </div>
                </c:if>
            </c:forEach>
        </c:forEach>
    </div>

    <!-- Inactive Quizzes -->
    <h1>Coming Soon 🚀</h1>
    <div class="card-container">
        <c:forEach var="entry" items="${categoryQuizMap}">
            <c:set var="categoryName" value="${entry.key}" />
            <c:set var="quizzes" value="${entry.value}" />
            <c:forEach var="quiz" items="${quizzes}">
                <c:if test="${quiz.status eq 'inActive'}">
                    <div class="quiz-card coming-soon">
                        <div class="quiz-title">${quiz.quizName}</div>
                        <div class="quiz-desc">${quiz.quizDescription}</div>
                        <div class="quiz-info">Coming soon...</div>
                    </div>
                </c:if>
            </c:forEach>
        </c:forEach>
    </div>
</div>

<script>
function filterQuizzes(category) {
    // Highlight active button
    document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active'));
    document.querySelectorAll('.category-btn').forEach(btn => {
        if(btn.textContent === category || (category==='all' && btn.textContent==='All')) btn.classList.add('active');
    });

    // Show/hide quiz cards (only for Available Quizzes)
    document.querySelectorAll('#quizContainer .quiz-card').forEach(card => {
        if(category==='all' || card.getAttribute('data-category')===category){
            card.style.display = 'flex';
        } else {
            card.style.display = 'none';
        }
    });
}
</script>

</body>
</html>