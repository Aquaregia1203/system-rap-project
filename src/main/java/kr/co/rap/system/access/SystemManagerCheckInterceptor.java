package kr.co.rap.system.access;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SystemManagerCheckInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession httpSession = request.getSession();
        String division = (String) httpSession.getAttribute("division");

        if ("S".equals(division)) {
            return true;
        }

        response.sendRedirect("/manufactre-plan");

        return false;
    }
}
