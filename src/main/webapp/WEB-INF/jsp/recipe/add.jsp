<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Title</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
<body>
    <jsp:include page="../top.jsp" />

    <h2>레시피 등록</h2>
<form action="/recipe" method="post" id="formId">
<table id="recipeTable">
        <tr>
            <td>레시피 명 :</td>
            <td><input type="text" name="name" id="recipe"/></td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="color: crimson; font-size:8px" id="recipeError">
                    ${recipeDuplication}
                </div>
            </th>
        </tr>
        <tr>
            <td>원재료 :</td>
            <td>
                <select name="mixList[0].ingredientNo" id="selectBox0">
                    <option value="0">선택..</option>
                    <c:forEach items="${ingredientList}" var="ingredient">
                        <option value="${ingredient.no}">${ingredient.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="color: crimson; font-size:8px" id="ingredientError0">
                </div>
            </th>
        </tr>
        <tr>
            <td>비율 :</td>
            <td><input type="text" name="mixList[0].ratio" id="ratioBox0"/> %</td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="color: crimson; font-size:8px" id="ratioError0">
                </div>
            </th>
        </tr>
        <tr>
            <td>펌프 :</td>
            <td><input type="number" min="1" MAX="10" name="mixList[0].pumpNo" id="pumpBox0" />번 펌프</td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="color: crimson; font-size:8px" id="pumpError0">
                </div>
            </th>
        </tr>
        <tr>
            <td>원재료  :</td>
            <td>
                <select name="mixList[1].ingredientNo" id="selectBox1">
                    <option value="0">선택..</option>
                    <c:forEach items="${ingredientList}" var="ingredient">
                        <option value="${ingredient.no}">${ingredient.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="color: crimson; font-size:8px" id="ingredientError1">
                </div>
            </th>
        </tr>
        <tr>
            <td>비율 :</td>
            <td><input type="text" name="mixList[1].ratio" id="ratioBox1"/> %</td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="color: crimson; font-size:8px" id="ratioError1">
                </div>
            </th>
        </tr>
        <tr>
            <td>펌프 :</td>
            <td><input type='number' min="1" MAX="10" name="mixList[1].pumpNo" id="pumpBox1"/>번 펌프</td>
        </tr>
        <tr>
            <th colspan="2">
                <div style="color: crimson; font-size:8px" id="pumpError1">
                </div>
            </th>
        </tr>
    </table>
    <table>
        <tr>
            <td><input type="button" value="등록" id="submitButton"/></td>
            <td><a href="/recipe" >목록</a></td>
            <td><input type="button" id="addButton" value="원재료 추가" /></td>
            <td><input type="button" id="removeButton" value="원재료 삭제" disabled="disabled" /></td>
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
    </table>
</form>
    <script type="text/javascript">
        document.getElementById("addButton").addEventListener("click", addIngredient, false);
        document.getElementById("removeButton").addEventListener("click", removeIngredient, false);
        document.getElementById("submitButton").addEventListener("click", submit, false);

        var button = document.getElementById("removeButton");
        var nameNo = 2;

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
                    $("#ingredientError" + i).text("* 원재료를 선택해 주세요.");
                    result++;
                } else {
                    $("#ingredientError" + i).text("");
                }

                if (ratioBox == ""
                        || (ratioBox > 99 && ratioBox < 1)) {
                    $("#ratioError" + i).text("* 1 ~ 99 사이의 숫자를 입력해 주세요.");
                    result++;
                } else {
                    $("#ratioError" + i).text("");
                }

                if (pumpBox == ""
                        || pumpBox < 1) {
                    result++;
                    $("#pumpError" + i).text("* 1이상의 번호를 선택해 주세요.");
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
