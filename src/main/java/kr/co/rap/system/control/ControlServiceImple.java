package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.Manufacture;
import kr.co.rap.system.manufacture.InputInfo;
import kr.co.rap.system.manufacture.ManufactureMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.ServletContext;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

@Service
public class ControlServiceImple {
    @Autowired
    private ControlUtil controlUtil;
    @Autowired
    private ServletContext servletContext;
    @Autowired
    private ManufactureMapper manufactureMapper;

    public Map<String, String> receiveProductInfo(Map<String, Integer> productInfo) {
        int manufactureNo = (int) servletContext.getAttribute("manufactureNo");
        int output = (int) servletContext.getAttribute("output");
        int errorAmount = (output * 1000) - productInfo.get("productWeight");

        String currentTime = LocalDateTime.now()
                                          .format(
                                           DateTimeFormatter
                                          .ofPattern("yyyy-MM-dd HH:mm:ss"));

        Manufacture manufacture = new Manufacture();
        manufacture.setNo(manufactureNo);
        manufacture.setErrorAmount(errorAmount);
        manufacture.setManufactureDate(currentTime);

        manufactureMapper.update(manufacture);

        servletContext.setAttribute("status", "OFF");
        servletContext.removeAttribute("manufactureNo");
        servletContext.removeAttribute("output");

        return new HashMap<String, String>();
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
            String msg = e.getMessage();

            return false;
        }

        return false;
    }
}
