package kr.co.rap.system.recipe;

import kr.co.rap.system.model.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequestMapping("/recipe")
public class RecipeController {
    @Autowired
    private RecipeServiceImple recipeService;

    @GetMapping
    public ModelAndView viewRecipeList(
                @RequestParam(required = false) String name,
                    @RequestParam(defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("recipe/list");

        Recipe recipe = new Recipe();
        recipe.setName(name);

        List<Recipe> recipeList = recipeService.viewRecipeList(recipe);

        mav.addObject("recipeList", recipeList);
        mav.addObject("start", page * 10 - 10);
        mav.addObject("end", page * 10 - 1);

        return mav;
    }

    @GetMapping("/{no}")
    public ModelAndView viewRecipe(@PathVariable int no) {
        ModelAndView mav = new ModelAndView("recipe/view");

        Recipe recipe = new Recipe();
        recipe.setNo(no);

        recipe = recipeService.viewRecipe(recipe);
        mav.addObject("recipe", recipe);

        return mav;
    }

    @GetMapping("/form")
    public ModelAndView addRecipe() {
        return new ModelAndView("recipe/add");
    }

    @PostMapping
    public ModelAndView addRecipe(Recipe recipe) {
        return new ModelAndView(new RedirectView("/recipe/" + recipe.getNo()));
    }

    @GetMapping("/{no}/form")
    public ModelAndView editRecipe(@PathVariable String no) {

        return new ModelAndView("recipe/edit");
    }

    @PutMapping
    public ModelAndView editRecipe(Recipe recipe) {
        return new ModelAndView(new RedirectView("/recipe/" + recipe.getNo()));
    }

    @DeleteMapping
    public ModelAndView removeRecipe(Recipe recipe) {
        return new ModelAndView(new RedirectView("/recipe"));
    }
}
