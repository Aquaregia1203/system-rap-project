package kr.co.rap.system.manufacture;

import kr.co.rap.system.control.ControlService;
import kr.co.rap.system.page.PageUtil;
import kr.co.rap.system.recipe.Recipe;
import kr.co.rap.system.recipe.RecipeServiceImple;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/manufacture-plan")
public class ManufactureController {
    @Autowired
    private ManufactureService manufactureService;
    @Autowired
    private RecipeServiceImple recipeService;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private PageUtil pageUtil;
    @Autowired
    private ControlService controlService;

    @GetMapping
    public ModelAndView viewManufactureList() {
        return new ModelAndView("manufacture/list");
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> search(@RequestParam(required = false) Map<String, String> period) {
        String tag = pageUtil.getNavigator(period);

        List<Manufacture> manufactureList = manufactureService.viewManufactureList(period);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("tag", tag);
        result.put("manufactureList", manufactureList);

        return result;
    }


    @GetMapping("/{no}")
    public ModelAndView viewManufacture(Manufacture manufacture) {
        ModelAndView mav = new ModelAndView("manufacture/view");

        manufacture = manufactureService.viewManufacture(manufacture);
        mav.addObject("manufacture", manufacture);

        return mav;
    }

    @GetMapping("/form")
    public ModelAndView addManufacture() {
        ModelAndView mav = new ModelAndView("manufacture/add");

        List<Recipe> recipeList = recipeService.viewRecipeList(new HashMap<String, String>());
        mav.addObject("recipeList", recipeList);

        return mav;
    }

    @PostMapping
    public ModelAndView addManufacture(Manufacture manufacture,
                                        HttpSession session) {
        if (manufacture.getRecipeNo() == 0
                && manufacture.getOutput() == 0)  {
            return new ModelAndView(new RedirectView("/manufacture-plan/form"));
        }

        manufacture.setId((String) session.getAttribute("id"));
        manufactureService.addManufacture(manufacture);

        return new ModelAndView(new RedirectView("/manufacture-plan/" + manufacture.getNo()));
    }

    @GetMapping("/{no}/form")
    public ModelAndView editManufacture(@PathVariable int no) {
        ModelAndView mav = new ModelAndView("manufacture/edit");

        Manufacture manufacture = new Manufacture();
        manufacture.setNo(no);
        manufacture = manufactureService.viewManufacture(manufacture);

        if ("Y".equals(manufacture.getStatus())) {
            return new ModelAndView(new RedirectView("/manufacture-plan"));
        }

        List<Recipe> recipeList = recipeService.viewRecipeList(new HashMap<String, String>());
        mav.addObject("recipeList", recipeList);
        mav.addObject("manufacture", manufacture);

        return mav;
    }

    @PutMapping
    public ModelAndView editManufacture(Manufacture manufacture,
                                            HttpSession session) {
        if (manufacture.getRecipeNo() == 0
                && manufacture.getOutput() == 0) {
            return new ModelAndView(new RedirectView("/manufacture-plan/" + manufacture.getNo()));
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
        ModelAndView mav = new ModelAndView(new RedirectView("/manufacture-plan"));

        String status = servletContext.getAttribute("status") != null
                             ? (String) servletContext.getAttribute("status")
                             : "OFF";

        if ("OFF".equals(status)
                && "N".equals(manufacture.getStatus())) {
            InputInfo inputInfo = manufactureService.executeManufacture(manufacture);

            controlService.sendInputInfo(inputInfo, manufacture);

            return mav;
        }

        mav.addObject("error","fail");

        return mav;
    }
}
