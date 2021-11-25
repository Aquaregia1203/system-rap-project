package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.InputInfo;
import kr.co.rap.system.recipe.Mix;
import kr.co.rap.system.recipe.RecipeServiceImple;
import okhttp3.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class ControlUtil {
    private static Logger logger
            = LogManager.getLogger(ControlUtil.class);
    private final static String url = "http://172.16.30.232:8080/servertest/manufacture-execute-info";

    public boolean sendInputInfo(InputInfo inputInfo) throws Exception {
        List<Map<String, String>> pumpInfo = inputInfo.getPumpInfo();

        StringBuffer body = new StringBuffer();

        body.append("{")
            .append("\"pumpInfo\" : [");

        for (Map info : pumpInfo) {
            body.append("{")
                .append("\"input\" : ")
                .append(info.get("input") + ",")
                .append("\"pumpNo\" : ")
                .append(info.get("pumpNo"))
                .append("},");
        }

        body.deleteCharAt(body.length() - 1);
        body.append("]}");

        OkHttpClient okHttpClient = new OkHttpClient();

        RequestBody requestBody = RequestBody.create(
                MediaType.parse("application/json; charset=UTF-8"), body.toString());

        Request.Builder builder = new Request.Builder()
                                             .url(url)
                                             .post(requestBody);
        Request request = builder.build();
        Response response = okHttpClient.newCall(request).execute();

        if (response.isSuccessful()) {
            ResponseBody responseBody = response.body();

            if (responseBody != null) {
                System.out.println(responseBody.string());

                return true;
            }
        }

        return false;
    }
}
