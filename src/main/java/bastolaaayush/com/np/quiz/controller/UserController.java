package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.User;
import bastolaaayush.com.np.quiz.repositories.UserRepository;
import bastolaaayush.com.np.quiz.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

   @Autowired
   private UserService userService;

   @Autowired
   private HttpSession session;

    @PostMapping("/signUp")
    public String signUp(@RequestParam String fullName, @RequestParam String username, @RequestParam String password){
        User user = new User();
        user.setFullName(fullName);
        user.setUsername(username);
        user.setPassword(password);
        userService.insertUser(user);
        return"logIn";

    }
    @PostMapping("/logIn")
    public String logIn(@RequestParam String username, @RequestParam String password){
        User user = userService.logIn(username, password);
        if(user!=null){
            System.out.println("Login success");
            session.setAttribute("user",user);

            if(user.isAdmin()){
                return "adminPage";
            }
            else {
                return "userPage";
            }
        }
        else{
            return "Failed logging in";
        }

    }
    @GetMapping("/logOut")
    public String logout(HttpSession session) {
        session.invalidate(); // Invalidate the session to log out the user
        return "home";
    }
}
