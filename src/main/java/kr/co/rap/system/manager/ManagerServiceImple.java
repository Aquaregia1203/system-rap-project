package kr.co.rap.system.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ManagerServiceImple implements ManagerService {
    @Autowired
    private ManagerMapper managerMapper;

    public List<Manager> viewManagerList(Map<String, String> manager) {
        if (manager.get("page") != null) {
            int limitNo = Integer.parseInt(manager.get("page"));
            manager.put("page", (limitNo * 10 - 10) + "");
        }

        return managerMapper.selectAll(manager);
    }

    public Manager viewManager(Manager manager) {
        Manager row = managerMapper.select(manager);

        return row;
    }

    public boolean addManager(Manager manager) {
        Manager checkDuplicate = managerMapper.select(manager);

        if (checkDuplicate != null) {
            return false;
        }

        managerMapper.insert(manager);

        return true;
    }

    public boolean editManager(Manager manager) {
        Manager checkManager = managerMapper.select(manager);

        if ("S".equals(checkManager.getDivision())) {
            checkManager.setStatus("Y");
            managerMapper.update(checkManager);
        } else {
            managerMapper.update(manager);
        }

        return true;
    }
}
