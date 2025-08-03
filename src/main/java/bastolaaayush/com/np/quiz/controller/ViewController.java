package bastolaaayush.com.np.quiz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
    @GetMapping("/homeView")
    public String showMainPage(){
        return "home";
    }
    @GetMapping("/signUpView")
    public String showLoginPage(){
        return "signUp";
    }


}
