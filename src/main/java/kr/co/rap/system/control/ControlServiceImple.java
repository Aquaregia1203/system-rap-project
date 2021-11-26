package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.Manufacture;
import kr.co.rap.system.manufacture.InputInfo;
import kr.co.rap.system.manufacture.ManufactureMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
public class ControlServiceImple {
    private static Logger logger
            = LogManager.getLogger(ControlServiceImple.class);
    @Autowired
    private ControlUtil controlUtil;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private ManufactureMapper manufactureMapper;

    public Map<String, String> receiveProductInfo(Map<String, Integer> productInfo) {
        int manufactureNo = servletContext.getAttribute("manufactureNo") != null
                            ? (int) servletContext.getAttribute("manufactureNo")
                            : 0;
        int output = servletContext.getAttribute("output") != null
                            ? (int) servletContext.getAttribute("output")
                            : 0;
        int errorAmount = (output * 1000) - productInfo.get("productWeight");

        String currentTime = LocalDateTime.now()
                                          .format(
                                           DateTimeFormatter
                                          .ofPattern("yyyy-MM-dd HH:mm:ss"));

        Manufacture manufacture = new Manufacture();
        manufacture.setNo(manufactureNo);
        manufacture.setErrorAmount(errorAmount);
        manufacture.setManufactureDate(currentTime);
        manufacture.setStatus("Y");

        int result = manufactureMapper.update(manufacture);

        servletContext.setAttribute("status", "OFF");
        servletContext.removeAttribute("manufactureNo");
        servletContext.removeAttribute("output");

        Map<String, String> responseInfo = new HashMap<String, String>();

        if (result != 1) {
            responseInfo.put("code", "300");
            responseInfo.put("message", "생산계획 수정을 실패하였습니다. 수치가 부적합할 수 있습니다.");

            return responseInfo;
        } else {
            responseInfo.put("code", "200");
            responseInfo.put("message", "생산이 정상적으로 반영되었습니다.");

            return responseInfo;
        }
    }

    public boolean sendInputInfo(InputInfo inputInfo,
                                       Manufacture manufacture) {
        try {
            if (controlUtil.sendInputInfo(inputInfo)) {
                servletContext.setAttribute("status", "ON");
                servletContext.setAttribute("manufactureNo", manufacture.getNo());
                servletContext.setAttribute("output", manufacture.getOutput());
                
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();

            return false;
        }

        return true;
    }
}
