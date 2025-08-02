package bastolaaayush.com.np.quiz.service;

import bastolaaayush.com.np.quiz.model.User;
import bastolaaayush.com.np.quiz.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    //SignUp
    public void insertUser(User user){
        userRepository.save(user);//insert user details in the db
    }
    //LogIn
    public User logIn(String username, String password){
        Optional<User> optionalUser = userRepository.findByUsername(username);//gets user info through username
        if(optionalUser.isPresent()){
            User user = optionalUser.get();
            String retrievedPassword= user.getPassword();
            if(password.equals(retrievedPassword)){
                return user;
            }
            else {
                System.out.println("Invalid password");
            }
        }
        return null;
    }
}
