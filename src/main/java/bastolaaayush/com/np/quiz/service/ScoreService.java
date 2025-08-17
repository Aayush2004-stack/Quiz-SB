package bastolaaayush.com.np.quiz.service;

import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.model.Score;
import bastolaaayush.com.np.quiz.model.User;
import bastolaaayush.com.np.quiz.repositories.ScoreRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ScoreService {

    @Autowired
    private ScoreRepository scoreRepository;

    public void insertScore(Score score){
        scoreRepository.save(score);

    }

    public List<Score> getUserScores(User user){
        return scoreRepository.findByUser(user);

    }

    public List<Score> getQuizScores(Quiz quiz){
        return scoreRepository.findScoresByQuiz(quiz);
    }
}
