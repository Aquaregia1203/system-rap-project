package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.ManufactureInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.Map;

@Mapper
public interface ControlMapper {
    public boolean sendManufactureInfo(ManufactureInfo manufactureInfo);

    public boolean sendProductInfo(Map<String, String> responseInfo);
}
