
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../top.jsp" />
    <h2>원재료 수정 화면</h2>
    <hr>
    <form action="/ingredient" method="post">
        <table>
            <tr>
                <td>원재료 명 :</td>
                <td><input type="text" name="name" value="${ingredient.name}"></td>
            </tr>
        </table>
        <input type="submit" value="수정">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" name="no" value="${ingredient.no}">
    </form>
    <form action="/ingredient" method="get">
        <input type="submit" value="목록">
    </form>
</body>
</html>
