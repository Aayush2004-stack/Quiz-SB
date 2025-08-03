package bastolaaayush.com.np.quiz.service;

import bastolaaayush.com.np.quiz.model.Category;
import bastolaaayush.com.np.quiz.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryService {

    @Autowired
    private CategoryRepository categoryRepository;

    public void insertCategory(Category category){
        categoryRepository.save(category);
    }
}
