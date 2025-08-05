<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>$</title>
</head>
<body>
 <form action="${pageContext.request.contextPath}/question/addQuestion" method="post">

                <label for="questionTitle">Question title:</label><br>
                <input type="text" name="questionTitle" required><br>

                <label for="option1">Option 1:</label><br>
                <input type="text" name="option1" required><br>

                <label for="option2">Option 2:</label><br>
                <input type="text" name="option2" required><br>

                <label for="option3">Option 3:</label><br>
                <input type="text" name="option3" required><br>

                <label for="correctOption">Option 4 (Correct Option):</label><br>
                <input type="text" name="correctOption" required><br>

                <input type="submit" value="Create">
            </form>



</body>
</html>
