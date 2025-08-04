package bastolaaayush.com.np.quiz.repositories;

import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface QuizRepository extends JpaRepository<Quiz, Integer> {
    List<Quiz> findByUser(User user);
}
