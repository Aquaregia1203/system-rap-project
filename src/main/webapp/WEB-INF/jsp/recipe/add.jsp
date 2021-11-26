<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Title</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
<body>
    <jsp:include page="../top.jsp" />

    레시피 등록
<form action="/recipe" method="post" id="formId">
<table border="2" id="recipeTable">
        <tr>
            <td>레시피 명 :</td>
            <td><input type="text" name="name" /></td>
        </tr>
        <tr>
            <td>원재료 :</td>
            <td>
                <select name="mixList[0].ingredientNo">
                    <option value="0">선택..</option>
                    <c:forEach items="${ingredientList}" var="ingredient">
                        <option value="${ingredient.no}">${ingredient.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>비율 :</td>
            <td><input type="text" name="mixList[0].ratio" /> %</td>
        </tr>
        <tr>
            <td>펌프 :</td>
            <td><input type="number" min="1" MAX="10" name="mixList[0].pumpNo" />번 펌프</td>
        </tr>
        <tr>
            <td>원재료  :</td>
            <td>
                <select name="mixList[1].ingredientNo">
                    <option value="0">선택..</option>
                    <c:forEach items="${ingredientList}" var="ingredient">
                        <option value="${ingredient.no}">${ingredient.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>비율 :</td>
            <td><input type="text" name="mixList[1].ratio" /> %</td>
        </tr>
        <tr>
            <td>펌프 :</td>
            <td><input type='number' min="1" MAX="10" name="mixList[1].pumpNo" />번 펌프</td>
        </tr>
    </table>
    <table>
        <tr>
            <td><input type="submit" value="등록" /></td>
            <td><a href="/recipe" >목록</a></td>
            <td><input type="button" id="addButton" value="원재료 추가" /></td>
            <td><input type="button" id="removeButton" value="원재료 삭제" disabled="disabled" /></td>
        </tr>
    </table>
</form>
    <script type="text/javascript">
        document.getElementById("addButton").addEventListener("click", addIngredient, false);
        document.getElementById("removeButton").addEventListener("click", removeIngredient, false);

        var button = document.getElementById("removeButton");
        var nameNo = 2;

         $("#formId [name='mixList']").val()
        function modifyInput() {

        }

        function addIngredient() {
            var ingredientTitle = "원재료 : ";
            var ingredientValue = "<select name='mixList[" + nameNo + "].ingredientNo'>"
                                + "<option value='0'> 선택.. </option>"
                                + "<c:forEach items='${ingredientList}' var='ingredient'>"
                                + "<option value='${ingredient.no}'> ${ingredient.name}</option>"
                                + "</c:forEach>"
                                + "</select>";
            var ratioTitle = "비율 : ";
            var ratioValue = "<input type='text' name='mixList[" + nameNo + "].ratio' /> %";

            var pumpTitle = "펌프 : ";
            var pumpValue = "<input type='number' min='1' name='mixList[" + nameNo + "].pumpNo' />번 펌프";


            console.log(ratioValue);
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
