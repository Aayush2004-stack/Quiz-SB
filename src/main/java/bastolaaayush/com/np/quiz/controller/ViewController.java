package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.service.QuestionService;
import bastolaaayush.com.np.quiz.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class ViewController {

    @Autowired
    private QuizService quizService;

    @Autowired
    private QuestionService questionService;

    @GetMapping("/homeView")
    public String showMainPage(){
        return "home";
    }

    @GetMapping("/signUpView")
    public String showSignUpPage(){
        return "signUp";
    }

    @GetMapping("/logInView")
    public String showLoginPage(){
        return "logIn";
    }

    @GetMapping("/addQuestionView/{quizId}")
    public String showAddQuestionPage(@PathVariable int quizId, Model model){
        Quiz quiz = quizService.getQuizById(quizId)
                .orElseThrow(() -> new RuntimeException("Quiz not found with id: " + quizId));

        model.addAttribute("quizId", quizId);
        model.addAttribute("questions", questionService.getQuestionsByQuizId(quiz));

        return "addQuestion";
    }

    @GetMapping("/editQuestionView/{questionId}")
    public String showEditQuestionPage(@PathVariable int questionId, Model model){

        model.addAttribute("questionId", questionId);
        return "editQuestion";
    }

    @GetMapping("/userHome")
    public String showUserHome(){
        return "userPage";
    }

    @GetMapping("/addCategory")
    public String showAddCategory(){
        return "addCategory";
    }



}
