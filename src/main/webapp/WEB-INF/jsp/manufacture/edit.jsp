<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../head.jsp" />
</head>

<body class="center-menu" data-layout="horizontal">
<div id="wrapper">
    <jsp:include page="../top.jsp" />
    <div class="content-page">

    <form action="/manufacture-plan" method="post" id="formId">
        <input type="hidden" name="_method" value="PUT" />
        <input type="hidden" name="no" value="${manufacture.no}" />
        <table>
            <tr>
                <td>레시피 : </td>
                <td>
                    <select name="recipeNo" id="selectBox">
                        <option value="0">선택..</option>
                        <c:forEach items="${recipeList}" var="recipe">

                            <c:choose>
                                <c:when test="${manufacture.recipeNo eq recipe.no}">
                                    <option value="${recipe.no}" selected>${recipe.name}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${recipe.no}">${recipe.name}</option>
                                </c:otherwise>
                            </c:choose>
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
                    <input type="number" name="output" value="${manufacture.output}" id="inputBox"/> kg
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
                    <input type="button" id="submitButton" value="수정" />
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
    </div>
</div>
</body>
</html>
