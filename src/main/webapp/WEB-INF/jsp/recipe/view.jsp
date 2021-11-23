<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
<body>
<jsp:include page="../top.jsp" />
    레시피 조회 화면

    <table border="2">
        <tr>
            <td>
                ${recipe.name}
            </td>
        </tr>
    </table>
</body>
</html>
