<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
    padding: 20px;
  }

  h1 {
    text-align: center;
    font-size: 2.5rem;
    font-weight: 700;
    margin-bottom: 30px;
    color: #4e73df;
  }

  .container {
    max-width: 1100px;
    margin: 0 auto;
    background: #222a4a;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.7);
  }

  table {
    width: 100%;
    border-collapse: collapse;
    background: #1e2546;
    box-shadow: inset 0 0 10px #0008;
    color: #ddd;
  }

  thead tr {
    background-color: #4e73df;
    color: white;
    text-transform: uppercase;
    font-weight: 700;
  }

  th, td {
    padding: 12px 15px;
    border: 1px solid #3a3f6b;
    text-align: center;
    font-size: 1rem;
  }

  tbody tr:nth-child(even) {
    background-color: #2a3055;
  }

  tbody tr:hover {
    background-color: #3f4ba5;
    color: #fff;
    cursor: default;
  }

  /* Button base style */
  .btn-link {
    display: inline-block;
    padding: 8px 15px;
    border-radius: 8px;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.9rem;
    transition: background-color 0.3s ease, transform 0.1s ease;
    color: white;
  }
   .btn-playQuiz {
      background-color: #13855c; /* dark green */
    }
   .btn-playQuiz:hover {
      background-color: #1cc88a; /* light green */
    }

  /* Remove default button styling */
  button {
    border: none;
    background: none;
    padding: 0;
  }
</style>
</head>
<body>

<h1>Available Quizzes</h1>

<div class="container">
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Quiz Name</th>
                <th>Quiz Description</th>
                <th>No of Questions to Play</th>


            </tr>
        </thead>
        <tbody>
            <c:forEach var="quiz" items="${availableQuizzes}">
                <tr>
                    <td>${quiz.quizId}</td>
                    <td>${quiz.quizName}</td>
                    <td>${quiz.quizDescription}</td>
                    <td>${quiz.noOfQuestionsToPlay}</td>
                    <td><a class="btn-link btn-playQuiz" href="${pageContext.request.contextPath}/question/playQuiz/${quiz.quizId}">
                        Play Quiz</a>
                    </td>


                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>