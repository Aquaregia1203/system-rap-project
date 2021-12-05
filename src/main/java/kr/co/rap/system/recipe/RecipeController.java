package kr.co.rap.system.recipe;

import kr.co.rap.system.ingredient.Ingredient;
import kr.co.rap.system.ingredient.IngredientMapper;
import kr.co.rap.system.ingredient.IngredientServiceImple;
import kr.co.rap.system.page.PageUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/recipe")
public class RecipeController {
    private static Logger logger
            = LogManager.getLogger(RecipeController.class);
    @Autowired
    private RecipeServiceImple recipeService;
    @Autowired
    private IngredientServiceImple ingredientService;
    @Autowired
    private PageUtil pageUtil;

    @GetMapping
    public ModelAndView viewRecipeList() {
        return new ModelAndView("recipe/list");
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> search(@RequestParam Map<String, String> recipe) {
        Map<String, Object> result = new HashMap<String, Object>();

        String tag = pageUtil.getNavigator(recipe.get("url"), Integer.parseInt(recipe.get("page")));

        int limitNo = Integer.parseInt(recipe.get("page"));
        recipe.put("page", (limitNo * 10 -10) + "");
        List<Recipe> recipeList = recipeService.viewRecipeList(recipe);

        result.put("recipeList", recipeList);
        result.put("tag", tag);

        return result;
    }

    @GetMapping("/{no}")
    public ModelAndView viewRecipe(Recipe recipe) {
        ModelAndView mav = new ModelAndView("recipe/view");

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
                ingredientService.viewIngredientList(new HashMap<String, String>());
        mav.addObject("ingredientList", ingredientList);

        return mav;
    }

    @PostMapping
    public ModelAndView addRecipe(Recipe recipe) {
        List<Mix> mixList = recipe.getMixList();

        if (recipe.getName() == null) {
            return new ModelAndView(new RedirectView("/recipe/form"));
        }

        for (Mix mix : mixList) {
            if (mix.getIngredientNo() == 0
                    && mix.getPumpNo() == 0
                        && mix.getRatio() == 0) {
                return new ModelAndView(new RedirectView("/recipe/form"));
            }
        }

        if (!recipeService.addRecipe(recipe)) {
            ModelAndView mav = new ModelAndView("recipe/add");
            List<Ingredient> ingredientList =
                    ingredientService.viewIngredientList(new HashMap<String, String>());
            mav.addObject("ingredientList", ingredientList);
            mav.addObject("recipeDuplication", "* 레시피명이 중복됩니다.");

            return mav;
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
                ingredientService.viewIngredientList(new HashMap<String, String>()));

        if (recipe == null) {
            return new ModelAndView(new RedirectView("/recipe"));
        } else {
            return mav;
        }
    }

    @PutMapping
    public ModelAndView editRecipe(Recipe recipe) {
        List<Mix> mixList = recipe.getMixList();

        if (recipe.getName() == null) {
            return new ModelAndView(new RedirectView("/recipe/" + recipe.getNo() + "/form"));
        }

        Iterator<Mix> mixIterator = mixList.iterator();

        while (mixIterator.hasNext()) {
            Mix mix = mixIterator.next();

            if (mix.getIngredientNo() == 0
                    || mix.getPumpNo() == 0
                        || mix.getRatio() == 0) {
                mixIterator.remove();
            }
        }

        if (!recipeService.editRecipe(recipe)) {

            ModelAndView retry = new ModelAndView(new RedirectView("/recipe/" + recipe.getNo() + "/form"));
            retry.addObject("error", "1");

            return retry;
        }

        return new ModelAndView(new RedirectView("/recipe/" + recipe.getNo()));
    }

    @DeleteMapping
    public ModelAndView removeRecipe(Recipe recipe) {
        recipeService.removeRecipe(recipe);

        ModelAndView mav = new ModelAndView(new RedirectView("/recipe"));
        mav.addObject("redirect", "라고합니다");

        return mav;
    }
}
