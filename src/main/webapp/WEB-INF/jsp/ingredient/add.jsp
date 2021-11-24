<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../top.jsp" />
    <h2>원재료 등록입니다</h2>
    <hr>
    <form action="/ingredient" method="post">
        <table>
            <tr>
                <td>원재료 명</td>
                <td><input type="text" name="name"></td>
            </tr>
        </table>
        <input type="submit" value="등록">
    </form>
    <form action="/ingredient" method="get">
        <input type="submit" value="목록">
    </form>
</body>
</html>
