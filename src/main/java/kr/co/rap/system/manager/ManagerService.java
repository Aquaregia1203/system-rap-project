package kr.co.rap.system.manager;

import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface ManagerService {
    public List<Manager> viewManagerList(Map<String, String> manager);
    public Manager viewManager(Manager manager);
    public boolean addManager(Manager manager);
    public boolean editManager(Manager manager);
}
