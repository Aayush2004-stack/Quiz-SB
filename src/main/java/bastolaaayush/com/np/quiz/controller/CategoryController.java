package bastolaaayush.com.np.quiz.controller;

import bastolaaayush.com.np.quiz.model.Category;
import bastolaaayush.com.np.quiz.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/category")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @PostMapping
    public void addCategory(@RequestParam String categoryName, @RequestParam String categoryDescription){
        Category category = new Category();
        category.setCategoryName(categoryName);
        category.setCategoryDescription(categoryDescription);
        categoryService.insertCategory(category);

    }

    @GetMapping("/getCategories")
    public String getCategories(Model model){
        List<Category> categories = categoryService.getCategories();
        model.addAttribute("categories", categories);
        return "createQuiz";

    }
}
