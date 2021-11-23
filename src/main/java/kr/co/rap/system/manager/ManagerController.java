package kr.co.rap.system.manager;

import kr.co.rap.system.model.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import java.util.List;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @Autowired
    private ManagerServiceImple managerServiceImple;

    @GetMapping
    public ModelAndView viewManagerList(@RequestParam String name,
                                        @RequestParam(defaultValue = "1") int page) {
        ModelAndView mav = new ModelAndView("manager/list");

        Manager manager = new Manager();
        manager.setName(name);
        List<Manager> managerList = managerServiceImple.viewManagerList(manager);

        mav.addObject("managerRows",managerList);
        mav.addObject("start", page * 10 - 10);
        mav.addObject("end", page * 10 - 1);

        return mav;
    }

    @GetMapping("/{id}")
    public ModelAndView viewManager(@PathVariable String id) {
        ModelAndView mav = new ModelAndView("manager/view");

        Manager manager = new Manager();
        manager.setId(id);

        manager = managerServiceImple.viewManager(manager);

        mav.addObject("manager", manager);
        return mav;
    }

    @GetMapping("/form")
    public ModelAndView addManager() {
        return new ModelAndView("manager/add");
    }

    @PostMapping
    public ModelAndView addManager(Manager manager) {
        managerServiceImple.addManager(manager);
        return new ModelAndView(new RedirectView("/manager/" + manager.getId()));
    }

    @GetMapping("/{id}/form")
    public ModelAndView editManager(@PathVariable String id) {
        Manager manager = new Manager();
        manager.setId(id);
        manager = managerServiceImple.viewManager(manager);

        ModelAndView mav = new ModelAndView("manager/edit");
        mav.addObject("manager", manager);

        return mav;
    }

    @PutMapping
    public ModelAndView editManaer(Manager manager) {
        managerServiceImple.editManager(manager);
        return new ModelAndView(new RedirectView("/manager/" + manager.getId()));
    }
}
