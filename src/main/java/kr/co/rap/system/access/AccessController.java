package kr.co.rap.system.access;

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
            if ('S' == manager.getDivision()) {
                ModelAndView toManager = new ModelAndView(new RedirectView("/manager"));
                httpSession.setAttribute("id", manager.getId());
                httpSession.setAttribute("name", manager.getName());
                return toManager;
            } else {
                ModelAndView toManufacture = new ModelAndView(new RedirectView("/manufacture"));
                httpSession.setAttribute("id", manager.getId());
                httpSession.setAttribute("name", manager.getName());
                return toManufacture;
            }
        }
        return new ModelAndView(new RedirectView("/login"));
    }

    @GetMapping("logout")
    public ModelAndView logout(HttpSession httpSession) {
        httpSession.removeAttribute("id");
        ModelAndView mov = new ModelAndView(new RedirectView("/login"));
        return mov;
    }

}
