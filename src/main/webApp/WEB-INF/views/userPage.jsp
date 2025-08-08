<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Welcome User</title>
<style>
  /* Reset some defaults */
  * {
    box-sizing: border-box;
  }

  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
     background: linear-gradient(135deg, #1c1c1c, #3a3a3a); /* Smooth dark gray */
    color: #fff;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 30px;
  }

  h1 {
    margin: 0;
  }

  /* Container for buttons */
  .btn-group {
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 250px;
  }

  /* Style for buttons that contain links */
  .btn-link {
    display: block;
    text-align: center;
    padding: 15px 20px;
    background: #4e73df;
    border-radius: 10px;
    color: white;
    font-weight: 600;
    font-size: 1.1rem;
    text-decoration: none;
    transition: background-color 0.3s ease, transform 0.1s ease;
    user-select: none;
  }

  .btn-link:hover,
  .btn-link:focus {
    background: #2e59d9;
    transform: scale(1.05);
  }

  /* Remove default button styling */
  button {
    border: none;
    padding: 0;
    background: none;
    cursor: pointer;
    width: 100%;
  }
</style>
</head>
<body>

<h1>Welcome User(name)</h1>

<h1>Create a Quiz</h1>

<div class="btn-group">
  <button>
    <a href="${pageContext.request.contextPath}/category/getCategories" class="btn-link">Create Quiz</a>
  </button>

  <button>
    <a href="${pageContext.request.contextPath}/quiz/getQuiz" class="btn-link">My Quizzes</a>
  </button>
</div>

</body>
</html>