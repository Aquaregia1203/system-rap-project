package kr.co.rap.system.manufacture;

import kr.co.rap.system.recipe.Recipe;
import kr.co.rap.system.recipe.RecipeService;
import kr.co.rap.system.recipe.RecipeServiceImple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manufacture-plan")
public class ManufactureController {
    @Autowired
    private ManufactureServiceImple manufactureService;
    @Autowired
    private RecipeServiceImple recipeService;
    @Autowired
    private ServletContext servletContext;

    @GetMapping
    public ModelAndView viewManufactureList(Map<String, String> period,
                                               @RequestParam(defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("manufacture/list");

        List<Manufacture> manufactureList =
                    manufactureService.viewManufactureList(period);

        mav.addObject("manufactureList", manufactureList);
        mav.addObject("start", page * 10 - 10);
        mav.addObject("end", page * 10 - 1);

        return mav;
    }

    @GetMapping("/{no}")
    public ModelAndView viewManufacture(@PathVariable int no) {
        ModelAndView mav = new ModelAndView("manufacture/view");

        Manufacture manufacture = new Manufacture();
        manufacture.setNo(no);
        manufacture = manufactureService.viewManufacture(manufacture);

        mav.addObject("manufacture", manufacture);

        return mav;
    }

    @GetMapping("/form")
    public ModelAndView addManufacture() {
        ModelAndView mav = new ModelAndView("manufacture/add");

        List<Recipe> recipeList = recipeService.viewRecipeList(new Recipe());
        mav.addObject("recipeList", recipeList);

        return mav;
    }

    @PostMapping
    public ModelAndView addManufacture(Manufacture manufacture,
                                        HttpSession session) {
        manufacture.setId((String) session.getAttribute("id"));
        manufactureService.addManufacture(manufacture);

        return new ModelAndView(new RedirectView("/manufacture-plan" + manufacture.getNo()));
    }

    @GetMapping("/{no}/form")
    public ModelAndView editManufacture(Manufacture manufacture) {
        ModelAndView mav = new ModelAndView("manufacture/edit");

        manufacture = manufactureService.viewManufacture(manufacture);
        if ("Y".equals(manufacture.getStatus())) {
            return new ModelAndView(new RedirectView("/manufacture-plan"));
        }

        List<Recipe> recipeList = recipeService.viewRecipeList(new Recipe());
        mav.addObject("recipeList", recipeList);
        mav.addObject("manufacture", manufacture);

        return mav;
    }

    @PutMapping
    public ModelAndView editManufacture(Manufacture manufacture,
                                            HttpSession session) {
        if (manufacture.getRecipeNo() == 0) {
            //TODO:: JavaScript로 로직 수정한 뒤 삭제할 것
            new ModelAndView(new RedirectView("/manufacture-plan/" + manufacture.getNo()));
        }

        manufacture.setId((String) session.getAttribute("id"));
        manufactureService.editManufacture(manufacture);

        return new ModelAndView(new RedirectView("/manufacture-plan/" + manufacture.getNo()));
    }

    @DeleteMapping
    public ModelAndView removeManufacture(Manufacture manufacture) {
        manufactureService.removeManufacture(manufacture);

        return new ModelAndView(new RedirectView("/manufacture-plan/"));
    }

    @GetMapping("/execution")
    public ModelAndView executeManufacture(Manufacture manufacture) {
        String status = servletContext.getAttribute("status") != null
                             ? (String) servletContext.getAttribute("status")
                             : "OFF";

        if ("ON".equals(status)) {
            manufactureService.executeManufacture(manufacture);

            return new ModelAndView(new RedirectView("/manufacture-plan"));
        }

        return new ModelAndView(new RedirectView("/manufacture-plan"));
    }
}
