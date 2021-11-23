package kr.co.rap.system.manufacture;

import kr.co.rap.system.model.Manufacture;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ManufactureMapper {
    public List<Manufacture> selectAll(Map<String, String> period);

    public Manufacture select(Manufacture manufacture);

    public int insert(Manufacture manufacture);

    public int update(Manufacture manufacture);

    public int delete(Manufacture manufacture);
}
