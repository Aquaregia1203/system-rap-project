<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<table border="2">
    <tr>
        <td>
            <h1><a href="/ingredient">원재료</a></h1>
        </td>
        <td>
            <h1><a href="/recipe">레시피</a></h1>
        </td>
        <td>
            <h1><a href="/manufacture-plan">생산계획</a></h1>
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
