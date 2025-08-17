<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Scores - QuizMaster</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 dark:bg-gray-900">
<%@ include file="/WEB-INF/views/navBar.jsp" %>

<div class="max-w-4xl mx-auto mt-10 p-6 bg-white dark:bg-gray-800 rounded-lg shadow-md">
    <h1 class="text-2xl font-bold mb-6 text-center text-gray-900 dark:text-white">
        🎮 My Game History
    </h1>

    <c:choose>
        <c:when test="${not empty scores}">
            <div class="overflow-x-auto">
                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400 border-collapse">
                    <thead class="text-xs text-gray-700 uppercase bg-gray-200 dark:bg-gray-700 dark:text-gray-300">
                        <tr>
                            <th scope="col" class="px-6 py-3">#</th>
                            <th scope="col" class="px-6 py-3">Quiz Name</th>
                            <th scope="col" class="px-6 py-3">Score</th>
                            <th scope="col" class="px-6 py-3">Played Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="score" items="${scores}" varStatus="loop">
                            <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600">
                                <td class="px-6 py-4 font-medium text-gray-900 dark:text-white">
                                    ${loop.index + 1}
                                </td>
                                <td class="px-6 py-4">
                                    ${score.quiz.quizName}
                                </td>
                                <td class="px-6 py-4 font-bold text-blue-600 dark:text-blue-400">
                                    ${score.score}
                                </td>
                                <td class="px-6 py-4">
                                    ${score.playedDate}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:when>
        <c:otherwise>
            <p class="text-center text-gray-600 dark:text-gray-300 mt-6">
                You haven’t played any quizzes yet. 🎯
            </p>
        </c:otherwise>
    </c:choose>
</div>

</body>
</html>