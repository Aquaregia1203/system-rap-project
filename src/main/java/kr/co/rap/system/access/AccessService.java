package kr.co.rap.system.access;

import kr.co.rap.system.manager.Manager;
import org.springframework.stereotype.Service;

@Service
public interface AccessService {
    public boolean login(Manager manager);
    public void logout();
}
