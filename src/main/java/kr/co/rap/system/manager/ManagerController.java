package kr.co.rap.system.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
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
    private ManagerServiceImple managerServiceImple;

    @GetMapping
    public ModelAndView viewManagerList() {
        return new ModelAndView("manager/list");
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public List<Manager> viewManagerList(@RequestParam Map<String, String> manager) {
        List<Manager> managerList = managerServiceImple.viewManagerList(manager);

        return managerList;
    }

//    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
//    public List<Manager> viewManagerList(Map<String, String> manager) {
//        String page = manager.get("page");
//        int pageNo = Integer.parseInt(page) * 10 - 10;
//        page = String.valueOf(pageNo);
//        manager.put("page", page);
//        List<Manager> managerList = managerServiceImple.pagingManager(manager);
//        return managerList;
//    }

    @GetMapping("/{id}")
    public ModelAndView viewManager(Manager manager) {
        ModelAndView mav = new ModelAndView("manager/view");

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
        if (managerServiceImple.addManager(manager)) {
            return new ModelAndView(new RedirectView("/manager/" + manager.getId()));
        }

        ModelAndView retry = new ModelAndView("manager/add");
        retry.addObject("message", "* 아이디의 중복이 존재합니다.");
        retry.addObject("manager", manager);

        return retry;
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
    public ModelAndView editManager(Manager manager) {
        managerServiceImple.editManager(manager);

        return new ModelAndView(new RedirectView("/manager/" + manager.getId()));
    }
}
