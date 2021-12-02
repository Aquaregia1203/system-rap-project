<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp" />
</head>
<body style="font-family : 'Nanum Gothic', sans-serif" data-layout="horizontal">
    <div id="wrapper">
        <jsp:include page="${pageContext.servletContext.contextPath}/include.jsp" />
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-8">
                            <div class="page-title-box">

                                <h4 class="page-title">생산계획 수정</h4>
                            </div>
                        </div>
                    </div>
                    <form action="${pageContext.servletContext.contextPath}/manufacture-plan" method="post" id="formId">
                        <input type="hidden" name="_method" value="PUT" />
                        <input type="hidden" name="no" value="${manufacture.no}" />
                        <div class="row justify-content-center">
                            <div class="col-sm-8">
                                <div class="card-box">
                                    <h4 class="header-title"></h4>
                                    <p class="sub-header">
                                        레시피를 선택해 생산계획을 수정합니다. <br/>* 생산량은 0 ~ 120 사이의 숫자만 입력 가능합니다.
                                    </p>
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group row">
                                                <label class="col-sm-2 control-label">레시피</label>
                                                <div class="col-sm-7">
                                                    <select class="form-control" name="recipeNo" id="selectBox">
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
                                                    <div style="color: crimson; font-size:8px" id="recipeError">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-12">
                                            <div class="form-group row">
                                                <label class="col-md-2 control-label">생산량</label>
                                                <div class="col-md-7">
                                                    <input type="number" class="form-control" name="output" value="${manufacture.output}" />
                                                    <div style="color: crimson; font-size:8px" id="outputError">
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                    Kg
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <button type="submit" id="submitButton" class="btn btn-primary waves-effect waves-light">수정</button>
                                    <a href="${pageContext.servletContext.contextPath}/manufacture-plan" class="btn btn-secondary waves-effect waves-light">
                                        목록</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

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
