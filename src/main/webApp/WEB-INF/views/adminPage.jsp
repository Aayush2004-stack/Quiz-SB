<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>$</title>
</head>
<body>
<h1> Welcome admin</h1>
<br>
<br>
<h3>Add category </h3>
 <div class="form-container">
            <form action="${pageContext.request.contextPath}/category/addCategory" method="post">

                <label for="categoryName">Category name:</label><br>
                <input type="text" name="categoryName" required><br>

                <label for="categoryDescription">Category Description:</label><br>
                <input type="text" name="categoryDescription" required><br>

                <input type="submit" value="Create">
            </form>
 </div>




</body>
</html>
