package bastolaaayush.com.np.quiz.repositories;

import bastolaaayush.com.np.quiz.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {
}
