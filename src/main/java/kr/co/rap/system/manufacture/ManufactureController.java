package kr.co.rap.system.manufacture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/manufacture-plan")
public class ManufactureController {
    @Autowired
    private ManufactureServiceImple manufactureService;

    @GetMapping
    public ModelAndView viewManufactureList(Map<String, String> period,
                                               int page) {
        ModelAndView mav = new ModelAndView("manufacture/list");

        List<Manufacture> manufactureList =
                    manufactureService.viewManufactureList(period);

        mav.addObject("manufactureList", manufactureList);
        mav.addObject("start", page * 10 - 10);
        mav.addObject("end", page * 10 - 1);

        return mav;
    }

    @GetMapping("/{no}")
    public ModelAndView viewManufacture(Manufacture manufacture) {
        ModelAndView mav = new ModelAndView("manufacture/view");

        manufacture = manufactureService.viewManufacture(manufacture);
        mav.addObject("manufacture", manufacture);

        return new ModelAndView("manufacture/view");
    }

    @GetMapping("/form")
    public ModelAndView addManufacture() {
        return new ModelAndView("manufacture/add");
    }

    @PostMapping
    public ModelAndView addManufacture(Manufacture manufacture,
                                        HttpSession session) {
        manufacture.setId((String) session.getAttribute("id"));
        return new ModelAndView(new RedirectView("/manufacture-plan" + manufacture.getNo()));
    }

    @GetMapping("/{no}/form")
    public ModelAndView editManufacture(Manufacture manufacture) {
        return new ModelAndView("manufacture/edit");
    }

    @PutMapping
    public ModelAndView editManufacture(Manufacture manufacture,
                                            HttpSession session) {
        return new ModelAndView(new RedirectView("/manufacture-plan/" + manufacture.getNo()));
    }

    @DeleteMapping
    public ModelAndView removeManufacture(Manufacture manufacture) {
        return new ModelAndView(new RedirectView("/manufacture-plan/"));
    }
}
