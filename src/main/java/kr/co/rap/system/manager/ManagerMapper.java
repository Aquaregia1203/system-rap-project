package kr.co.rap.system.manager;

import kr.co.rap.system.access.Manager;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ManagerMapper {
    public List<Manager> selectAll(Manager manager);
    public Manager select(Manager manager);
    public int insert(Manager manager);
    public int update(Manager manager);
}
