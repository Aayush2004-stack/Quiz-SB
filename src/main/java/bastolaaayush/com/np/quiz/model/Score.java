package bastolaaayush.com.np.quiz.model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Date;

@Entity
@Table(name = "scores")
public class Score {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int scoreId; //pk

    private int score;

    @CreationTimestamp
    @Column(name = "playedDate", updatable = false, nullable = false)
    private Date playedDate;

    // many scores belong to one user
    @ManyToOne
    @JoinColumn(name = "userID", nullable = false)
    private User user; //fk

    // many scores belong to one of the quizzes
    @ManyToOne
    @JoinColumn(name = "quizId", nullable = false)
    private Quiz quiz; //fk

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public Date getPlayedDate() {
        return playedDate;
    }

    public void setPlayedDate(Date playedDate) {
        this.playedDate = playedDate;
    }

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
