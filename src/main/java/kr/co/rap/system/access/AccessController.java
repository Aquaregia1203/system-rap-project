package kr.co.rap.system.access;

import kr.co.rap.system.model.Manager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpSession;

@Controller
public class AccessController {
    @GetMapping("/login")
    public ModelAndView login(HttpSession httpSession) {
        return new ModelAndView("access/login");
    }

    @PostMapping("/login")
    public ModelAndView login(Manager manager, HttpSession httpSession) {
        if ('S' == manager.getDivision()) {
            ModelAndView toManager = new ModelAndView(new RedirectView("/manager"));
            httpSession.setAttribute("id", manager.getId());
            httpSession.setAttribute("name", manager.getName());
            return toManager;
        }
        ModelAndView toManufacture = new ModelAndView(new RedirectView("/manufacture"));
        httpSession.setAttribute("id", manager.getId());
        httpSession.setAttribute("name", manager.getName());
        return toManufacture;
    }

    @GetMapping("logout")
    public ModelAndView logout(HttpSession httpSession) {
        httpSession.removeAttribute("id");
        ModelAndView mov = new ModelAndView(new RedirectView("/login"));
        return mov;
    }

}
