package bastolaaayush.com.np.quiz.service;

import bastolaaayush.com.np.quiz.model.Question;
import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.repositories.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionService {

    @Autowired
    private QuestionRepository questionRepository;

    public List<Question> getQuestionsByQuizId(Quiz quiz){
        return questionRepository.findByQuiz(quiz);
    }

    public Question getQuestionsById(int questionId){
        return questionRepository.findById(questionId).orElseThrow();
    }

    public void deleteQuestion(int questionId){
        questionRepository.deleteById(questionId);
    }

    public void editQuestion(Question question){
        questionRepository.save(question);
    }

    public void addQuestion(Question question){
        questionRepository.save(question);
    }


}
