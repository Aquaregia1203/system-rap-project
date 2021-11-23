package kr.co.rap.system.ingredient;

import kr.co.rap.system.model.Ingredient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/ingredient")
public class IngredientController {
    @GetMapping
    public ModelAndView viewIngredientList(Ingredient ingredient, String page) {
        return null;
    }

    @GetMapping("/{no}")
    public ModelAndView viewIngredient(String no) {
        return null;
    }

    @GetMapping("/form")
    public ModelAndView addIngredient() {
        return null;
    }

    @PostMapping
    public ModelAndView addIngredient(Ingredient ingredient) {
        return null;
    }

    @GetMapping("/{no}/form")
    public ModelAndView editIngredient(String no) {
        return null;
    }

    @PutMapping
    public ModelAndView editIngredient(Ingredient ingredient) {
        return null;
    }

    @DeleteMapping
    public ModelAndView removeIngredient(String no) {
        return null;
    }
}
