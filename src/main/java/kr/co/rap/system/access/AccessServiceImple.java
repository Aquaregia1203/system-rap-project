package kr.co.rap.system.access;

import kr.co.rap.system.manager.ManagerMapper;
import kr.co.rap.system.model.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Service
public class AccessServiceImple{
    @Autowired
    private ManagerMapper managerMapper;

    public boolean login(Manager manager) {
        String id = managerMapper.select(manager).getId();
        String password = managerMapper.select(manager).getPassword();
        char status = managerMapper.select(manager).getStatus();

        if(id.isEmpty()
                || password.isEmpty()) {
            return false;
        }

        if ('Y' != status) {
            return false;
        }
        return true;
    }

    public void logout() {

    }
}
