<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Add Category</title>
<style>
  body {
    margin: 0;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #1b1f3b, #0f2027);
    color: #eee;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 40px 20px;
  }

  h1 {
    font-size: 2.5rem;
    margin-bottom: 40px;
    color: #4e73df;
  }

  h3 {
    font-size: 1.8rem;
    margin-bottom: 20px;
    color: #a1a9f8;
  }

  .form-container {
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

  input[type="text"] {
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

<h1>Welcome admin</h1>

<h3>Add category</h3>
<div class="form-container">
  <form action="${pageContext.request.contextPath}/category/addCategory" method="post">
    <label for="categoryName">Category name:</label>
    <input type="text" id="categoryName" name="categoryName" required>

    <label for="categoryDescription">Category Description:</label>
    <input type="text" id="categoryDescription" name="categoryDescription" required>

    <input type="submit" value="Create">
  </form>
</div>

</body>
</html>