<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Title</title>
    </head>
<body>
    <jsp:include page="../top.jsp" />

    레시피 등록
<form action="/recipe" method="post">
    <table border="2">
        <tr>
            <td>
                레시피 명 :
            </td>
            <td>
                <input type="text" name="name" />
            </td>
        </tr>
        <tr>
            <td>
                원재료 :
            </td>
            <td>
<%--                <input type="text" name="mixList[0].ingredientNo" />--%>
                <select name="mixList[0].ingredientNo">
                    <option value="0">선택..</option>
                    <c:forEach items="${ingredientList}" var="ingredient">
                        <option value="${ingredient.no}">${ingredient.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                비율 :
            </td>
            <td>
                <input type="text" name="mixList[0].ratio" /> %
            </td>
        </tr>
        <tr>
            <td>
                펌프 :
            </td>
            <td>
                <input type="number" min="1" MAX="10" name="mixList[0].pumpNo" />번 펌프
            </td>
        </tr>
        <!-- 두번 째 펌프 필수 -->
        <tr>
            <td>
                원재료  :
            </td>
            <td>
<%--                <input type="text" name="mixList[1].ingredientNo" />--%>
                <select name="mixList[1].ingredientNo">
                    <option value="0">선택..</option>
                    <c:forEach items="${ingredientList}" var="ingredient">
                        <option value="${ingredient.no}">${ingredient.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                비율 :
            </td>
            <td>
                <input type="text" name="mixList[1].ratio" /> %
            </td>
        </tr>
        <tr>
            <td>
                펌프 :
            </td>
            <td>
                <input type="number" min="1" MAX="10" name="mixList[1].pumpNo" />번 펌프
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="등록" /></td>
            <td><a href="/recipe" >목록</a></td>
            <td><button value="원재료 추가" /></td>
        </tr>
    </table>
</form>
</body>
</html>
