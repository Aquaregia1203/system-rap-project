<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>생산계획 등록</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>


<jsp:include page="../top.jsp" />
    <form action="/manufacture-plan" method="post" id="formId">
    <table>
        <tr><td>
            <input type="button" id="testButton" value="테스트" />
        </td></tr>
        <tr>
            <td>레시피 : </td>
            <td>
                <select name="recipeNo" id="selectBox">
                    <option value="0">선택..</option>
                    <c:forEach items="${recipeList}" var="recipe">
                        <option value="${recipe.no}">${recipe.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th colspan="2">
               <div style="color: crimson; font-size:8px" id="recipeError">
               </div>
            </th>
        </tr>
        <tr>
            <td>생산량 : </td>
            <td>
                <input type="number" name="output" id="inputBox"/> kg
            </td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="color: crimson; font-size:8px" id="outputError">
                </div>
            </th>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <input type="button" id="submitButton" value="등록" />
            </td>
            <td>
                <a href="/manufacture-plan">목록</a>
            </td>
        </tr>
    </table>
    </form>

<script type="text/javascript">
    document.getElementById("submitButton").addEventListener("click", click, false);


    function click() {
        var selectValue = $("#selectBox option:selected").val();
        var inputValue = Number($("#inputBox").val());
        var execution;

        if (selectValue == 0) {
            $("#recipeError").text("* 레시피를 선택해 주세요.");

            execution = false;
        } else {
            $("#recipeError").text("");
            execution = true;
        }

        if (inputValue == "") {
            $("#outputError").text("* 생산량을 입력해 주세요.");

            execution = false;
        } else if (inputValue < 0
                       || inputValue > 120) {

            $("#outputError").text("* 0 ~ 120 사이에 값을 입력해 주세요");

            execution = false;
        } else {
            $("#outputError").text("");
            execution = true;
        }

        if (execution) {
            $ ("#formId").submit();
        }
    }
</script>
</body>
</html>
