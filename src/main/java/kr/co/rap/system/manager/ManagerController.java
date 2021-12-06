package kr.co.rap.system.manager;

import kr.co.rap.system.page.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    private ManagerService managerService;
    @Autowired
    private PageUtil pageUtil;

    @GetMapping
    public ModelAndView viewManagerList() {
        return new ModelAndView("manager/list");
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public Map<String, Object> viewManagerList(@RequestParam Map<String, String> manager) {
        Map<String, Object> result = new HashMap<String, Object>();

        String tag = pageUtil.getNavigator(manager.get("url"), Integer.parseInt(manager.get("page")), manager);

        int limitNo = Integer.parseInt(manager.get("page"));
        manager.put("page", (limitNo * 10 - 10) + "");
        List<Manager> managerList = managerService.viewManagerList(manager);

        result.put("managerList", managerList);
        result.put("tag", tag);

        return result;
    }

    @GetMapping("/{id}")
    public ModelAndView viewManager(Manager manager) {
        ModelAndView mav = new ModelAndView("manager/view");

        manager = managerService.viewManager(manager);
        mav.addObject("manager", manager);

        return mav;
    }

    @GetMapping("/form")
    public ModelAndView addManager() {
        return new ModelAndView("manager/add");
    }

    @PostMapping
    public ModelAndView addManager(Manager manager, Errors errors) {
        new RegisterRequestValidator().validate(manager, errors);

        if (errors.hasErrors()) {
            ModelAndView mav = new ModelAndView("/manager/add");

            List<FieldError> errorsList = errors.getFieldErrors();

            for (FieldError error : errorsList) {
                mav.addObject("error" + error.getField(), error.getCode());

            }

            return mav;
        }

        if (managerService.addManager(manager)) {
            return new ModelAndView(new RedirectView("/manager/" + manager.getId()));
        }

        ModelAndView retry = new ModelAndView("manager/add");
        return retry;
    }

    @GetMapping("/{id}/form")
    public ModelAndView editManager(@PathVariable String id) {
        Manager manager = new Manager();
        manager.setId(id);
        manager = managerService.viewManager(manager);

        ModelAndView mav = new ModelAndView("manager/edit");
        mav.addObject("manager", manager);

        return mav;
    }

    @PutMapping
    public ModelAndView editManager(Manager manager) {

        managerService.editManager(manager);

        return new ModelAndView(new RedirectView("/manager/" + manager.getId()));
    }
}
