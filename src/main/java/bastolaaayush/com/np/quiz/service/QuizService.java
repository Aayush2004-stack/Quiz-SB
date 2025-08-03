package bastolaaayush.com.np.quiz.service;

import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.repositories.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuizService {

    @Autowired
    private QuizRepository quizRepository;
    public void insertQuiz(Quiz quiz){
        quizRepository.save(quiz);

    }

}
