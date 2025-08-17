<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quiz Result</title>
</head>
<body>
    <h1>Quiz Finished 🎉</h1>

    <p>
        You scored
        <strong>${sessionScope.score}</strong>
        out of
        <strong>${total}</strong>
    </p>

</body>
</html>