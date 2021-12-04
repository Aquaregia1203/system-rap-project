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
    private AccessService accessService;

    @GetMapping("/login")
    public ModelAndView login(HttpSession httpSession) {
        if (httpSession.getAttribute("id") != null) {
            String division = httpSession.getAttribute("division") + "";

            if ("S".equals(division)) {
                return new ModelAndView(new RedirectView("/manager"));
            } else {
                return new ModelAndView(new RedirectView("/manufacture-plan"));
            }
        }

        return new ModelAndView("access/login");
    }

    @PostMapping("/login")
    public ModelAndView login(Manager manager, HttpSession httpSession, String remember) {
        boolean result = accessService.login(manager);

        if ("check".equals(remember)) {
            httpSession.setAttribute("saveId", manager.getId());
        } else {
            httpSession.removeAttribute("saveId");
        }

        if (result) {
            if ("S".equals( manager.getDivision())) {
                ModelAndView toManager = new ModelAndView(new RedirectView("/manager"));

                httpSession.setAttribute("id", manager.getId());
                httpSession.setAttribute("name", manager.getName());
                httpSession.setAttribute("division", manager.getDivision());

                return toManager;
            } else {
                ModelAndView toManufacture = new ModelAndView(new RedirectView("/manufacture-plan"));

                httpSession.setAttribute("id", manager.getId());
                httpSession.setAttribute("name", manager.getName());
                httpSession.setAttribute("division",manager.getDivision());

                return toManufacture;
            }
        }

        ModelAndView failLogin = new ModelAndView("access/login");
        failLogin.addObject("result","로그인 정보가 일치하지 않습니다.");

        return failLogin;
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpSession httpSession) {
        httpSession.removeAttribute("id");
        httpSession.removeAttribute("name");
        httpSession.removeAttribute("division");

        return new ModelAndView(new RedirectView("/login"));
    }

}
