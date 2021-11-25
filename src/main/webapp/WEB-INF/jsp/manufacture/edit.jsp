<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>생산계획 수정</title>
</head>
<body>
<jsp:include page="../top.jsp" />
<form action="/manufacture-plan" method="post">
    <input type="hidden" name="_method" value="PUT" />
    <input type="hidden" name="no" value="${manufacture.no}" />
    <table>
        <tr>
            <td>레시피 : </td>
            <td>
                <select name="recipeNo">
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
            <td>생산량 : </td>
            <td>
                <input type="number" name="output" value="${manufacture.output}"/> kg
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                <input type="submit" value="수정" />
            </td>
            <td>
                <a href="/manufacture-plan">목록</a>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
