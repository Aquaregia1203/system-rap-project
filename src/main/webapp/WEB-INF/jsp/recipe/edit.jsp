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
                            <h4 class="page-title">레시피 수정</h4>
                        </div>
                    </div>
                </div>

                <form action="${pageContext.servletContext.contextPath}/recipe" method="post" id="formId">
                <input type="hidden" name="_method" value="PUT" />
                    <div class="row justify-content-center">
                        <div class="col-sm-8">
                            <div class="card-box">
                                <h4 class="header-title"></h4>
                                <p class="sub-header">
                                    레시피를 수정합니다. <br/>* 원재료와 펌프 번호는 중복될 수 없으며, 비율은 합이 100이여야 합니다.
                                </p>
                                <div class="row" id="selectIngredient">
                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">레시피 명</label>
                                            <div class="col-md-9">
                                                <input type="text" name="name" id="recipe" class="form-control" value="${recipe.name}">
                                                <div id="recipeError" style="color: crimson;font-size:12px" >
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12 text-right">
                                    <button type="button" id="addButton" class="btn btn-primary waves-effect waves-light">원재료 추가</button>
                                    <button type="button" id="removeButton" class="btn btn-primary waves-effect waves-light">원재료 삭제</button>
                                </div>
                            </div>
                            <div class="col-lg-12 text-right" >
                                <div class="col-md-6 text-left" id="ingredientMsg" style="color: crimson;font-size:16px" >
                                </div>
                                <div class="col-md-6 text-left" id="ratioMsg" style="color: crimson;font-size:16px" >
                                </div>
                                <button type="button" id="submitButton" class="btn btn-primary waves-effect waves-light" >수정</button>
                                <a href="${pageContext.servletContext.contextPath}/recipe" class="btn btn-secondary waves-effect waves-light">
                                    목록
                                </a>
                            </div>
                        </div>
                    </div>
                <input type="hidden" name="no" value="${recipe.no}" />
                </form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    var removeButton = document.getElementById("removeButton");
    var selectIngredient, inputPump, inputRatio;
    var count = ${recipe.mixList.size()};

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
        <c:forEach items="${recipe.mixList}" var="mix" varStatus="index">
            selectIngredient = '<div class="col-lg-12" id="element1${index.index}">'
                + '<div class="form-group row">'
                + '    <label class="col-md-3 control-label">${index.index + 1}번 원재료</label>'
                + '    <div class="col-md-9">'
                + '        <select class="form-control" name="mixList[${index.index}].ingredientNo" id="ingredient${index.index}">'
                + '        <option value="0">선택..</option>'
                + '            <c:forEach items="${ingredientList}" var="ingredient" >'
                + '               <c:if test="${mix.ingredientNo eq ingredient.no}">'
                + '                    <option value="${ingredient.no}" selected >${ingredient.name}</option>'
                + '               </c:if>'
                + '               <c:if test="${mix.ingredientNo ne ingredient.no}">'
                + '                    <option value="${ingredient.no}" >${ingredient.name}</option>'
                + '               </c:if>'
                + '           </c:forEach>'
                + '        </select>'
                + '        <div id="ingredientError${index.index}" style="color: crimson;font-size:12px" ></div>'
                + '    </div>'
                + '</div>'
                + '</div>';
            inputPump = '<div class="col-lg-12" id="element2${index.index}">'
                + '<div class="form-group row">'
                + ' <label class="col-md-3  control-label">펌프</label>'
                + ' <div class="col-md-8">'
                + '     <input type="number" class="form-control" id="pumpNo${index.index}" name="mixList[${index.index}].pumpNo" value="${mix.pumpNo}">'
                + '     <div id="pumpError${index.index}" style="color: crimson;font-size:12px" ></div>'
                + ' </div>'
                + ' <div class="col-md-1">'
                + '     번'
                + ' </div>'
                + '</div>'
                + '</div>';
            inputRatio = '<div class="col-lg-12" id="element3${index.index}">'
                + '<div class="form-group row">'
                + ' <label class="col-md-3 control-label">비율</label>'
                + ' <div class="col-md-8">'
                + '     <input type="number" class="form-control" id="ratio${index.index}" name="mixList[${index.index}].ratio" value="${mix.ratio}">'
                + '     <div id="ratioError${index.index}" style="color: crimson;font-size:12px" ></div>'
                + ' </div>'
                + ' <div class="col-md-1">'
                + '     %'
                + ' </div>'
                + '</div>'
                + '<input type="hidden" name="mixList[${index.index}].no" value=${mix.no} />'
                + '</div>';

            $("#selectIngredient").append(selectIngredient);
            $("#selectIngredient").append(inputPump);
            $("#selectIngredient").append(inputRatio);
        </c:forEach>

        if (count < 3) {
            removeButton.disabled = true;
        }
    });

    $("#addButton").click(function () {
        selectIngredient = '<div class="col-lg-12" id="element1' + count + '">'
            + '<div class="form-group row">'
            + '    <label class="col-md-3 control-label">' + (count + 1) + '번 원재료</label>'
            + '    <div class="col-md-9">'
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
            + '     <input type="number" class="form-control" id="pumpNo' + count + '" name="mixList[' + count + '].pumpNo" >'
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
            + '     <input type="number" class="form-control" id="ratio' + count + '" name=mixList[' + count + '].ratio >'
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
</body>
</html>
