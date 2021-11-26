<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>
<jsp:include page="../top.jsp" />

<h1>레시피 수정</h1>
<form action="/recipe" method="post">
    <table border="2" id="recipeTable">
        <tr>
            <td>레시피 명 : </td>
            <td>
                <input type="text" name="name" value="${recipe.name}"/>
            </td>
        </tr>
        <input type="hidden" name="no" value="${recipe.no}"/>
        <input type="hidden" id="listSize" value="${recipe.mixList.size()}" />
        <c:forEach items="${recipe.mixList}" var="mix" varStatus="index">
            <tr>
                <td>
                    원재료 :
                </td>
                <td>
                    <div id="selectBox">
                        <select name="mixList[${index.index}].ingredientNo" id="ingredientSelect">
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
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    비율 :
                </td>
                <td>
                    <input type="text" name="mixList[${index.index}].ratio" value="${mix.ratio}"/>
                </td>
            </tr>
            <tr>
                <td>
                    펌프 :
                </td>
                <td>
                    <input type="number" name="mixList[${index.index}].pumpNo" value="${mix.pumpNo}"/>
                </td>
            </tr>
            <input type="hidden" name="mixList[${index.index}].no" value="${mix.no}"/>
            <input type="hidden" name="mixList[${index.index}].ingredientName" value="${mix.ingredientName}"/>
        </c:forEach>
        </table>
        <table>
            <tr>
                <td>
                    <input type="submit" value="수정" />
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
        <input type="hidden" name="_method" value="PUT"/>
        </table>
</form>
    <script type="text/javascript">
        document.getElementById("addButton").addEventListener("click", addIngredient, false);
        document.getElementById("removeButton").addEventListener("click", removeIngredient, false);

        var button = document.getElementById("removeButton");
        var nameNo = Number(document.getElementById("listSize").value);

        var selectedValue = $("ingredientSelect option:selected").val();


        function addIngredient() {
            var ingredientTitle = "원재료 : ";
            var ingredientValue = "<select name='mixList[" + (nameNo) + "].ingredientNo'>"
                                    + "<option value='0'> 선택.. </option>"
                                    + "<c:forEach items='${ingredientList}' var='ingredient'>"
                                    + "<option value='${ingredient.no}'> ${ingredient.name}</option>"
                                    + "</c:forEach>"
                                    + "</select>";

            var ratioTitle = "비율 : ";
            var ratioValue = "<input type='text' name='mixList[" + (nameNo) + "].ratio' /> %";

            var pumpTitle = "펌프 : ";
            var pumpValue = "<input type='number' name='mixList[" + (nameNo) + "].pumpNo' /> 번 펌프";


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
