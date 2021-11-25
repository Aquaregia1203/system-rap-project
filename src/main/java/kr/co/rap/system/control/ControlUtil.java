package kr.co.rap.system.control;

import kr.co.rap.system.manufacture.InputInfo;
import kr.co.rap.system.recipe.Mix;
import okhttp3.*;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class ControlUtil {
    private final static String url = "http://localhost/manufacture-execute-info";

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
                System.out.println(responseBody.toString());
                // TODO:: 반환처리
                return true;
            }
        }

        return false;
    }
}
