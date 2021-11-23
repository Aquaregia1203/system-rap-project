package kr.co.rap.system.manager;

import kr.co.rap.system.model.Manager;

import java.util.List;

public interface ManagerService {
    public List<Manager> viewManagerList(Manager manager);
    public Manager viewManager(Manager manager);
    public boolean addManager(Manager manager);
    public boolean editManager(Manager manager);
}
