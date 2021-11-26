<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function auth(){
            var addForm = document.addForm;
            var name = addForm.name.value;
            const errorName = document.getElementById("errorName");

            if(!name) {
                errorName.innerHTML = '<div style="color:red">*원재료 이름을 입력하세요</div>'
            } else {
                addForm.submit();
            }
        }
    </script>
</head>
<body>
    <jsp:include page="../top.jsp" />
    <h2>원재료 등록입니다</h2>
    <hr>
    <form name="addForm" action="/ingredient" method="post">
        <table>
            <tr>
                <td>원재료 명 :</td>
                <td><input type="text" name="name"></td>
            </tr>
        </table>
        <div style="color:red" id="errorName">
            <c:if test="${!empty message}">
                ${message}
            </c:if>
        </div>
        <input type="button" onclick="auth()" value="등록">
    </form>
    <form action="/ingredient" method="get">
        <input type="submit" value="목록">
    </form>
</body>
</html>
