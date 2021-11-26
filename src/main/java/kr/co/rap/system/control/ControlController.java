package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.InputInfo;
import kr.co.rap.system.recipe.RecipeController;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class ControlController {
    private static Logger logger
            = LogManager.getLogger(ControlController.class);
    @Autowired
    private ControlServiceImple controlService;

    @PostMapping("/product")
    public Map<String, String> reciveProductWeight(
                                    Map<String, Integer> productInfo) {
        logger.debug("짜잔 연결");
        
        Map<String, String> responseInfo = new HashMap<>();
//                controlService.receiveProductInfo(productInfo);
        responseInfo.put("code", "200");
        responseInfo.put("message", "에러가 없습니다.");
        
        return responseInfo;
    }
}
