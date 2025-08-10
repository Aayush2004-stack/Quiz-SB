<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>$</title>
</head>
<body>
<main class="card">
    <c:forEach var="question" items="${questions}">
        <h1>${question.title}</h1>
        <p class="subtitle">Select one of the options below:</p>

        <form>
          <fieldset>
            <div class="option">
              <input type="radio" id="opt1" name="choice" value="option1">
              <label for="opt1">Option 1 — ${question.option1}</label>
            </div>

            <div class="option">
              <input type="radio" id="opt2" name="choice" value="option2">
              <label for="opt2">Option 2 — ${question.option2}</label>
            </div>

            <div class="option">
              <input type="radio" id="opt3" name="choice" value="option3">
              <label for="opt3">Option 3 — ${question.option3}</label>
            </div>

            <div class="option">
              <input type="radio" id="opt4" name="choice" value="option3">
              <label for="opt3">Option 4 — ${question.correctOption}</label>
            </div>
          </fieldset>
        </form>

    </c:forEach>
  </main>

</body>
</html>
