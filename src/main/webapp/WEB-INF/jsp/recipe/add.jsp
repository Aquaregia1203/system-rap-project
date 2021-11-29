<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>레시피 기반 자동 배합 및 생산 관리 시스템</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Responsive bootstrap 4 admin template" name="description" />
        <meta content="Coderthemes" name="author" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="shortcut icon" href="/assets/images/favicon.ico">
        <link href="/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet" />
        <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="/assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
<body class="center-menu" data-layout="horizontal">

    <div id="wrapper">
        <jsp:include page="../top.jsp" />

        <div class="content-page">

            <div class="content">

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->


                    <div class="row justify-content-center">
                        <div class="col-8">
                            <div class="page-title-box">
                                <h4 class="page-title">레시피 등록</h4>
                            </div>
                        </div>
                    </div>

                    <!-- end page title -->

                    <div class="row justify-content-center">
                        <div class="col-sm-8">
                            <div class="card-box">
                                <h4 class="header-title"></h4>

                                <p class="sub-header">
                                    레시피를 등록합니다. <br/>* 원재료와 펌프 번호는 중복될 수 없으며, 비율은 합이 100이여야 합니다.
                                </p>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">레시피 명</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" >
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">1번 원재료</label>
                                            <div class="col-md-7">
                                                <select class="form-control">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-2  control-label">펌프</label>
                                            <div class="col-md-2">
                                                <input type="number" class="form-control" value="0">
                                            </div>
                                            <div class="col-md-2">
                                                번 펌프
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">비율</label>
                                            <div class="col-md-2">
                                                <input type="number" class="form-control" value="0">
                                            </div>
                                            <div class="col-md-2">
                                                %
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-sm-2 control-label">2번 원재료</label>
                                            <div class="col-sm-7">
                                                <select class="form-control">
                                                    <option>1</option>
                                                    <option>2</option>
                                                    <option>3</option>
                                                    <option>4</option>
                                                    <option>5</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">펌프</label>
                                            <div class="col-md-2">
                                                <input type="number" class="form-control" value="0">
                                            </div>
                                            <div class="col-md-2">
                                                번 펌프
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">비율</label>
                                            <div class="col-md-2">
                                                <input type="number" class="form-control" value="0">
                                            </div>
                                            <div class="col-md-2">
                                                %
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 text-right">
                                        <button type="submit" class="btn btn-purple waves-effect waves-light">원재료 추가</button>
                                        <button type="submit" class="btn btn-purple waves-effect waves-light">원재료 삭제</button>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 text-right" >
                                <button type="submit" class="btn btn-purple waves-effect waves-light" >등록</button>
                                <button type="submit" class="btn btn-purple waves-effect waves-light" >목록</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<%--    <script type="text/javascript">--%>
<%--            document.getElementById("addButton").addEventListener("click", addIngredient, false);--%>
<%--            document.getElementById("removeButton").addEventListener("click", removeIngredient, false);--%>
<%--            document.getElementById("submitButton").addEventListener("click", submit, false);--%>

<%--            var button = document.getElementById("removeButton");--%>
<%--            var nameNo = 2;--%>

<%--            function submit() {--%>
<%--                var result = 0;--%>
<%--                var ratio = 0;--%>

<%--                if ($("#recipe").val() == "") {--%>
<%--                    $("#recipeError").text("* 레시피를 입력해 주세요");--%>
<%--                    result++;--%>
<%--                } else {--%>
<%--                    $("#recipeError").text("");--%>
<%--                }--%>


<%--                for (let i = 0; i < nameNo; i++) {--%>
<%--                    var selectValue = $("#selectBox" + i).val();--%>
<%--                    var ratioBox = Number($("#ratioBox" + i).val());--%>
<%--                    var pumpBox = Number($("#pumpBox" + i).val());--%>
<%--                    ratio = ratio + Number($("#ratioBox" + i).val());--%>

<%--                    if (selectValue == 0) {--%>
<%--                        $("#ingredientError" + i).text("* 원재료를 선택해 주세요.");--%>
<%--                        result++;--%>
<%--                    } else {--%>
<%--                        $("#ingredientError" + i).text("");--%>
<%--                    }--%>

<%--                    if (ratioBox == ""--%>
<%--                            || (ratioBox > 99 && ratioBox < 1)) {--%>
<%--                        $("#ratioError" + i).text("* 1 ~ 99 사이의 숫자를 입력해 주세요.");--%>
<%--                        result++;--%>
<%--                    } else {--%>
<%--                        $("#ratioError" + i).text("");--%>
<%--                    }--%>

<%--                    if (pumpBox == ""--%>
<%--                            || pumpBox < 1) {--%>
<%--                        result++;--%>
<%--                        $("#pumpError" + i).text("* 1이상의 번호를 선택해 주세요.");--%>
<%--                    } else {--%>
<%--                        $("#pumpError" + i).text("");--%>
<%--                    }--%>
<%--                }--%>

<%--                if (ratio != 100) {--%>
<%--                    $("#ratioMsg").text("* 비율의 합이 100%이여야 합니다.");--%>
<%--                    result++;--%>
<%--                } else {--%>
<%--                    $("#ratioMsg").text("");--%>
<%--                }--%>

<%--                for (let i = 0; i < nameNo - 1; i++) {--%>
<%--                    for (let j = i + 1; j < nameNo; j++) {--%>
<%--                        let ingredient = $("#selectBox" + i).val();--%>
<%--                        let ingredientNext = $("#selectBox" + j).val();--%>
<%--                        let pump = $("#pumpBox" + i).val();--%>
<%--                        let pumpNext = $("#pumpBox" + j).val();--%>

<%--                        if (ingredient == ingredientNext--%>
<%--                                || pump == pumpNext) {--%>
<%--                            $("#ingredientMsg").text("* 원재료가 중복되거나 펌프 번호가 중복됩니다.");--%>
<%--                            result++;--%>
<%--                        } else {--%>
<%--                            $("#ingredientMsg").text("");--%>
<%--                        }--%>
<%--                    }--%>
<%--                }--%>

<%--                if (result === 0) {--%>
<%--                    $("#formId").submit();--%>
<%--                }--%>
<%--            }--%>

<%--            function addIngredient() {--%>
<%--                var ingredientTitle = "원재료 : ";--%>
<%--                var ingredientValue = "<select name='mixList[" + nameNo + "].ingredientNo' id='selectBox" + nameNo + "'>"--%>
<%--                                    + "<option value='0'> 선택.. </option>"--%>
<%--                                    + "<c:forEach items='${ingredientList}' var='ingredient'>"--%>
<%--                                    + "<option value='${ingredient.no}'> ${ingredient.name}</option>"--%>
<%--                                    + "</c:forEach>"--%>
<%--                                    + "</select>"--%>
<%--                                    + "<tr>"--%>
<%--                                    + "<th colspan='2'>"--%>
<%--                                    + "<div style='color: crimson; font-size:8px' id='ingredientError"+ nameNo +"'>"--%>
<%--                                    + "</div>"--%>
<%--                                    + "</th>"--%>
<%--                                    + "</tr>";--%>

<%--                var ratioTitle = "비율 : ";--%>
<%--                var ratioValue = "<input type='text' name='mixList[" + nameNo + "].ratio' id='ratioBox" + nameNo + "' /> %"--%>
<%--                                + "<tr>"--%>
<%--                                + "<th colspan'2'>"--%>
<%--                                + "<div style='color: crimson; font-size:8px' id='ratioError" + nameNo + "'>"--%>
<%--                                + "</div>"--%>
<%--                                + "</th>"--%>
<%--                                + "</tr>";--%>

<%--                var pumpTitle = "펌프 : ";--%>
<%--                var pumpValue = "<input type='number' min='1' max='10' name='mixList[" + nameNo + "].pumpNo' id='pumpBox" + nameNo + "'/>번 펌프"--%>
<%--                                + "<tr>"--%>
<%--                                + "<th colspan='2'>"--%>
<%--                                + "<div style='color: crimson; font-size:8px' id='pumpError" + nameNo + "'>"--%>
<%--                                + "</div>"--%>
<%--                                + "</th>"--%>
<%--                                + "</tr>";--%>


<%--                let table = document.getElementById("recipeTable");--%>

<%--                let newRow = table.insertRow();--%>
<%--                let newCellOne = newRow.insertCell(0);--%>
<%--                let newCellTwo = newRow.insertCell(1);--%>
<%--                newCellOne.innerText = ingredientTitle;--%>
<%--                newCellTwo.innerHTML = ingredientValue;--%>

<%--                newRow = table.insertRow();--%>
<%--                newCellOne = newRow.insertCell(0);--%>
<%--                newCellTwo = newRow.insertCell(1);--%>
<%--                newCellOne.innerText = ratioTitle;--%>
<%--                newCellTwo.innerHTML = ratioValue;--%>

<%--                newRow = table.insertRow();--%>
<%--                newCellOne = newRow.insertCell(0);--%>
<%--                newCellTwo = newRow.insertCell(1);--%>
<%--                newCellOne.innerText = pumpTitle;--%>
<%--                newCellTwo.innerHTML = pumpValue;--%>

<%--                nameNo = nameNo + 1;--%>

<%--                button.disabled = false;--%>
<%--            }--%>

<%--            function removeIngredient() {--%>
<%--                let table = document.getElementById("recipeTable");--%>

<%--                if (nameNo > 2) {--%>
<%--                    for (let i = 0; i < 3; i++) {--%>
<%--                        table.deleteRow(-1);--%>
<%--                    }--%>

<%--                    nameNo = nameNo - 1;--%>
<%--                }--%>

<%--                if (nameNo < 3) {--%>
<%--                    button.disabled = true;--%>
<%--                }--%>
<%--            }--%>
<%--        </script>--%>
    <!-- Vendor js -->
    <script src="/assets/js/vendor.min.js"></script>

    <!--Form Wizard-->
    <script src="/assets/libs/jquery-steps/jquery.steps.min.js"></script>
    <script src="/assets/libs/jquery-validation/jquery.validate.min.js"></script>

    <!-- Validation init js-->
    <script src="/assets/js/pages/form-wizard.init.js"></script>

    <!-- App js -->
    <script src="/assets/js/app.min.js"></script>
</body>
</html>
