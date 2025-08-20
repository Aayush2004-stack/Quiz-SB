package bastolaaayush.com.np.quiz.model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.sql.Date;

@Entity
@Table(name = "quizzes")
public class Quiz {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int quizId; //Pk

    private String quizName;
    private String quizDescription;
    private int noOfQuestionsToPlay;

    @Column(name = "status", columnDefinition = "BOOLEAN DEFAULT false")
    private Boolean status= false;

    @CreationTimestamp
    @Column(name ="createdDate", nullable = false,updatable = false)
    private Date createdDate;

    // many quizzes belong to one user
    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private User user; //userId is the fk so getting user as an object to get userId

    // many quizzes belong to one category
    @ManyToOne
    @JoinColumn(name = "categoryId",nullable = false)
    private Category category; //category is the fk so getting category as an object to get quizId

    public String getQuizName() {
        return quizName;
    }

    public void setQuizName(String quizName) {
        this.quizName = quizName;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getQuizDescription() {
        return quizDescription;
    }

    public void setQuizDescription(String quizDescription) {
        this.quizDescription = quizDescription;
    }

    public int getNoOfQuestionsToPlay() {
        return noOfQuestionsToPlay;
    }

    public void setNoOfQuestionsToPlay(int noOfQuestionsToPlay) {
        this.noOfQuestionsToPlay = noOfQuestionsToPlay;
    }

    public String getStatus() {
        if(status){
            return "active";
        }
        return "inActive";
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
