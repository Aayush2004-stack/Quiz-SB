package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.Quiz;
import bastolaaayush.com.np.quiz.model.Score;
import bastolaaayush.com.np.quiz.model.User;
import bastolaaayush.com.np.quiz.service.QuizService;
import bastolaaayush.com.np.quiz.service.ScoreService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/scoreBoard")
public class ScoreController {

    @Autowired
    private ScoreService scoreService;

    @Autowired
    private QuizService quizService;

    @GetMapping
    public String getUserScoreBoard(Model model, HttpSession session){
        User user =(User) session.getAttribute("user");
        List<Score> scores= scoreService.getUserScores(user);
        model.addAttribute("scores",scores);
        return "userScore";

    }

    @GetMapping("/quizScore/{quizId}")
    public String getAllScoreByQuiz(@PathVariable int quizId, Model model){
        Quiz quiz= quizService.getQuizById(quizId).orElseThrow();
        List<Score> scores = scoreService.getQuizScores(quiz);
        model.addAttribute("scores",scores);
        return "scoreBoard";



    }
}
