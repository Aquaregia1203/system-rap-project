package kr.co.rap.system.manager;

import java.util.List;
import java.util.Map;

public interface ManagerService {
    public List<Manager> viewManagerList(Map<String, String> manager);
    public Manager viewManager(Manager manager);
    public boolean addManager(Manager manager);
    public boolean editManager(Manager manager);
}
