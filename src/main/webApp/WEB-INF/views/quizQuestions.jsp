<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>$</title>
</head>
<body>

<div class="max-w-6xl mx-auto px-6 py-8">
    <h1 class="text-4xl font-bold mb-8 text-center text-navy-800">All Quiz Details</h1>
    <table class="table-auto w-full border-collapse border border-gray-400 text-center text-lg">
        <thead>
            <tr class="bg-blue-900 text-white">
                <th class="border px-4 py-2">ID</th>
                <th class="border px-4 py-2">Question Title</th>
                <th class="border px-4 py-2">Option 1</th>
                <th class="border px-4 py-2">Option 2</th>
                <th class="border px-4 py-2">Option 3</th>
                <th class="border px-4 py-2">Correct option</th>


            </tr>
        </thead>
        <tbody>
            <c:forEach var="question" items="${questions}">
                <tr class="text-gray-800">
                    <td class="border px-4 py-2">${question.questionId}</td>
                    <td class="border px-4 py-2">${question.questionTitle}</td>
                    <td class="border px-4 py-2">${question.question.option1}</td>
                    <td class="border px-4 py-2">${question.question.option2}</td>
                    <td class="border px-4 py-2">${question.question.option3}</td>
                    <td class="border px-4 py-2">${question.question.correctOption}</td>

                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
