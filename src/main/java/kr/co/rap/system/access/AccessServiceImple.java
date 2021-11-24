package kr.co.rap.system.access;

import kr.co.rap.system.manager.ManagerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccessServiceImple{
    @Autowired
    private ManagerMapper managerMapper;

    public boolean login(Manager manager) {
        manager = managerMapper.select(manager);
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
