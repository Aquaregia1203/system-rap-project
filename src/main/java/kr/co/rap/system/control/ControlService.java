package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.Manufacture;
import kr.co.rap.system.manufacture.InputInfo;
import org.springframework.stereotype.Controller;

import java.util.Map;

@Controller
public interface ControlService {
    public Map<String, String> receiveProductInfo(Map<String, String> responseInfo);

    public boolean sendManufactureInfo(InputInfo inputInfo, Manufacture manufacture);
}
