package kr.co.rap.system.recipe;

import kr.co.rap.system.ingredient.Ingredient;
import kr.co.rap.system.ingredient.IngredientMapper;
import kr.co.rap.system.ingredient.IngredientServiceImple;
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
    @Autowired
    private IngredientServiceImple ingredientService;

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

        if (recipe == null) {
            return new ModelAndView(new RedirectView("/recipe"));
        }


        return mav;
    }

    @GetMapping("/form")
    public ModelAndView addRecipe() {
        ModelAndView mav = new ModelAndView("recipe/add");

        List<Ingredient> ingredientList =
                ingredientService.viewIngredientList(new Ingredient());
        mav.addObject("ingredientList", ingredientList);

        return mav;
    }

    @PostMapping
    public ModelAndView addRecipe(Recipe recipe) {
        if (recipe.getName() != null) {
            recipeService.addRecipe(recipe);
        }

        return new ModelAndView(new RedirectView("/recipe/" + recipe.getNo()));
    }

    @GetMapping("/{no}/form")
    public ModelAndView editRecipe(@PathVariable int no) {
        ModelAndView mav = new ModelAndView("recipe/edit");

        Recipe recipe = new Recipe();
        recipe.setNo(no);
        recipe = recipeService.viewRecipe(recipe);

        mav.addObject("recipe", recipe);
        mav.addObject("ingredientList",
                ingredientService.viewIngredientList(new Ingredient()));

        if (recipe == null) {
            return new ModelAndView(new RedirectView("/recipe"));
        } else {
            return mav;
        }
    }

    @PutMapping
    public ModelAndView editRecipe(Recipe recipe) {
        recipeService.editRecipe(recipe);

        return new ModelAndView(new RedirectView("/recipe/" + recipe.getNo()));
    }

    @DeleteMapping
    public ModelAndView removeRecipe(Recipe recipe) {
        recipeService.removeRecipe(recipe);

        return new ModelAndView(new RedirectView("/recipe"));
    }
}
