package kr.co.rap.system.ingredient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@RestController
@RequestMapping("/ingredient")
public class IngredientController {
    @Autowired
    private IngredientServiceImple ingredientServiceImple;

    @GetMapping
    public ModelAndView viewIngredientList() {
        return new ModelAndView("ingredient/list");
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public List<Ingredient> viewIngredientList(Ingredient ingredient) {
       List<Ingredient> ingredientList = ingredientServiceImple.viewIngredientList(ingredient);
       return ingredientList;
    }

    @GetMapping("/{no}")
    public ModelAndView viewIngredient(Ingredient ingredient) {

        ingredient = ingredientServiceImple.viewIngredient(ingredient);

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
        boolean result = ingredientServiceImple.addIngredient(ingredient);
        if (result) {
            ModelAndView mav = new ModelAndView(new RedirectView("/ingredient"));
            return mav;
        }
        ModelAndView retry = new ModelAndView("ingredient/add");
        retry.addObject("msg", "*중복되는 원재료 입니다.");
        return retry;
    }

    @GetMapping("/{no}/form")
    public ModelAndView editIngredient(@PathVariable int no) {
        Ingredient ingredient = new Ingredient();
        ingredient.setNo(no);

        ingredient = ingredientServiceImple.viewIngredient(ingredient);
        ModelAndView mav = new ModelAndView("ingredient/edit");
        mav.addObject("ingredient", ingredient);
        return mav;
    }

    @PutMapping
    public ModelAndView editIngredient(Ingredient ingredient) {
        boolean result = ingredientServiceImple.editIngredient(ingredient);
        if (result) {
            ModelAndView mav = new ModelAndView(new RedirectView("/ingredient"));
            return mav;
        }
        ModelAndView retry = new ModelAndView(new RedirectView("/ingredient/" + ingredient.getNo() + "/form"));
        retry.addObject("msg", "1");
        return retry;
    }

    @DeleteMapping
    public ModelAndView removeIngredient(Ingredient ingredient) {
        ingredientServiceImple.removeIngredient(ingredient);
        return new ModelAndView(new RedirectView("/ingredient"));
    }
}
