package kr.co.rap.system.access;

import kr.co.rap.system.model.Manager;

public interface AccessService {
    public boolean login(Manager manager);
    public void logout();
}
