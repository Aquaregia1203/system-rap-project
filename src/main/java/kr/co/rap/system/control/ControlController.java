package kr.co.rap.system.control;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.Map;

@RestController
public class ControlController {
    private static Logger logger
            = LogManager.getLogger(ControlController.class);
    @Autowired
    private ControlService controlService;

    @PostMapping("/product")
    public Map<String, String> reciveProductWeight(
                            @RequestBody Map<String, Integer> productInfo) {
        return controlService.receiveProductInfo(productInfo);
    }
}
