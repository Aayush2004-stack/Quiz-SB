package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.Category;
import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.model.User;
import bastolaaayush.com.np.quiz.service.CategoryService;
import bastolaaayush.com.np.quiz.service.QuizService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/quiz")
public class QuizController {

    @Autowired
    private CategoryController categoryController;

    @Autowired
    private QuizService quizService;

    @PostMapping("/insertQuiz")
    public void createQuiz(@RequestParam String quizName, @RequestParam String quizDescription, @RequestParam int noOfQuestionToPlay,@RequestParam int categoryId, HttpSession session){
        User user =(User) session.getAttribute("user");
        Category category =  categoryController.getCategoryById(categoryId);
        Quiz quiz = new Quiz();
        quiz.setQuizName(quizName);
        quiz.setQuizDescription(quizDescription);
        quiz.setNoOfQuestionsToPlay(noOfQuestionToPlay);
        quiz.setUser(user);
        quiz.setCategory(category);

        quizService.insertQuiz(quiz);
    }

    @GetMapping("/getQuiz")
    public String getQuizByUserId(HttpSession session, Model model){
        System.out.println("redirected");
        User user =(User) session.getAttribute("user");

        List<Quiz> quizzes= quizService.getQuizByUserId(user);
        model.addAttribute("quizzes",quizzes);
        return "quizzes";

    }
    @GetMapping("/deleteQuiz/{quizId}")
    public String deleteQuiz(@PathVariable int quizId){
        quizService.deleteQuiz(quizId);
        return "redirect:/quiz/getQuiz";

    }

    public Quiz getQuizById(int quizId){
        return quizService.getQuizById(quizId).orElseThrow(() -> new RuntimeException("Quiz not found with id: " + quizId));
    }






}
