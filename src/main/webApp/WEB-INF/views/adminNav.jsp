<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="bg-white border-gray-200 dark:bg-gray-900 shadow-md">
  <div class="max-w-screen-xl flex items-center justify-between mx-auto p-4">

    <!-- Logo + Brand -->
    <a href="${pageContext.request.contextPath}/admin/home" class="flex items-center space-x-3 rtl:space-x-reverse">
        <span class="self-center text-2xl font-semibold whitespace-nowrap dark:text-white">QuizVerse Admin</span>
    </a>

    <!-- Menu Items -->
    <div class="w-auto">
      <ul class="font-medium flex flex-row space-x-6 rtl:space-x-reverse mt-0 md:border-0 md:bg-white dark:bg-gray-800 md:dark:bg-gray-900 dark:border-gray-700">

        <!-- Quizzes -->
        <li>
          <a href="${pageContext.request.contextPath}/quiz/quizzes"
             class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                    md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
             Quizzes
          </a>
        </li>

        <!-- Categories -->
        <li>
          <a href="${pageContext.request.contextPath}/admin/categories"
             class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                    md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
             Categories
          </a>
        </li>

        <!-- Add Category -->
        <li>
          <a href="${pageContext.request.contextPath}/addCategory"
             class="block py-2 px-3 text-blue-700 rounded-sm hover:bg-blue-600 md:hover:bg-transparent
                    md:border-0 md:hover:text-blue-900 md:p-0 dark:text-blue-400 md:dark:hover:text-blue-500">
             Add Category
          </a>
        </li>

        <!-- Auth Section -->
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
                  <a href="${pageContext.request.contextPath}/admin/logout"
                     class="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-700">Logout</a>
                </li>
              </ul>
            </div>
          </div>
        </li>
        <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" class="h-8" alt="Admin Avatar" />
      </ul>
    </div>
  </div>
</nav>

<!-- Scripts -->
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