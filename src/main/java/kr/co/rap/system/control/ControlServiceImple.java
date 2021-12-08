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
public class ControlServiceImple implements ControlService{
    private static Logger logger
            = LogManager.getLogger(ControlServiceImple.class);
    @Autowired
    private ControlMapper controlUtil;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private ManufactureMapper manufactureMapper;

    public Map<String, String> receiveProductInfo(Map<String, Integer> productInfo) {
        if (productInfo.get("code") != 200) {
            servletContext.setAttribute("status", "OFF");
            servletContext.removeAttribute("manufactureNo");
            servletContext.removeAttribute("output");

            Map<String, String> responseInfo = new HashMap<String, String>();
            responseInfo.put("code", "200");

            return responseInfo;
        }

        int manufactureNo = servletContext.getAttribute("manufactureNo") != null
                            ? (int) servletContext.getAttribute("manufactureNo")
                            : 0;
        double output = servletContext.getAttribute("output") != null
                            ? (double) servletContext.getAttribute("output")
                            : 0;
        int errorAmount = (int) (productInfo.get("productWeight") - (output * 1000.0));

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

        Map<String, String> responseInfo = new HashMap<String, String>();

        if (result != 1) {
            responseInfo.put("code", "300");
            responseInfo.put("message", "송신 후 서비스 처리에 실패했습니다.");
        } else {
            responseInfo.put("code", "200");
            responseInfo.put("message", "생산이 정상적으로 반영되었습니다.");
        }

        servletContext.setAttribute("status", "OFF");
        servletContext.removeAttribute("manufactureNo");
        servletContext.removeAttribute("output");

        return responseInfo;
    }

    public boolean sendInputInfo(InputInfo inputInfo, Manufacture manufacture) {
        int sendCount = 0;

        try {
            while (sendCount < 5) {
                if (controlUtil.sendInputInfo(inputInfo)) {
                    servletContext.setAttribute("status", "ON");
                    servletContext.setAttribute("manufactureNo", manufacture.getNo());
                    servletContext.setAttribute("output", manufacture.getOutput());

                    return true;
                }

                Thread.sleep(1000);

                sendCount++;
            }
        } catch (Exception e) {
            e.printStackTrace();

            return false;
        }

        return false;
    }
}
