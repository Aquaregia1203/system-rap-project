<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table border="2">
    <tr>
        <td>
            <h1><a href="/admin">관리자</a></h1>
        </td>
        <td>
            ${sessionScope.id}<br/>
            -------------------<br/>
            ${sessionScope.name}
        </td>
    </tr>
</table>

<form action="/logout" method="get">
    <input type="submit" value="로그아웃">
</form>
