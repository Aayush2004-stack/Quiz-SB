<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="bg-white border-gray-200 dark:bg-gray-900 shadow-md">
  <div class="max-w-screen-xl flex items-center justify-between mx-auto p-4">

    <!-- Logo + Brand -->
    <a href="${pageContext.request.contextPath}/userPage" class="flex items-center space-x-3 rtl:space-x-reverse">
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" class="h-8" alt="Quiz Logo" />
        <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">QuizMaster</span>
    </a>

    <!-- Menu Items -->
    <div class="w-auto">
      <ul class="font-medium flex flex-row space-x-6 rtl:space-x-reverse mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">

        <!-- Home -->
        <li>
          <c:choose>
            <c:when test="${not empty sessionScope.user}">
              <!-- If logged in -->
              <a href="${pageContext.request.contextPath}/userHome"
                 class="block py-2 px-3 text-white bg-blue-700 rounded-sm md:bg-transparent md:text-blue-700 md:p-0
                        dark:text-white md:dark:text-blue-500">
                Home
              </a>
            </c:when>
            <c:otherwise>
              <!-- If NOT logged in -->
              <a href="${pageContext.request.contextPath}/homeView"
                 class="block py-2 px-3 text-white bg-blue-700 rounded-sm md:bg-transparent md:text-blue-700 md:p-0
                        dark:text-white md:dark:text-blue-500">
                Home
              </a>
            </c:otherwise>
          </c:choose>
        </li>

        <!-- Play Quiz -->
        <li>
          <a href="${pageContext.request.contextPath}/quiz/quizzes"
             class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                    md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
             Play Quiz
          </a>
        </li>

        <!-- My Quizzes (only logged-in) -->
        <c:if test="${not empty sessionScope.user}">
            <li>
              <a href="${pageContext.request.contextPath}/quiz/getQuiz"
                 class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                        md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
                 My Quizzes
              </a>
            </li>
        </c:if>

        <!-- Create Quiz -->
        <li>
          <a href="${pageContext.request.contextPath}/category/getCategories"
             class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                    md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
             Create Quiz
          </a>
        </li>

        <!-- Auth Section -->
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <li>
                    <a href="${pageContext.request.contextPath}/user/logOut"
                       class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                              md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
                       Logout
                    </a>
                </li>
            </c:when>
            <c:otherwise>
                <li>
                    <a href="${pageContext.request.contextPath}/signUpView"
                       class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                              md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
                       Sign Up
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logInView"
                       class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                              md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
                       Login
                    </a>
                </li>
            </c:otherwise>
        </c:choose>

      </ul>
    </div>
  </div>
</nav>