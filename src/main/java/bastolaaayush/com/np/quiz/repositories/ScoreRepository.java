package bastolaaayush.com.np.quiz.repositories;

import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.model.Score;
import bastolaaayush.com.np.quiz.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ScoreRepository extends JpaRepository<Score,Integer> {
    List<Score> findByUser(User user);

    @Query("""
    SELECT s FROM Score s
    WHERE s.quiz = :quiz AND
          s.score = (SELECT MAX(s2.score) 
                     FROM Score s2 
                     WHERE s2.quiz = :quiz AND s2.user.id = s.user.id)
    ORDER BY s.score DESC
""")
    List<Score> findScoresByQuiz(@Param("quiz") Quiz quiz);


}
