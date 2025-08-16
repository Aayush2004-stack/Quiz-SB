<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Game</title>
</head>
<body>
<main class="card">

    <h1>Question ${index + 1} of ${total}</h1>
    <p class="subtitle">${question.title}</p>

    <form action="${pageContext.request.contextPath}/quiz/check/${quizId}/${index + 1}" method="post">
        <c:if test="${empty sessionScope.score}">
                    <c:set var="score" value="0" scope="session" />
                </c:if>
        <fieldset>
            <div class="option">
                <input type="radio" id="opt1" name="selectedOption" value="${question.option1}" required>
                <label for="opt1">Option 1 — ${question.option1}</label>
            </div>

            <div class="option">
                <input type="radio" id="opt2" name="selectedOption" value="${question.option2}">
                <label for="opt2">Option 2 — ${question.option2}</label>
            </div>

            <div class="option">
                <input type="radio" id="opt3" name="selectedOption" value="${question.option3}">
                <label for="opt3">Option 3 — ${question.option3}</label>
            </div>

            <div class="option">
                <input type="radio" id="opt4" name="selectedOption" value="${question.correctOption}">
                <label for="opt4">Option 4 — ${question.correctOption}</label>
            </div>
        </fieldset>

        <button type="submit">
            <c:choose>
                <c:when test="${index + 1 == total}">Finish</c:when>
                <c:otherwise>Next</c:otherwise>
            </c:choose>
        </button>
    </form>

</main>
</body>
</html>