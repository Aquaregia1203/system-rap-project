package kr.co.rap.system.manager;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ManagerMapper {
    public List<Manager> selectAll(Map<String, String> manager);
    public Manager select(Manager manager);
    public int insert(Manager manager);
    public int update(Manager manager);
    public int count();
    public List<Manager> paging(Map<String, String> manager);
}
