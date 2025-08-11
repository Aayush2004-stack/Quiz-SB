<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Quiz Questions</title>
<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1b1f3b, #0f2027);
    color: #eee;
    min-height: 100vh;
    padding: 20px;
  }

  .container {
    max-width: 1100px;
    margin: 0 auto;
    background: #222a4a;
    padding: 25px 30px;
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.7);
  }

  h1 {
    text-align: center;
    font-size: 2.5rem;
    font-weight: 700;
    color: #4e73df;
    margin-bottom: 30px;
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

  /* Button styling */
  .btn-link {
    display: inline-block;
    padding: 8px 15px;
    background-color: #4e73df;
    color: white;
    border-radius: 8px;
    font-weight: 600;
    text-decoration: none;
    font-size: 0.9rem;
    transition: background-color 0.3s ease, transform 0.1s ease;
  }
  .btn-link:hover {
    background-color: #2e59d9;
    transform: scale(1.05);
  }
  .btn-delete {
    background-color: #e74a3b; /* red */
  }

  .btn-delete:hover {
     background-color: #b02a20; /* dark red */
   }


  /* Make buttons full width inside cells for better tap targets */
  td button {
    border: none;
    background: none;
    padding: 0;
    width: 60%;
  }

  td button a {
    display: block;
    width: 100%;
    text-align: center;
  }

  /* Add question button styling */
  .add-question-btn {
    margin-top: 20px;
    display: block;
    width: 160px;
    margin-left: auto;
    margin-right: auto;
    padding: 12px 0;
    background-color: #1cc88a;
    color: white;
    border-radius: 10px;
    font-weight: 700;
    font-size: 1.1rem;
    text-align: center;
    text-decoration: none;
    transition: background-color 0.3s ease, transform 0.1s ease;
  }

  .add-question-btn:hover {
    background-color: #13855c;
    transform: scale(1.05);
  }
</style>
</head>
<body>

<div class="container">
  <h1>All Quiz Details</h1>
  <table>
    <thead>
      <tr>
        <th>ID</th>
        <th>Question Title</th>
        <th>Option 1</th>
        <th>Option 2</th>
        <th>Option 3</th>
        <th>Correct Option</th>
        <th>Action</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="question" items="${questions}">
        <tr>
          <td>${question.questionId}</td>
          <td>${question.title}</td>
          <td>${question.option1}</td>
          <td>${question.option2}</td>
          <td>${question.option3}</td>
          <td>${question.correctOption}</td>
          <td>
            <button>
              <a href="${pageContext.request.contextPath}/editQuestionView/${question.questionId}" class="btn-link">Edit</a>
            </button>

            <button>
              <a href="${pageContext.request.contextPath}/question/deleteQuestion/${question.questionId}" onclick="return confirm('Are you sure you want to delete this quiz?');" class="btn-link btn-delete">Delete</a>
            </button>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <a href="${pageContext.request.contextPath}/addQuestionView/${quizId}" class="add-question-btn">Add questions</a>
</div>

</body>
</html>