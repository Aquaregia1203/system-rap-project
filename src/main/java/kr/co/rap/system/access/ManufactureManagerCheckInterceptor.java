package kr.co.rap.system.access;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ManufactureManagerCheckInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession httpSession = request.getSession();
        String division = httpSession.getAttribute("division") + "";
        if ("M".equals(division)) {
            return true;
        }
        response.sendRedirect("/manager");
        return false;
    }
}
