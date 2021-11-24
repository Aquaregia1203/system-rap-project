<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="top.jsp" />
    <h2>관리자 목록을 나열합니다.</h2>
    <form action="/admin" method="get">
        관리자 명: <input type="search" name="name">
        <input type="submit" value="검색">
    </form>
    <table border="1">
        <tr>
            <th>번호</th>
            <th>구분</th>
            <th>아이디</th>
            <th>이름</th>
            <th>연락처</th>
            <th>등록 일자</th>
            <th>상태</th>
        </tr>
        <c:forEach items="${managerList}" var="manager"
                    begin="${start}" end="${end}" varStatus="row">
            <tr>
                <td>${row.count}</td>
                <c:if test="${manager.division eq 'S'}">
                    <td>시스템 관리자</td>
                </c:if>
                <c:if test="${manager.division eq 'M'}">
                    <td>생산 관리자</td>
                </c:if>
                <td><a href="/admin/${manager.id}">${manager.id}</a></td>
                <td>${manager.name}</td>
                <td>${manager.contact}</td>
                <td>${manager.addDate}</td>
                <c:choose>
                    <c:when test="${manager.status eq 'Y'}">
                        <td>활성</td>
                    </c:when>
                    <c:otherwise>
                        <td>비활성</td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </c:forEach>
    </table>
    <table border="1">
        <tr>
            <c:forEach begin="1" end="9" varStatus="index">
                <td>
                    <a href="/admin?page=${index.count}&name=${parm}">${index.count}</a>
                </td>
            </c:forEach>
        </tr>
    </table>
    <form action="/admin/form" method="get">
        <input type="submit" value="등록">
    </form>
</body>
</html>
