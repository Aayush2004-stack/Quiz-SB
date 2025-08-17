<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quiz App - Home</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #0f172a, #1e293b); /* dark navy & slate */
      color: #f8fafc;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
    }
    .hero-bg {
      background: radial-gradient(circle at top left, rgba(56,189,248,0.25), transparent 60%),
                  radial-gradient(circle at bottom right, rgba(167,139,250,0.25), transparent 60%);
    }
  </style>
</head>
<body>
  <%@ include file="/WEB-INF/views/navBar.jsp" %>

  <!-- Hero Section -->
  <section class="flex-grow flex items-center justify-center hero-bg text-center px-6 py-20">
    <div class="max-w-3xl">
      <h1 class="text-5xl font-extrabold mb-6 bg-gradient-to-r from-sky-400 to-indigo-400 bg-clip-text text-transparent">
        Welcome to QuizVerse 🌌
      </h1>
      <p class="text-lg text-slate-300 mb-8">
        Sharpen your mind, challenge your friends, and explore exciting quizzes across categories.
        Simple, fun, and always rewarding.
      </p>
      <div class="space-x-4">
        <a href="${pageContext.request.contextPath}/quiz/quizzes"
           class="px-6 py-3 rounded-xl bg-sky-600 hover:bg-sky-500 text-white font-semibold shadow-lg transition">
           Explore Quizzes
        </a>
        <a href=""
           class="px-6 py-3 rounded-xl bg-indigo-600 hover:bg-indigo-500 text-white font-semibold shadow-lg transition">
           Learn More
        </a>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-slate-900 text-slate-400 text-sm text-center py-4 mt-auto">
    <p>&copy; 2025 QuizVerse. Crafted with 💙 for curious minds.</p>
  </footer>
</body>
</html>