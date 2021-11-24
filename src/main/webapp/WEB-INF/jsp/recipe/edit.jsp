<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../top.jsp" />

레시피 수정
<form action="/recipe" method="post">
    <table border="2">
        <tr>
            <td>레시피 명 : </td>
            <td>
                <input type="text" name="name" value="${recipe.name}"/>
            </td>
        </tr>
        <input type="hidden" name="no" value="${recipe.no}"/>
        <c:forEach items="${recipe.mixList}" var="mix" varStatus="index">
            <tr>
                <td>
                    원재료 :
                </td>
                <td>
                    <select name="mixList[${index.index}].ingredientNo">
                    <%-- 원재료 목록 선택 박스 --%>
                        <option value="">선택..</option>
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
                    <input type="text" name="mixList[${index.index}].pumpNo" value="${mix.pumpNo}"/>
                </td>
            </tr>
            <input type="hidden" name="mixList[${index.index}].no" value="${mix.no}"/>
            <input type="hidden" name="mixList[${index.index}].ingredientName" value="${mix.ingredientName}"/>
        </c:forEach>
            <tr>
                <td>
                    <input type="submit" value="수정" />
                </td>
                <td>
                    <a href="/recipe">목록</a>
                </td>
            </tr>
        <input type="hidden" name="_method" value="PUT"/>
    </table>
</form>
</body>
</html>
