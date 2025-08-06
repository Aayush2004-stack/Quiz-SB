package bastolaaayush.com.np.quiz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;


@Controller
public class ViewController {
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

        model.addAttribute("quizId", quizId);
        return "addQuestion";
    }

    @GetMapping("/editQuestionView/{questionId}")
    public String showEditQuestionPage(@PathVariable int questionId, Model model){

        model.addAttribute("questionId", questionId);
        return "editQuestion";
    }



}
