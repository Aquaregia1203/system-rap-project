package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.InputInfo;
import okhttp3.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
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
        ObjectMapper objectMapper = new ObjectMapper();

        String body = objectMapper.writeValueAsString(inputInfo);

        OkHttpClient okHttpClient = new OkHttpClient();
        Response response = null;
        ResponseBody responseBody = null;

        try {
            RequestBody requestBody = RequestBody.create(
                                                 MediaType
                                                .parse("application/json; charset=UTF-8"),
                                                        body);

            Request.Builder builder = new Request.Builder()
                                                 .url(url)
                                                 .post(requestBody);
            Request request = builder.build();


            response = okHttpClient.newCall(request).execute();

            if (response.isSuccessful()) {
                responseBody = response.body();

                if (responseBody != null) {
                    String result = responseBody.string();
                    Map<String, String> responseInfo = objectMapper.readValue(result, Map.class);

                    responseBody.close();

                    if ("200".equals(responseInfo.get("code"))) {
                        return true;
                    }

                    logger.info("response code --->" + responseInfo.get("code"));

                    return false;
                }
            }
        } catch (Exception e) {
            throw new Exception("Fail send InputInfo. -->" + e.getMessage());
        } finally {
            try {
                if (responseBody != null) {
                    responseBody.close();
                }

                if (response != null) {
                    response.close();
                }
            } catch (Exception e) {
                throw new Exception("Fail close for responseBody, response -->" + e.getMessage());
            }
        }

        return false;
    }
}
