<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
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


                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="page-title-box">
                            <h4 class="page-title">레시피 수정</h4>
                        </div>
                    </div>
                </div>

                <!-- end page title -->

                <div class="row justify-content-center">
                    <div class="col-sm-8">
                        <div class="card-box">
                            <h4 class="header-title"></h4>

                            <p class="sub-header">
                                레시피를 수정합니다. <br/>* 원재료와 펌프 번호는 중복될 수 없으며, 비율은 합이 100이여야 합니다.
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
                            <button type="submit" class="btn btn-purple waves-effect waves-light" >수정</button>
                            <button type="submit" class="btn btn-purple waves-effect waves-light" >목록</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


            <h1>레시피 수정</h1>
            <form action="/recipe" method="post" id="formId">
                <table id="recipeTable">
                    <tr>
                        <td>레시피 명 : </td>
                        <td>
                            <input type="text" name="name" value="${recipe.name}"/>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="2">
                            <div style="color: crimson; font-size:8px" id="recipeError">
                            </div>
                        </th>
                    </tr>
                    <input type="hidden" name="no" value="${recipe.no}"/>
                    <input type="hidden" id="listSize" value="${recipe.mixList.size()}" />
                    <c:forEach items="${recipe.mixList}" var="mix" varStatus="index">
                        <tr>
                            <td>
                                원재료 : ${index.index}
                            </td>
                            <td>
                                <select name='mixList[${index.index}].ingredientNo' id='selectBox${index.index}'>"
                                    <option value="0">선택..</option>
                                    <c:forEach items="${ingredientList}" var="ingredient">
                                            <c:choose>
                                                <c:when test="${ingredient.no eq mix.ingredientNo}">
                                                    <option value="${ingredient.no}" selected>${ingredient.name}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${ingredient.no}">${ingredient.name}</option>
                                                </c:otherwise>
                                            </c:choose>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <th colspan="2">
                            <div style="color: crimson; font-size:8px" id='ingredientError${index.index}'>
                            </div>
                        </th>
                        <tr>
                            <td>
                                비율 :
                            </td>
                            <td>
                                <input type="text" name="mixList[${index.index}].ratio" value="${mix.ratio}" id='ratioBox${index.index}'/>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <div style="color: crimson; font-size:8px" id='ratioError${index.index}'>
                                </div>
                            </th>
                        </tr>
                        <tr>
                            <td>
                                펌프 :
                            </td>
                            <td>
                                <input type="number" name="mixList[${index.index}].pumpNo" value="${mix.pumpNo}" id='pumpBox${index.index}'/>
                            </td>
                        </tr>
                        <tr>
                            <th colspan="2">
                                <div style="color: crimson; font-size:8px" id='pumpError${index.index}'>
                                </div>
                            </th>
                        </tr>
                        <input type="hidden" name="mixList[${index.index}].no" value="${mix.no}"/>
                        <input type="hidden" name="mixList[${index.index}].ingredientName" value="${mix.ingredientName}"/>
                    </c:forEach>
                    </table>
                    <table>
                        <tr>
                            <td>
                                <input type="button" value="수정" id="submitButton" />
                            </td>
                            <td>
                                <a href="/recipe">목록</a>
                            </td>
                            <td><input type="button" id="addButton" value="원재료 추가" /></td>
                            <c:choose>
                                <c:when test="${recipe.mixList.size() > 2}">
                                    <td><input type="button" id="removeButton" value="원재료 삭제"  /></td>
                                </c:when>
                                <c:otherwise>
                                    <td><input type="button" id="removeButton" value="원재료 삭제" disabled="disabled" /></td>
                                </c:otherwise>
                            </c:choose>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div style="color: crimson; font-size:8px" id="ratioMsg">
                                </div> <br/>
                                <div style="color: crimson; font-size:8px" id="ingredientMsg">
                                </div> <br />
                                <div style="color: crimson; font-size:8px" id="pumpMsg">
                                </div>
                            </td>
                        </tr>
                    <input type="hidden" name="_method" value="PUT"/>
                    </table>
            </form>

        <script type="text/javascript">
            document.getElementById("addButton").addEventListener("click", addIngredient, false);
            document.getElementById("removeButton").addEventListener("click", removeIngredient, false);
            document.getElementById("submitButton").addEventListener("click", submit, false);

            var button = document.getElementById("removeButton");
            var nameNo = Number($("#listSize").val());

            function submit() {
                var result = 0;
                var ratio = 0;

                if ($("#recipe").val() == "") {
                    $("#recipeError").text("* 레시피를 입력해 주세요");
                    result++;
                } else {
                    $("#recipeError").text("");
                }


                for (let i = 0; i < nameNo; i++) {
                    var selectValue = $("#selectBox" + i).val();
                    var ratioBox = Number($("#ratioBox" + i).val());
                    var pumpBox = Number($("#pumpBox" + i).val());
                    ratio = ratio + Number($("#ratioBox" + i).val());

                    if (selectValue == 0) {
                        $("#ingredientError" + i).text("* 원재료를 선택해 주세요.")
                        result++;
                    } else {
                        $("#ingredientError" + i).text("");
                    }

                    if (ratioBox == ""
                        || (ratioBox > 99 && ratioBox < 1)) {
                        $("#ratioError" + i).text("* 1 ~ 99 사이의 숫자를 입력해 주세요.")
                        result++;
                    } else {
                        $("#ratioError" + i).text("");
                    }

                    if (pumpBox == ""
                        || pumpBox < 1) {
                        result++;
                        $("#pumpError" + i).text("* 1이상의 번호를 선택해 주세요.")
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

                for (let i = 0; i < nameNo - 1; i++) {
                    for (let j = i + 1; j < nameNo; j++) {
                        let ingredient = $("#selectBox" + i).val();
                        let ingredientNext = $("#selectBox" + j).val();
                        let pump = $("#pumpBox" + i).val();
                        let pumpNext = $("#pumpBox" + j).val();

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
            }

            function addIngredient() {
                var ingredientTitle = "원재료 : ";
                var ingredientValue = "<select name='mixList[" + nameNo + "].ingredientNo' id='selectBox" + nameNo + "'>"
                    + "<option value='0'> 선택.. </option>"
                    + "<c:forEach items='${ingredientList}' var='ingredient'>"
                    + "<option value='${ingredient.no}'> ${ingredient.name}</option>"
                    + "</c:forEach>"
                    + "</select>"
                    + "<tr>"
                    + "<th colspan='2'>"
                    + "<div style='color: crimson; font-size:8px' id='ingredientError"+ nameNo +"'>"
                    + "</div>"
                    + "</th>"
                    + "</tr>";

                var ratioTitle = "비율 : ";
                var ratioValue = "<input type='text' name='mixList[" + nameNo + "].ratio' id='ratioBox" + nameNo + "' /> %"
                    + "<tr>"
                    + "<th colspan'2'>"
                    + "<div style='color: crimson; font-size:8px' id='ratioError" + nameNo + "'>"
                    + "</div>"
                    + "</th>"
                    + "</tr>";

                var pumpTitle = "펌프 : ";
                var pumpValue = "<input type='number' min='1' max='10' name='mixList[" + nameNo + "].pumpNo' id='pumpBox" + nameNo + "'/>번 펌프"
                    + "<tr>"
                    + "<th colspan='2'>"
                    + "<div style='color: crimson; font-size:8px' id='pumpError" + nameNo + "'>"
                    + "</div>"
                    + "</th>"
                    + "</tr>";


                let table = document.getElementById("recipeTable");

                let newRow = table.insertRow();
                let newCellOne = newRow.insertCell(0);
                let newCellTwo = newRow.insertCell(1);
                newCellOne.innerText = ingredientTitle;
                newCellTwo.innerHTML = ingredientValue;

                newRow = table.insertRow();
                newCellOne = newRow.insertCell(0);
                newCellTwo = newRow.insertCell(1);
                newCellOne.innerText = ratioTitle;
                newCellTwo.innerHTML = ratioValue;

                newRow = table.insertRow();
                newCellOne = newRow.insertCell(0);
                newCellTwo = newRow.insertCell(1);
                newCellOne.innerText = pumpTitle;
                newCellTwo.innerHTML = pumpValue;

                nameNo = nameNo + 1;

                button.disabled = false;
            }

            function removeIngredient() {
                let table = document.getElementById("recipeTable");

                if (nameNo > 2) {
                    for (let i = 0; i < 3; i++) {
                        table.deleteRow(-1);
                    }

                    nameNo = nameNo - 1;
                }

                if (nameNo < 3) {
                    button.disabled = true;
                }
            }
        </script>
</body>
</html>
