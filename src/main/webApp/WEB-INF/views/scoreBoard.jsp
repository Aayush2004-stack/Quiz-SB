<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Scoreboard</title>
<script src="https://cdn.tailwindcss.com"></script>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    background: linear-gradient(135deg,#1b1f3b,#0f2027);
    color: #f0f0f0;
    min-height: 100vh;
  }

  h1 {
    text-align: center;
    font-size: 2rem;
    color: #4e73df;
    margin: 30px 0;
  }

  table {
    width: 90%;
    max-width: 900px;
    margin: 0 auto 40px auto;
    border-collapse: collapse;
    background: #222a4a;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 6px 20px rgba(0,0,0,0.6);
  }

  th, td {
    padding: 12px 20px;
    text-align: left;
    color: #f0f0f0;
  }

  th {
    background-color: #4e73df;
  }

  tr:nth-child(even) {
    background-color: #2a3360;
  }

  tr:hover {
    background-color: #1cc88a;
    color: #000;
  }

</style>
</head>
<body>

<%@ include file="/WEB-INF/views/navBar.jsp" %>

<h1>Scoreboard</h1>

<table>
  <thead>
    <tr>
      <th>SN</th>
      <th>User Name</th>
      <th>Score</th>
      <th>Played Date</th>
    </tr>
  </thead>
  <tbody>
    <c:set var="sn" value="1"/>
    <c:forEach var="score" items="${scores}">
      <tr>
        <td><c:out value="${sn}"/></td>
        <td><c:out value="${score.user.fullName}"/></td>
        <td><c:out value="${score.score}"/></td>
        <td><c:out value="${score.playedDate}"/></td>
      </tr>
      <c:set var="sn" value="${sn + 1}"/>
    </c:forEach>
  </tbody>
</table>

</body>
</html>