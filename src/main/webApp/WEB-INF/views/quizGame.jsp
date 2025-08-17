<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Game</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #1b1f3b, #0f2027);
            color: #f0f0f0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .card {
            background: #222a4a;
            padding: 30px;
            border-radius: 15px;
            max-width: 600px;
            width: 100%;
            box-shadow: 0 8px 25px rgba(0,0,0,0.7);
        }

        h1 {
            font-size: 1.8rem;
            margin-bottom: 10px;
            color: #4e73df;
        }

        .subtitle {
            font-size: 1.1rem;
            margin-bottom: 20px;
            color: #ddd;
        }

        fieldset {
            border: none;
            padding: 0;
            margin: 0 0 20px 0;
        }

        .option {
            background: #2a3055;
            border-radius: 10px;
            padding: 12px 15px;
            margin-bottom: 12px;
            transition: background 0.3s ease, transform 0.1s ease;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .option:hover {
            background: #3f4ba5;
            transform: scale(1.02);
        }

        .option input[type="radio"] {
            margin-right: 10px;
            transform: scale(1.2);
            cursor: pointer;
        }

        .option label {
            cursor: pointer;
            flex: 1;
        }

        button {
            background-color: #4e73df;
            color: white;
            padding: 12px 20px;
            font-size: 1rem;
            border: none;
            border-radius: 10px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.1s ease;
        }

        button:hover {
            background-color: #375ab7;
            transform: scale(1.03);
        }
    </style>
</head>
<body>
<main class="card">

    <h1>Question ${index + 1} of ${total}</h1>
    <p class="subtitle">${question.title}</p>

    <form action="${pageContext.request.contextPath}/quiz/check/${quizId}/${index}" method="post">
        <input type="hidden" name="questionId" value="${question.questionId}"/>

        <fieldset>
            <div class="option">
                <input type="radio" id="opt1" name="selectedOption" value="${question.option1}" required>
                <label for="opt1">${question.option1}</label>
            </div>

            <div class="option">
                <input type="radio" id="opt2" name="selectedOption" value="${question.option2}">
                <label for="opt2">${question.option2}</label>
            </div>

            <div class="option">
                <input type="radio" id="opt3" name="selectedOption" value="${question.option3}">
                <label for="opt3">${question.option3}</label>
            </div>

            <div class="option">
                <input type="radio" id="opt4" name="selectedOption" value="${question.correctOption}">
                <label for="opt4">${question.correctOption}</label>
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