package bastolaaayush.com.np.quiz.model;

import jakarta.persistence.*;

@Entity
@Table(name = "score")
public class Score {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int scoreId; //pk

    // many scores belong to one user
    @ManyToOne
    @JoinColumn(name = "userID", nullable = false)
    private User user; //fk

    // many scores belong to one of the quizzes
    @ManyToOne
    @JoinColumn(name = "quizId", nullable = false)
    private Quiz quiz; //fk

    public int getScoreId() {
        return scoreId;
    }

    public void setScoreId(int scoreId) {
        this.scoreId = scoreId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Quiz getQuiz() {
        return quiz;
    }

    public void setQuiz(Quiz quiz) {
        this.quiz = quiz;
    }
}
