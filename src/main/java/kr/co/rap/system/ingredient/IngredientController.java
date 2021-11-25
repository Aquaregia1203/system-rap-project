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
    public ModelAndView viewIngredientList(Ingredient ingredient,
                                           @RequestParam(defaultValue = "1") int page) {

        ModelAndView mav = new ModelAndView("ingredient/list");
        List<Ingredient> ingredientList = ingredientServiceImple.viewIngredientList(ingredient);
        mav.addObject("ingredientList", ingredientList);
        mav.addObject("start", page * 10 -10);
        mav.addObject("end", page * 10 - 1);

        return mav;
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public List<Ingredient> search(Ingredient ingredient) {
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
        ingredientServiceImple.addIngredient(ingredient);
        return new ModelAndView(new RedirectView("/ingredient"));
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
        ingredientServiceImple.editIngredient(ingredient);
        return new ModelAndView(new RedirectView("/ingredient/" + ingredient.getNo()));
    }

    @DeleteMapping
    public ModelAndView removeIngredient(Ingredient ingredient) {
        ingredientServiceImple.removeIngredient(ingredient);
        return new ModelAndView(new RedirectView("/ingredient"));
    }
}
