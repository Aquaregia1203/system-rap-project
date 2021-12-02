package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.InputInfo;
import okhttp3.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class ControlMapper {
    private static Logger logger
            = LogManager.getLogger(ControlMapper.class);
    @Value("${agent.url}")
    private String url;

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
        Response response = null;

        try {
            RequestBody requestBody = RequestBody.create(
                    MediaType.parse("application/json; charset=UTF-8"), body.toString());

            Request.Builder builder = new Request.Builder()
                                                 .url(url)
                                                 .post(requestBody);
            Request request = builder.build();
            response = okHttpClient.newCall(request).execute();

            if (response.isSuccessful()) {
                ResponseBody responseBody = response.body();

                if (responseBody != null) {
                    String result = responseBody.string();

                    System.out.println(result);
                    responseBody.close();

                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (response != null) {
                    response.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return false;
    }
}
