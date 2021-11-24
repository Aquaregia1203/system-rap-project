package kr.co.rap.system.access;

import kr.co.rap.system.manager.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;

@Controller
public class AccessController {
    @Autowired
    private AccessServiceImple accessServiceImple;

    @GetMapping("/login")
    public ModelAndView login(HttpSession httpSession) {
        return new ModelAndView("access/login");
    }

    @PostMapping("/login")
    public ModelAndView login(Manager manager, HttpSession httpSession) {
        boolean result = accessServiceImple.login(manager);

        if (result) {
            if ("S".equals( manager.getDivision())) {
                ModelAndView toManager = new ModelAndView(new RedirectView("/admin"));
                httpSession.setAttribute("id", manager.getId());
                httpSession.setAttribute("name", manager.getName());
                httpSession.setAttribute("saveId", manager.getId());

                return toManager;
            } else {
                ModelAndView toManufacture = new ModelAndView(new RedirectView("/manufacture"));
                httpSession.setAttribute("id", manager.getId());
                httpSession.setAttribute("name", manager.getName());
                httpSession.setAttribute("saveId", manager.getId());

                return toManufacture;
            }
        }
        return new ModelAndView(new RedirectView("/login"));
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpSession httpSession) {
        httpSession.removeAttribute("id");
        httpSession.removeAttribute("name");

        return new ModelAndView(new RedirectView("/login"));
    }

}
