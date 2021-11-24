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
        String id = manager.getId();
        String pw = manager.getPassword();
        if (id == null
                || pw == null) {
            return false;
        }
        Manager checkManager = managerMapper.select(manager);
        char status = checkManager.getStatus();
        String password = checkManager.getPassword();

        if (password.equals(pw)
                && 'Y' == (status)) {
            manager.setName(checkManager.getName());
            manager.setDivision(checkManager.getDivision());
            return true;
        }
        return false;
    }

    public void logout() {

    }
}
