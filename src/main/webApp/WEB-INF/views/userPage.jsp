<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Home</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #0f172a, #1e293b);
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
        Welcome Back 👋
      </h1>
      <p class="text-lg text-slate-300 mb-8">
        Ready to test your knowledge today?
        Explore quizzes, challenge yourself, and see where you rank among others.
      </p>

      <div class="space-x-4">
        <a href="${pageContext.request.contextPath}/quiz/quizzes"
           class="px-6 py-3 rounded-xl bg-sky-600 hover:bg-sky-500 text-white font-semibold shadow-lg transition">
           Browse Quizzes
        </a>
        <a href="${pageContext.request.contextPath}/scoreBoard"
           class="px-6 py-3 rounded-xl bg-indigo-600 hover:bg-indigo-500 text-white font-semibold shadow-lg transition">
           View Scoreboard
        </a>
      </div>
    </div>
  </section>

  <!-- Feature Cards Section -->
  <section class="px-6 py-12 max-w-6xl mx-auto grid grid-cols-1 md:grid-cols-3 gap-8">
    <div class="bg-slate-800/60 p-6 rounded-2xl shadow-md hover:shadow-xl transition">
      <h3 class="text-xl font-semibold mb-3 text-sky-400">🎯 Play</h3>
      <p class="text-slate-300 text-sm">Choose from a wide range of quizzes across multiple categories and challenge yourself.</p>
    </div>
    <div class="bg-slate-800/60 p-6 rounded-2xl shadow-md hover:shadow-xl transition">
      <h3 class="text-xl font-semibold mb-3 text-indigo-400">🏆 Compete</h3>
      <p class="text-slate-300 text-sm">Climb the leaderboard by scoring higher than your friends and other players.</p>
    </div>
    <div class="bg-slate-800/60 p-6 rounded-2xl shadow-md hover:shadow-xl transition">
      <h3 class="text-xl font-semibold mb-3 text-purple-400">📊 Track</h3>
      <p class="text-slate-300 text-sm">Keep track of your past quiz attempts and monitor your progress over time.</p>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-slate-900 text-slate-400 text-sm text-center py-4 mt-auto">
    <p>&copy; 2025 QuizVerse. Crafted with 💙 for curious minds.</p>
  </footer>
</body>
</html>