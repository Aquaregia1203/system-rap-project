<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>생산계획 등록</title>
</head>
<body>
    <form action="/manufacture-plan" method="post">
    <table>
        <tr>
            <td>레시피 : </td>
            <td>
                <select id="manufacture.recipeNo">
                    <option value="">선택..</option>
                    <c:forEach items="${recipeList}" var="recipe">
                        <option value="${recipe.no}">${recipe.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>생산량 : </td>
            <td>
                <input type="number" name="output"/> kg
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <input type="submit" value="등록" />
            </td>
            <td>
                <a href="/manufacture-plan">목록</a>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
