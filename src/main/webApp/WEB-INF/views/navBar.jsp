<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="bg-white border-gray-200 dark:bg-gray-900 shadow-md">
  <div class="max-w-screen-xl flex items-center justify-between mx-auto p-4">

    <!-- Logo + Brand -->
    <a href="${pageContext.request.contextPath}/userPage" class="flex items-center space-x-3 rtl:space-x-reverse">

        <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">QuizVerse</span>
    </a>

    <!-- Menu Items -->
    <div class="w-auto">
      <ul class="font-medium flex flex-row space-x-6 rtl:space-x-reverse mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">

        <!-- Home -->
        <li>
          <c:choose>
            <%-- If logged in --%>
            <c:when test="${not empty sessionScope.user}">
              <a href="${pageContext.request.contextPath}/userHome"
                 class="block py-2 px-3 text-white bg-blue-700 rounded-sm md:bg-transparent md:text-blue-700 md:p-0
                        dark:text-white md:dark:text-blue-500">
                Home
              </a>
            </c:when>
            <%-- If not logged in --%>
            <c:otherwise>
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
            <%-- If logged in, show hamburger menu --%>
            <c:when test="${not empty sessionScope.user}">
                <li>
                  <div class="relative">
                    <!-- Hamburger button -->
                    <button id="menu-toggle" type="button"
                            class="inline-flex items-center p-2 w-10 h-10 justify-center text-sm text-gray-500 rounded-lg hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600">
                      <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20"
                           xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M3 5h14a1 1 0 010 2H3a1 1 0 010-2zm0 5h14a1 1 0 010 2H3a1 1 0 010-2zm0 5h14a1 1 0 010 2H3a1 1 0 010-2z"
                              clip-rule="evenodd"></path>
                      </svg>
                    </button>

                    <!-- Dropdown -->
                    <div id="menu-dropdown"
                         class="hidden absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg dark:bg-gray-800">
                      <ul class="py-2 text-sm text-gray-700 dark:text-gray-200">
                        <li>
                          <a href="${pageContext.request.contextPath}/quiz/getQuiz"
                             class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700">My Quizzes</a>
                        </li>
                        <li>
                          <a href="${pageContext.request.contextPath}/scoreBoard"
                             class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700">My Scores</a>
                        </li>
                        <li>
                          <a href="${pageContext.request.contextPath}/user/logOut"
                             class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700">Logout</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </li>
                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" class="h-8" alt="Quiz Logo" />
            </c:when>

            <%-- If NOT logged in, show Sign Up & Login buttons --%>
            <c:otherwise>
                <li>
                    <a href="${pageContext.request.contextPath}/signUpView"
                       class="px-4 py-2 text-white bg-blue-600 rounded-lg hover:bg-blue-700">Sign Up</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logInView"
                       class="px-4 py-2 text-white bg-gray-600 rounded-lg hover:bg-gray-700">Login</a>
                </li>
            </c:otherwise>
        </c:choose>

      </ul>
    </div>
  </div>
</nav>

<!-- Toggle Dropdown Script -->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    const toggleBtn = document.getElementById("menu-toggle");
    const dropdown = document.getElementById("menu-dropdown");
    if (toggleBtn && dropdown) {
      toggleBtn.addEventListener("click", () => {
        dropdown.classList.toggle("hidden");
      });
    }
  });
</script>