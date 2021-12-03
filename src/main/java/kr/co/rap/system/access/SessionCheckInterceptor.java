package kr.co.rap.system.access;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionCheckInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession httpSession = request.getSession(false);

        if (httpSession != null) {
            Object division = httpSession.getAttribute("division");
            if (division != null) {
                return true;
            }
        }

        response.sendRedirect("/login");

        return false;
    }
}
