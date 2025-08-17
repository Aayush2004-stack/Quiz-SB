package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.*;
import bastolaaayush.com.np.quiz.service.CategoryService;
import bastolaaayush.com.np.quiz.service.QuestionService;
import bastolaaayush.com.np.quiz.service.QuizService;
import bastolaaayush.com.np.quiz.service.ScoreService;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/quiz")
public class QuizController {

    @Autowired
    private ScoreService scoreService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private QuestionService questionService;

    @Autowired
    private QuizService quizService;

    @PostMapping("/insertQuiz")
    public void createQuiz(@RequestParam String quizName, @RequestParam String quizDescription, @RequestParam int noOfQuestionToPlay,@RequestParam int categoryId, HttpSession session){
        User user =(User) session.getAttribute("user");
        Category category =  categoryService.getCategoryById(categoryId).orElseThrow(() -> new RuntimeException("Category not found with id: " + categoryId));;
        Quiz quiz = new Quiz();
        quiz.setQuizName(quizName);
        quiz.setQuizDescription(quizDescription);
        quiz.setNoOfQuestionsToPlay(noOfQuestionToPlay);
        quiz.setUser(user);
        quiz.setCategory(category);

        quizService.insertQuiz(quiz);
    }

    @GetMapping("/setStatus/{quizId}/{status}")
    public String setStatus(@PathVariable int quizId, @PathVariable String status){
        Quiz quiz =getQuizById(quizId);
        if(status.equals("active")){
            quiz.setStatus(false);
            System.out.println("changing status");

        }
        else {
            System.out.println("changing status!!!!");
            quiz.setStatus(true);
        }
        quizService.setStatus(quiz);
        return "redirect:/quiz/getQuiz";
    }

    @GetMapping("/getQuiz")
    public String getQuizByUserId(HttpSession session, Model model){
        System.out.println("redirected");
        User user =(User) session.getAttribute("user");

        List<Quiz> quizzes= quizService.getQuizByUserId(user);
        model.addAttribute("quizzes",quizzes);
        return "quizzes";

    }
    @GetMapping("/deleteQuiz/{quizId}")
    public String deleteQuiz(@PathVariable int quizId){
        quizService.deleteQuiz(quizId);
        return "redirect:/quiz/getQuiz";

    }
    @GetMapping("/quizzes")
    public String getQuiz(Model model){
        model.addAttribute("availableQuizzes", quizService.getQuiz());
        return "playQuiz";
    }

    public Quiz getQuizById(int quizId){
        return quizService.getQuizById(quizId).orElseThrow(() -> new RuntimeException("Quiz not found with id: " + quizId));
    }

    @GetMapping("/playQuiz/{quizId}/{questionIndex}")
    public String getQuestionToPlay(@PathVariable int quizId, @PathVariable int questionIndex, Model model, HttpSession  session){
        Quiz quiz =getQuizById(quizId);
        List<Question> questions = questionService.getQuestionsByQuizId(quiz);

        model.addAttribute("total", questions.size());
        model.addAttribute("quizId", quizId);

        if (questionIndex < 0 || questionIndex >= questions.size()) {
            User user = (User) session.getAttribute("user");
            Integer userScore = (Integer) session.getAttribute("score");
            Score score =new Score();
            score.setQuiz(quiz);
            score.setUser(user);
            score.setScore(userScore);
            scoreService.insertScore(score);

            return "result"; // Quiz finished
        }
        Question currentQuestion = questions.get(questionIndex);
        model.addAttribute("question", currentQuestion);
        model.addAttribute("index", questionIndex);


        return "quizGame";
    }

    @PostMapping("/check/{quizId}/{questionIndex}")
    public String checkAnswer(
            @PathVariable int quizId,
            @PathVariable int questionIndex,
            @RequestParam("questionId") int questionId,
            @RequestParam("selectedOption") String selectedOption,
            HttpSession session) {

        Integer score = (Integer) session.getAttribute("score");
        if (score == null) score = 0;

        // Calculate new score
        score = questionService.calculateScore(questionId, selectedOption, score);
        System.out.println("the score is:"+score);

        session.setAttribute("score", score);

        return "redirect:/quiz/playQuiz/" + quizId + "/" + (questionIndex + 1);
    }

}
