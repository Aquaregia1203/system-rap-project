<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../top.jsp" />
    <h2>원재료 목록</h2>
    <form>
        원재료 명: <input type="search" name="name">
        <input type="submit" value="검색">
    </form>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>원재료</th>
            <th>등록 일자</th>
        </tr>
        <c:forEach items="${ingredientList}" var="ingredient"
                   begin="${start}" end="${end}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td><a href="/ingredient/${ingredient.no}">${ingredient.name}</a></td>
                <td>${ingredient.addDate}</td>
            </tr>
        </c:forEach>
    </table>
    <table border="1">
        <c:forEach begin="1" end="9" varStatus="index">
            <td>
                <a href="/ingredient?page=${index.count}&name=${param.get(name)}">${index.count}</a>
            </td>
        </c:forEach>
    </table>
    <form action="/ingredient/form" method="get">
        <input type="submit" value="등록">
    </form>
</body>
</html>
