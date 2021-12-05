package kr.co.rap.system.ingredient;

import kr.co.rap.system.page.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/ingredient")
public class IngredientController {
    @Autowired
    private IngredientService ingredientService;
    @Autowired
    private PageUtil pageUtil;

    @GetMapping
    public ModelAndView viewIngredientList() {
        return new ModelAndView("ingredient/list");
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> viewIngredientList(@RequestParam Map<String, String> ingredient) {
        Map<String, Object> result = new HashMap<String, Object>();

        String tag = pageUtil.getNavigator(ingredient.get("url"), Integer.parseInt(ingredient.get("page")));

        int limitNo = Integer.parseInt(ingredient.get("page"));
        ingredient.put("page",(limitNo * 10 - 10) + "");
        List<Ingredient> ingredientList = ingredientService.viewIngredientList(ingredient);

        result.put("ingredientList", ingredientList);
        result.put("tag", tag);

        return result;
    }

    @GetMapping("/{no}")
    public ModelAndView viewIngredient(Ingredient ingredient) {
        ingredient = ingredientService.viewIngredient(ingredient);

        ModelAndView mav = new ModelAndView("ingredient/view");
        mav.addObject("ingredient", ingredient);

        return mav;
    }

    @GetMapping("/form")
    public ModelAndView addIngredient() {
        return new ModelAndView("ingredient/add");
    }

    @PostMapping
    public ModelAndView addIngredient(Ingredient ingredient) {
        boolean result = ingredientService.addIngredient(ingredient);

        if (result) {
            ModelAndView mav = new ModelAndView(new RedirectView("/ingredient"));

            return mav;
        }

        ModelAndView retry = new ModelAndView("ingredient/add");
        retry.addObject("msg", "1");

        return retry;
    }

    @GetMapping("/{no}/form")
    public ModelAndView editIngredient(@PathVariable int no) {
        Ingredient ingredient = new Ingredient();
        ingredient.setNo(no);

        ingredient = ingredientService.viewIngredient(ingredient);

        ModelAndView mav = new ModelAndView("ingredient/edit");
        mav.addObject("ingredient", ingredient);

        return mav;
    }

    @PutMapping
    public ModelAndView editIngredient(Ingredient ingredient) {
        if (ingredientService.editIngredient(ingredient)) {
            ModelAndView mav = new ModelAndView(new RedirectView("/ingredient"));

            return mav;
        }

        ModelAndView retry = new ModelAndView(new RedirectView("/ingredient/" + ingredient.getNo() + "/form"));
        retry.addObject("error", "1");

        return retry;

    }

    @DeleteMapping
    public ModelAndView removeIngredient(Ingredient ingredient) {
        ingredientService.removeIngredient(ingredient);

        return new ModelAndView(new RedirectView("/ingredient"));
    }
}
