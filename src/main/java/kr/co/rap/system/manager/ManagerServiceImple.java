package kr.co.rap.system.manager;

import kr.co.rap.system.model.Manager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ManagerServiceImple{
    @Autowired
    private ManagerMapper managerMapper;

    public List<Manager> viewManagerList(Manager manager) {
        List<Manager> rows = managerMapper.selectAll(manager);
        return rows;
    }

    public Manager viewManager(Manager manager) {
        Manager row = managerMapper.select(manager);
        return row;
    }

    public boolean addManager(Manager manager) {
        if (managerMapper.select(manager) != null) {
            return false;
        }
        managerMapper.insert(manager);
        return true;
    }

    public boolean editManager(Manager manager) {
        Manager checkManager = managerMapper.select(manager);

        if('S' == checkManager.getDivision()) {
            checkManager.setStatus('Y');
            managerMapper.update(manager);
        } else {
            managerMapper.update(manager);
        }
        return true;
    }
}
