<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Add Question</title>
<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1b1f3b, #0f2027);
    color: #eee;
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
  }

  form {
    background: #222a4a;
    padding: 30px 40px;
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.7);
    max-width: 400px;
    width: 100%;
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
</style>
</head>
<body>

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

</body>
</html>