<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../top.jsp" />
    <h2>관리자 등록하기</h2>
    <hr>
    <form action="/admin" method="post">
        <table>
            <tr>
                <td>아이디 :</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>비밀번호 :</td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td>이름 :</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <td>연락처 :</td>
                <td><input type="text" name="contact"></td>
            </tr>
        </table>
        <input type="submit" value="등록">
    </form>
    <form action="/admin" method="get">
        <input type="submit" value="목록">
    </form>
</body>
</html>
