<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Admin Dashboard</title>
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
      margin-bottom: 10px;
      color: #4e73df;
    }

    p {
      font-size: 1.2rem;
      margin-bottom: 40px;
      color: #bbb;
    }

    .dashboard {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 25px;
      width: 100%;
      max-width: 900px;
    }

    .card {
      background: #222a4a;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 8px 25px rgba(0,0,0,0.6);
      text-align: center;
      transition: transform 0.2s ease;
    }

    .card:hover {
      transform: translateY(-6px);
    }

    .card h2 {
      font-size: 2rem;
      color: #1cc88a;
      margin-bottom: 10px;
    }

    .card p {
      font-size: 1.1rem;
      color: #ddd;
    }

    .actions {
      margin-top: 50px;
      display: flex;
      gap: 20px;
      flex-wrap: wrap;
      justify-content: center;
    }

    .actions a {
      background-color: #4e73df;
      color: #fff;
      padding: 12px 20px;
      border-radius: 8px;
      text-decoration: none;
      font-weight: 600;
      transition: background 0.3s ease;
    }

    .actions a:hover {
      background-color: #2e59d9;
    }
  </style>
</head>
<body>

  <h1>Welcome Admin</h1>
  <p>Manage quizzes, categories and more from your dashboard</p>

  <!-- Stats Section -->
  <div class="dashboard">
    <div class="card">
      <h2>${totalQuizzes}</h2>
      <p>Total Quizzes</p>
    </div>
    <div class="card">
      <h2>${totalCategories}</h2>
      <p>Total Categories</p>
    </div>
    <div class="card">
      <h2>${totalUsers}</h2>
      <p>Total Users</p>
    </div>
  </div>

  <!-- Quick Actions -->
  <div class="actions">
    <a href="${pageContext.request.contextPath}/admin/categories">Manage Categories</a>
    <a href="${pageContext.request.contextPath}/addCategory">Add Category</a>
  </div>

</body>
</html>