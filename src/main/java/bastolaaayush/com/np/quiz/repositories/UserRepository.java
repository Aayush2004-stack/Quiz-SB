package bastolaaayush.com.np.quiz.repositories;

import bastolaaayush.com.np.quiz.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByUsername(String username); //find user by username and return user
}
