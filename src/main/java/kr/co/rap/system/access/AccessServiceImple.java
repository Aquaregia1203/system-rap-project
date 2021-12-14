package kr.co.rap.system.access;

import kr.co.rap.system.manager.Manager;
import kr.co.rap.system.manager.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Objects;

@Service
public class AccessServiceImple implements AccessService{
    @Autowired
    private ManagerMapper managerMapper;

    public boolean login(Manager manager) {
        String id = manager.getId() != null
                    ? manager.getId()
                    : "";
        String pw = manager.getPassword() != null
                    ? manager.getPassword()
                    : "";

        Manager checkManager = managerMapper.select(manager);

        if (Objects.isNull(checkManager)) {
            return false;
        }

        String checkId = checkManager.getId();
        String status = checkManager.getStatus();
        String password = checkManager.getPassword();

        if (pw.equals(password)
                && id.equals(checkId)
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
