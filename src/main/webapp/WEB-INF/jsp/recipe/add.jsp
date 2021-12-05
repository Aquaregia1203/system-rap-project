<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
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
                            <h4 class="page-title">레시피 등록</h4>
                        </div>
                    </div>
                </div>

                <form action="${pageContext.servletContext.contextPath}/recipe" method="post" id="formId">
                    <div class="row justify-content-center">
                        <div class="col-sm-8">
                            <div class="card-box">

<%--                                <div class="modal fade bs-example-modal-sm show" tabindex="-1" role="dialog" style="display: none;" aria-modal="true">--%>
<%--                                    <div class="modal-dialog modal-sm">--%>
<%--                                        <div class="modal-content">--%>
<%--                                            <div class="modal-header">--%>
<%--                                                <h5 class="modal-title mt-0">오류!</h5>--%>
<%--                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">--%>
<%--                                                    <span aria-hidden="true">×</span>--%>
<%--                                                </button>--%>
<%--                                            </div>--%>
<%--                                            <div class="modal-body">--%>
<%--                                                레시피 정보를 모두 입력해 주세요.--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <!-- /.modal-content -->--%>
<%--                                    </div>--%>
<%--                                    <!-- /.modal-dialog -->--%>
<%--                                </div>--%>

                                <h4 class="header-title"></h4>
                                <p class="sub-header">
                                    레시피를 등록합니다. <br/>* 원재료와 펌프 번호는 중복될 수 없으며, 비율은 합이 100이여야 합니다.
                                </p>
                                <div class="row" id="selectIngredient">
                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">레시피 명</label>
                                            <div class="col-md-9">
                                                <input type="text" name="name" id="recipe" class="form-control" >
                                                <div id="recipeError" style="color: crimson;font-size:12px" >
                                                    ${recipeDuplication}
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12 text-right" >
                                    <button type="button" id="addButton" class="btn btn-primary waves-effect waves-light">원재료 추가</button>
                                    <button type="button" id="removeButton" class="btn btn-primary waves-effect waves-light">원재료 삭제</button>
                                </div>
                            </div>
                            <div class="col-lg-12 text-right" >
                                <div class="col-md-6 text-left" id="ingredientMsg" style="color: crimson;font-size:16px" >
                                </div>
                                <div class="col-md-6 text-left" id="ratioMsg" style="color: crimson;font-size:16px" >
                                </div>
                                <button type="button" id="submitButton" class="btn btn-primary waves-effect waves-light" >등록</button>
<%--                                <input type="button" id="submitButton" class="btn btn-primary waves-effect waves-light" data-toggle="modal" data-target=".bs-example-modal-sm" value="등록" />--%>
                                <a href="${pageContext.servletContext.contextPath}/recipe" class="btn btn-secondary waves-effect waves-light">
                                    목록
                                </a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var removeButton = document.getElementById("removeButton");
    var selectIngredient, inputPump, inputRatio;
    var count = 2;

    $("#submitButton").click(function (){
        var result = 0;
        var ratio = 0;

        if ($("#recipe").val() == "") {
            $("#recipeError").text("* 레시피를 입력해 주세요");
            result++;
        } else {
            $("#recipeError").text("");
        }


        for (let i = 0; i < count; i++) {
            var ingredient = $("#ingredient" + i).val();
            var pump = $("#pumpNo" + i).val();

            ratio = ratio + Number($("#ratio" + i).val());

            if (ingredient == 0) {
                $("#ingredientError" + i).text("* 원재료를 선택해 주세요.")
                result++;
            } else {
                $("#ingredientError" + i).text("");
            }

            if (ratio == ""
                || (ratio > 99 && ratio < 1)) {
                $("#ratioError" + i).text("* 1 ~ 99 사이의 숫자를 입력해 주세요.")
                result++;
            } else {
                $("#ratioError" + i).text("");
            }

            if (pump == ""
                || pump < 1 || pump > 3) {
                result++;
                $("#pumpError" + i).text("* 1 ~ 3 사이의 번호를 선택해 주세요.")
            } else {
                $("#pumpError" + i).text("");
            }
        }

        if (ratio != 100) {
            $("#ratioMsg").text("* 비율의 합이 100%이여야 합니다.");
            result++;
        } else {
            $("#ratioMsg").text("");
        }

        for (let i = 0; i < count - 1; i++) {
            for (let j = i + 1; j < count; j++) {
                let ingredient = $("#ingredient" + i).val();
                let ingredientNext = $("#ingredient" + j).val();
                let pump = $("#pumpNo" + i).val();
                let pumpNext = $("#pumpNo" + j).val();

                if (ingredient == ingredientNext
                    || pump == pumpNext) {
                    $("#ingredientMsg").text("* 원재료가 중복되거나 펌프 번호가 중복됩니다.");
                    result++;
                } else {
                    $("#ingredientMsg").text("");
                }
            }
        }

        if (result === 0) {
            $("#formId").submit();
        }
    })

    $(document).ready(function () {
        for (let i = 0; i < count; i++) {
            selectIngredient = '<div class="col-lg-12" id="element1' + i + '">'
                                 + '<div class="form-group row">'
                                 + '    <label class="col-md-3 control-label">' + (i + 1) + '번 원재료</label>'
                                 + '    <div class="col-md-8">'
                                 + '        <select class="form-control" name="mixList[' + i + '].ingredientNo" id="ingredient' + i + '">'
                                 + '        <option value="0">선택..</option>'
                                 + '            <c:forEach items="${ingredientList}" var="ingredient" varStatus="index" >'
                                 + '                <option value="${ingredient.no}">${ingredient.name}</option>'
                                 + '            </c:forEach>'
                                 + '        </select>'
                                 + '        <div id="ingredientError' + i + '" style="color: crimson;font-size:12px" ></div>'
                                 + '    </div>'
                                 + '</div>'
                                + '</div>';
            inputPump = '<div class="col-lg-12" id="element2' + i + '">'
                        + '<div class="form-group row">'
                        + ' <label class="col-md-3  control-label">펌프</label>'
                        + ' <div class="col-md-8">'
                        + '     <input type="number" class="form-control" id="pumpNo' + i + '" name="mixList[' + i + '].pumpNo" value="">'
                        + '     <div id="pumpError' + i + '" style="color: crimson;font-size:12px" ></div>'
                        + ' </div>'
                        + ' <div class="col-md-1">'
                        + '     번'
                        + ' </div>'
                        + '</div>'
                        + '</div>';
            inputRatio = '<div class="col-lg-12" id="element3' + i + '">'
                        + '<div class="form-group row">'
                        + ' <label class="col-md-3 control-label">비율</label>'
                        + ' <div class="col-md-8">'
                        + '     <input type="number" class="form-control" id="ratio' + i + '" name=mixList[' + i + '].ratio value="">'
                        + '     <div id="ratioError' + i + '" style="color: crimson;font-size:12px" ></div>'
                        + ' </div>'
                        + ' <div class="col-md-1">'
                        + '     %'
                        + ' </div>'
                        + '</div>'
                        + '</div>';

            $("#selectIngredient").append(selectIngredient);
            $("#selectIngredient").append(inputPump);
            $("#selectIngredient").append(inputRatio);
        }

        if (count < 3) {
            removeButton.disabled = true;
        }
    });

    $("#addButton").click(function () {
        selectIngredient = '<div class="col-lg-12" id="element1' + count + '">'
                            + '<div class="form-group row">'
                            + '    <label class="col-md-3 control-label">' + (count + 1) + '번 원재료</label>'
                            + '    <div class="col-md-8">'
                            + '        <select class="form-control" name="mixList[' + count + '].ingredientNo" id="ingredient' + count + '">'
                            + '        <option value="0">선택..</option>'
                            + '            <c:forEach items="${ingredientList}" var="ingredient" varStatus="index" >'
                            + '                <option value="${ingredient.no}">${ingredient.name}</option>'
                            + '            </c:forEach>'
                            + '        </select>'
                            + '        <div id="ingredientError' + count + '" style="color: crimson;font-size:12px" ></div>'
                            + '    </div>'
                            + '</div>'
                            + '</div>';

        inputPump = '<div class="col-lg-12" id="element2' + count + '">'
                    + '<div class="form-group row">'
                    + ' <label class="col-md-3  control-label">펌프</label>'
                    + ' <div class="col-md-8">'
                    + '     <input type="number" class="form-control" id="pumpNo' + count + '" name="mixList[' + count + '].pumpNo" value="">'
                    + '     <div id="pumpError' + count + '" style="color: crimson;font-size:12px" ></div>'
                    + ' </div>'
                    + ' <div class="col-md-1">'
                    + '     번'
                    + ' </div>'
                    + '</div>'
                    + '</div>';

        inputRatio = '<div class="col-lg-12" id="element3' + count + '">'
                    + '<div class="form-group row">'
                    + ' <label class="col-md-3 control-label">비율</label>'
                    + ' <div class="col-md-8">'
                    + '     <input type="number" class="form-control" id="ratio' + count + '" name=mixList[' + count + '].ratio value="">'
                    + '     <div id="ratioError' + count + '" style="color: crimson;font-size:12px" ></div>'
                    + ' </div>'
                    + ' <div class="col-md-1">'
                    + '     %'
                    + ' </div>'
                    + '</div>'
                    + '</div>';

        $("#selectIngredient").append(selectIngredient);
        $("#selectIngredient").append(inputPump);
        $("#selectIngredient").append(inputRatio);
        removeButton.disabled = false;

        count++;
    });

    $("#removeButton").click(function () {
        count--;

        $("#element1" + count).remove();
        $("#element2" + count).remove();
        $("#element3" + count).remove();

        if (count < 3) {
            removeButton.disabled = true;
        }
    })
</script>

<jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp" />
</body>
</html>
