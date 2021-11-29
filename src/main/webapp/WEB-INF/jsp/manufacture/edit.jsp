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
        <div class="content">
            <!-- Start Content-->
            <div class="container-fluid">
                <!-- start page title -->
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">

                            <h4 class="page-title">생산계획 등록</h4>
                        </div>
                    </div>
                </div>
                <form action="/manufacture-plan" method="post" id="formId">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box">
                                <h4 class="header-title"></h4>

                                <p class="sub-header">
                                    생산계획을 수정합니다. <br/>* 생산량은 0 ~ 120 사이의 숫자만 입력 가능합니다.
                                </p>

                                <div class="row">
                                    <div class="col-lg-10">
                                        <form class="form-horizontal">
                                            <div class="form-group row">
                                                <label class="col-sm-2 control-label">레시피</label>
                                                <div class="col-sm-4">
                                                    <select class="form-control">
                                                        <option>1</option>
                                                        <option>2</option>
                                                        <option>3</option>
                                                        <option>4</option>
                                                        <option>5</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </form>
                                    </div>

                                    <div class="col-lg-10">
                                        <form class="form-horizontal">
                                            <div class="form-group row">
                                                <label class="col-md-2 control-label">생산량</label>
                                                <div class="col-md-2">
                                                    <input type="number" class="form-control" value="0">
                                                </div>
                                                <div class="col-md-2">
                                                    Kg
                                                </div>
                                            </div>
                                    </div>
                                    <div class="col-sm-10 col-md-10">
                                        <button type="submit" class="btn btn-purple waves-effect waves-light">등록</button>
                                        <button type="submit" class="btn btn-purple waves-effect waves-light">목록</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

 <!-- 데이터 옮겨 붙일 것  -->


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
