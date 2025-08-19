<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Category - Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gradient-to-br from-gray-900 via-gray-800 to-gray-900 min-h-screen text-white">

    <!-- Include Admin Navbar -->

    <%@ include file="/WEB-INF/views/adminNav.jsp" %>

    <!-- Page Content -->
    <div class="flex flex-col items-center mt-10 px-4">
        <h1 class="text-3xl font-bold text-blue-400 mb-8">Add a New Category</h1>

        <div class="bg-gray-800 shadow-lg rounded-xl p-8 w-full max-w-md">
            <form action="${pageContext.request.contextPath}/category" method="post" class="space-y-6">

                <!-- Category Name -->
                <div>
                    <label for="categoryName" class="block mb-2 font-semibold">Category Name:</label>
                    <input type="text" id="categoryName" name="categoryName" required
                           class="w-full px-4 py-2 rounded-lg bg-gray-700 border border-gray-600 text-white focus:ring-2 focus:ring-blue-500 focus:outline-none"/>
                </div>

                <!-- Category Description -->
                <div>
                    <label for="categoryDescription" class="block mb-2 font-semibold">Category Description:</label>
                    <input type="text" id="categoryDescription" name="categoryDescription" required
                           class="w-full px-4 py-2 rounded-lg bg-gray-700 border border-gray-600 text-white focus:ring-2 focus:ring-green-500 focus:outline-none"/>
                </div>

                <!-- Submit Button -->
                <div>
                    <input type="submit" value="Create"
                           class="w-full bg-green-500 hover:bg-green-600 text-white font-bold py-3 rounded-lg transition duration-300 cursor-pointer"/>
                </div>
            </form>
        </div>
    </div>

</body>
</html>