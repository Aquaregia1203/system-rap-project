package kr.co.rap.system.control;

import kr.co.rap.system.model.Manufacture;
import kr.co.rap.system.model.ManufactureInfo;
import org.springframework.stereotype.Controller;

import java.util.Map;

@Controller
public interface ControlService {
    public Map<String, String> receiveProductInfo(Map<String, String> responseInfo);

    public boolean sendManufactureInfo(ManufactureInfo manufactureInfo, Manufacture manufacture);
}
