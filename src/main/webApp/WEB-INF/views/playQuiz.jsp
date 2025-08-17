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
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: radial-gradient(circle at top left, #1b1f3b 0%, #0f2027 50%, #0a0f1e 100%);
    color: #f0f0f0;
    min-height: 100vh;
  }

  .main-content {
    padding: 100px 20px 40px 20px;
    max-width: 1200px;
    margin: 0 auto;
  }

  h1 {
    text-align: center;
    font-size: 2rem;
    font-weight: 700;
    margin: 40px 0 25px;
    color: #5b8def;
    letter-spacing: 0.5px;
  }

  .category-buttons {
    text-align: center;
    margin-bottom: 25px;
  }
  .category-btn {
    display: inline-block;
    margin: 6px 5px;
    padding: 8px 16px;
    border-radius: 25px;
    background: rgba(255, 255, 255, 0.05);
    border: 1px solid rgba(255, 255, 255, 0.15);
    color: #f0f0f0;
    font-size: 0.9rem;
    font-weight: 500;
    cursor: pointer;
    transition: all 0.3s ease;
    backdrop-filter: blur(4px);
  }
  .category-btn:hover, .category-btn.active {
    background: #1cc88a;
    border-color: #1cc88a;
    color: #fff;
    transform: scale(1.05);
  }

  .card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 22px;
    justify-content: center;
  }
  .quiz-card {
    background: rgba(34, 42, 74, 0.9);
    border-radius: 16px;
    padding: 22px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.65);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 240px;
    width: 310px;
    transition: transform 0.25s ease, box-shadow 0.25s ease;
    backdrop-filter: blur(6px);
  }
  .quiz-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 32px rgba(0,0,0,0.8);
  }

  .quiz-title { font-size: 1.4rem; font-weight: 600; margin-bottom: 10px; color: #5b8def; }
  .quiz-desc { font-size: 0.95rem; color: #c9c9c9; margin-bottom: 12px; flex-grow: 1; }
  .quiz-info { font-size: 0.85rem; margin-bottom: 15px; color: #aaa; }

  .btn-playQuiz {
    display: inline-block;
    padding: 10px 16px;
    border-radius: 10px;
    background: #13855c;
    color: white;
    font-weight: 600;
    text-decoration: none;
    text-align: center;
    transition: background 0.3s, transform 0.1s;
    margin-top: 6px;
  }
  .btn-playQuiz:hover { background: #1cc88a; transform: scale(1.05); }

  .btn-scoreboard { background-color: #4e73df !important; }
  .btn-scoreboard:hover { background-color: #6b8dff !important; }

  .coming-soon {
    background: rgba(70, 70, 70, 0.85) !important;
    text-align: center;
    font-style: italic;
    border: 1px dashed rgba(255,255,255,0.1);
  }

  /* Login modal */
  #loginModal {
    display: none;
    position: fixed; inset: 0;
    background: rgba(0,0,0,0.5);
    z-index: 50;
    justify-content: center; align-items: center;
  }
  #loginModal .modal-content {
    background: #1a1a1a;
    padding: 30px;
    border-radius: 12px;
    text-align: center;
    color: #eee;
    width: 350px;
  }
  #loginModal button, #loginModal a {
    margin-top: 15px;
    padding: 10px 20px;
    border-radius: 8px;
    font-weight: 600;
    text-decoration: none;
    color: #fff;
  }
  #loginModal a { background: #4e73df; }
  #loginModal button { background: #888; }
  #loginModal a:hover { background: #6b8dff; }
  #loginModal button:hover { background: #aaa; }
</style>
</head>
<body>

<!-- Sticky navbar -->
<div style="position: fixed; top:0; left:0; right:0; z-index:1000;">
    <%@ include file="/WEB-INF/views/navBar.jsp" %>
</div>

<div class="main-content">
    <h1>Available Quizzes</h1>

    <!-- Category buttons -->
    <div class="category-buttons">
        <span class="category-btn active" onclick="filterQuizzes('all')">All</span>
        <c:forEach var="entry" items="${categoryQuizMap}">
            <span class="category-btn" onclick="filterQuizzes('${entry.key}')">${entry.key}</span>
        </c:forEach>
    </div>

    <!-- Active quizzes -->
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

                        <!-- Play Quiz button with login check -->
                        <c:choose>
                            <c:when test="${not empty sessionScope.user}">
                                <a class="btn-playQuiz" href="${pageContext.request.contextPath}/quiz/playQuiz/${quiz.quizId}/${questionIndex}">Play Quiz</a>
                            </c:when>
                            <c:otherwise>
                                <a class="btn-playQuiz" href="javascript:void(0);" onclick="showLoginModal()">Play Quiz</a>
                            </c:otherwise>
                        </c:choose>

                        <a class="btn-playQuiz btn-scoreboard"
                           href="${pageContext.request.contextPath}/scoreBoard/quizScore/${quiz.quizId}">
                           View Scoreboard
                        </a>
                    </div>
                </c:if>
            </c:forEach>
        </c:forEach>
    </div>

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
    document.querySelectorAll('.category-btn').forEach(btn => btn.classList.remove('active'));
    document.querySelectorAll('.category-btn').forEach(btn => {
        if(btn.textContent === category || (category==='all' && btn.textContent==='All')) btn.classList.add('active');
    });

    document.querySelectorAll('#quizContainer .quiz-card').forEach(card => {
        card.style.display = (category==='all' || card.getAttribute('data-category')===category) ? 'flex' : 'none';
    });
}

function showLoginModal() {
    document.getElementById("loginModal").style.display = "flex";
}
function hideLoginModal() {
    document.getElementById("loginModal").style.display = "none";
}
</script>

</body>
</html>