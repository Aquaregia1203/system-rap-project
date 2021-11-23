package kr.co.rap.system.manager;

import kr.co.rap.system.model.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/manager")
public class ManagerController {
    @GetMapping
    public ModelAndView viewManagerList(String name, String page) {
        return null;
    }

    @GetMapping("/{id}")
    public ModelAndView viewManager(String id) {
        return null;
    }

    @GetMapping("/form")
    public ModelAndView addManager() {
        return null;
    }

    @PostMapping
    public ModelAndView addManager(Manager manager) {
        return null;
    }

    @GetMapping("/{id}/form")
    public ModelAndView editManager(String no) {
        return null;
    }

    @PutMapping
    public ModelAndView editManaer(Manager manager) {
        return null;
    }
}
