<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <td>${manager.division}</td>
        </tr>
        <tr>
            <td>등록 일자</td>
            <td>${manager.addDate}</td>
        </tr>
        <tr>
            <td>상태</td>
            <td>${manager.status}</td>
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
