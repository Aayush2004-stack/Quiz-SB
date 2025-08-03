<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <meta charset="UTF-8">
    <title>$</title>
</head>
<body>
<div class="form-container">
            <form action="${pageContext.request.contextPath}/quiz/insertQuiz" method="post">

                <label for="quizName">Quiz Name:</label><br>
                <input type="text" name="quizName" id="quizName" required><br><br>

                <label for="quizDescription">Quiz Description:</label><br>
                <textarea name="quizDescription" id="quizDescription" rows="4" cols="50" required></textarea><br><br>

                <label for="noOfQuestionToPlay">Number of Questions to Play:</label><br>
                <input type="number" name="noOfQuestionToPlay" id="noOfQuestionToPlay" min="1" required><br><br>

                <label for="categoryId">Select Category:</label><br>
                <select name="categoryId" id="categoryId" required style="width: 250px; padding: 8px; font-size: 16px;">
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.categoryId}">${category.categoryName}</option>
                    </c:forEach>
                </select><br><br>

                <button type="submit">Create Quiz</button>
            </form>
        </div>


</body>
</html>
