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
@RequestMapping("/admin")
public class ManagerController {
    @Autowired
    private ManagerServiceImple managerServiceImple;

    @GetMapping
    public ModelAndView viewManagerList() {
        return new ModelAndView("manager/list");
    }

    @GetMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
    public List<Manager> viewManagerList(Manager manager) {
        List<Manager> managerList = managerServiceImple.viewManagerList(manager);
        return managerList;
    }

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
    public ModelAndView addManager(Manager manager, @RequestParam Map<String, String> contact) {
        String number = contact.get("top") + "-" + contact.get("middle") + "-" + contact.get("bottom");
        manager.setContact(number);
        boolean result = managerServiceImple.addManager(manager);
        if (result) {
            ModelAndView mav = new ModelAndView(new RedirectView("/admin/" + manager.getId()));
            return mav;
        }
        ModelAndView retry = new ModelAndView("mamger/add");
        retry.addObject("message", "정보를 올바르게 입력해 주세요.");
        return new ModelAndView("manager/add");
    }

    @GetMapping("/{id}/form")
    public ModelAndView editManager(@PathVariable String id) {
        Manager manager = new Manager();
        manager.setId(id);
        manager = managerServiceImple.viewManager(manager);
        String contact = manager.getContact();
        String[] number =  contact.split("-");
        Map<String, String> contactNumber = new HashMap<String, String>();
        contactNumber.put("top", number[0]);
        contactNumber.put("middle", number[1]);
        contactNumber.put("bottom", number[2]);

        ModelAndView mav = new ModelAndView("manager/edit");
        mav.addObject("manager", manager);
        mav.addObject("contact", contactNumber);

        return mav;
    }

    @PutMapping
    public ModelAndView editManager(Manager manager, @RequestParam Map<String, String>contact) {
        String number = contact.get("top") + "-" + contact.get("middle") + "-" + contact.get("bottom");
        manager.setContact(number);
        managerServiceImple.editManager(manager);
        return new ModelAndView(new RedirectView("/admin/" + manager.getId()));
    }
}
