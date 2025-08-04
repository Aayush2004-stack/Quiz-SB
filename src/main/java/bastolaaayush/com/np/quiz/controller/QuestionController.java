package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.Question;
import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.service.QuestionService;
import bastolaaayush.com.np.quiz.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/question")
public class QuestionController {

    @Autowired
    private QuestionService questionService;

    @GetMapping("/getQuestion")
    public String getQuestionsByQuizId(@RequestParam int quizId, Model model){


        Quiz quiz = new Quiz();// replace with the actual quiz object of the selected quiz
        List<Question> questions = questionService.getQuestionsByQuizId(quiz);
        model.addAttribute("questions", questions);

        return "quizQuestions";

    }




}
