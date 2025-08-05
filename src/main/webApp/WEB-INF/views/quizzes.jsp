<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>$</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<h1>My quizzes</h1>
<div class="max-w-6xl mx-auto px-6 py-8">
    <h1 class="text-4xl font-bold mb-8 text-center text-navy-800">All Quiz Details</h1>
    <table class="table-auto w-full border-collapse border border-gray-400 text-center text-lg">
        <thead>
            <tr class="bg-blue-900 text-white">
                <th class="border px-4 py-2">ID</th>
                <th class="border px-4 py-2">Quiz Name</th>
                <th class="border px-4 py-2">Quiz description</th>
                <th class="border px-4 py-2">No of Questions to Play</th>


            </tr>
        </thead>
        <tbody>
            <c:forEach var="quiz" items="${quizzes}">
                <tr class="text-gray-800">
                    <td class="border px-4 py-2">${quiz.quizId}</td>
                    <td class="border px-4 py-2">${quiz.quizName}</td>
                    <td class="border px-4 py-2">${quiz.quizDescription}</td>
                    <td class="border px-4 py-2">${quiz.noOfQuestionsToPlay}</td>
                    <td class="border px-4 py-2"> <button> <a href="${pageContext.request.contextPath}/question/getQuestion/${quiz.quizId}"> See Questions</a></button></td>


                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
