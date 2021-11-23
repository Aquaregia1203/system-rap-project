<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>레시피 목록</title>
    </head>
    <body>
    <jsp:include page="../top.jsp" />

        <h1>레시피 목록</h1>
        <form action="/recipe" method="GET">
            레시피 명 : <input type="text" name="name" />
            <input type="submit" value="검색" />
        </form>

        <table border="2">
            <tr>
                <th>
                    번호
                </th>
                <th>
                    레시피
                </th>
                <th>
                    등록 일자
                </th>
            </tr>
            <c:forEach items="${recipeList}" var="recipe"
                       begin="${start}" end="${end}" varStatus="index">
                <tr>
                    <td>${index.count}</td>
                    <td><a href="/recipe/${recipe.no}">${recipe.name}</a></td>
                    <td>${recipe.addDate}</td>
                </tr>
            </c:forEach>
        </table>
        <table border="2">
            <tr>
                <c:forEach begin="1" end="9" varStatus="index">
                    <td>
                        <a href="/recipe?page=${index.count}&name=${param.get(name)}">${index.count}</a>
                    </td>
                </c:forEach>
            </tr>
        </table>
    </body>
</html>
