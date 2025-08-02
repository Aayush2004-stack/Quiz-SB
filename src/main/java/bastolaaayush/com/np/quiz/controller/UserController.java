package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.User;
import bastolaaayush.com.np.quiz.repositories.UserRepository;
import bastolaaayush.com.np.quiz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

   @Autowired
    private UserService userService;

    @PostMapping("/signUp")
    public void signUp(@RequestParam String fullName, @RequestParam String username, @RequestParam String password){
        User user = new User();
        user.setFullName(fullName);
        user.setUsername(username);
        user.setPassword(password);
        userService.insertUser(user);


    }
}
