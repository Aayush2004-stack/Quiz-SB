package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.Question;
import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.service.QuestionService;
import bastolaaayush.com.np.quiz.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @Autowired
    private QuizController quizController;

    @GetMapping("/getQuestion/{quizId}")
    public String getQuestionsByQuizId(@PathVariable int quizId, Model model){

        Quiz quiz =quizController.getQuizById(quizId);
        List<Question> questions = questionService.getQuestionsByQuizId(quiz);
        model.addAttribute("questions", questions);

        return "quizQuestions";

    }




}
