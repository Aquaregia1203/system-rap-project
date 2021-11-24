package kr.co.rap.system.access;

import kr.co.rap.system.manager.Manager;
import kr.co.rap.system.manager.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class AccessServiceImple{
    @Autowired
    private ManagerMapper managerMapper;

    public boolean login(Manager manager) {
        String id = manager.getId();
        String pw = manager.getPassword();

        Manager checkManager = managerMapper.select(manager);

        if(Objects.isNull(checkManager)) {
            return false;
        }

        String checkid = checkManager.getId();
        String status = checkManager.getStatus();
        String password = checkManager.getPassword();

        if (pw.equals(password)
                && id.equals(checkid)
                && "Y".equals(status)) {
            manager.setName(checkManager.getName());
            manager.setDivision(checkManager.getDivision());
            return true;
        }
        return false;
    }

    public void logout() {

    }
}
