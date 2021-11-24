<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../top.jsp" />
    <h2>관리자 상세 조회</h2>
    <hr>
    <table border="1">
        <tr>
            <td>아이디</td>
            <td>${manager.id}</td>
        </tr>
        <tr>
            <td>이름</td>
            <td>${manager.name}</td>
        </tr>
        <tr>
            <td>연락처</td>
            <td>${manager.contact}</td>
        </tr>
        <tr>
            <td>구분</td>
            <c:if test="${manager.division eq 'S'}">
                <td>시스템 관리자</td>
            </c:if>
            <c:if test="${manager.division eq 'M'}">
                <td>생산 관리자</td>
            </c:if>
        </tr>
        <tr>
            <td>등록 일자</td>
            <td>${manager.addDate}</td>
        </tr>
        <tr>
            <td>상태</td>
            <c:if test="${manager.status eq 'Y'}">
                <td>활성</td>
            </c:if>
            <c:if test="${manager.status eq 'N'}">
                <td>비활성</td>
            </c:if>
        </tr>
    </table>
    <form action="/admin/${manager.id}/form" method="get">
        <input type="submit" value="수정">
    </form>
    <form action="/admin" method="get">
        <input type="submit" value="목록">
    </form>
</body>
</html>
