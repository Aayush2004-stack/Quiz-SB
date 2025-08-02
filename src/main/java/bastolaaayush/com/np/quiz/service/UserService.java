package bastolaaayush.com.np.quiz.service;

import bastolaaayush.com.np.quiz.model.User;
import bastolaaayush.com.np.quiz.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public void insertUser(User user){
        userRepository.save(user);

    }
}
