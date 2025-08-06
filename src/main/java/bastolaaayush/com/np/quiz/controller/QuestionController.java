package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.Question;
import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.service.QuestionService;
import bastolaaayush.com.np.quiz.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        for(Question question: questions){
            System.out.println(question.getQuestionId());

        }
        model.addAttribute("questions", questions);



        return "quizQuestions";

    }

    @PostMapping("/addQuestion")
    public void addQuestion(@RequestParam int quizId, @RequestParam String title, @RequestParam String option1,
                            @RequestParam String option2,@RequestParam String option3,@RequestParam String correctOption){


        Quiz quiz =quizController.getQuizById(quizId);
        Question question = new Question();
        question.setTitle(title);
        question.setOption1(option1);
        question.setOption2(option2);
        question.setOption3(option3);
        question.setCorrectOption(correctOption);
        question.setQuiz(quiz);

        questionService.addQuestion(question);

    }

    @PostMapping("/editQuestion/{questionId}")
    public void editQuestion( @PathVariable int questionId,@RequestParam String title, @RequestParam String option1,
                            @RequestParam String option2,@RequestParam String option3,@RequestParam String correctOption){


        Question question = getQuestionById(questionId);
        question.setTitle(title);
        question.setOption1(option1);
        question.setOption2(option2);
        question.setOption3(option3);
        question.setCorrectOption(correctOption);


        questionService.editQuestion(question);

    }

    public Question getQuestionById(int questionId){
        return questionService.getQuestionsById(questionId);
    }




}
