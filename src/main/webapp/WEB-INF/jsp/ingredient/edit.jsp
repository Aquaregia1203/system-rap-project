<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../head.jsp" />
    <script type="text/javascript">
        function auth(){
            var editForm = document.editForm;
            var name = editForm.name.value;
            const errorName = document.getElementById("errorName");

            if(!name) {
                errorName.innerHTML = '<div style="color:red">*원재료 이름을 입력하세요</div>'
            } else {
                editForm.submit();
            }
        }
    </script>
</head>
<body class="center-menu" data-layout="horizontal">
    <div id="wrapper">
    <jsp:include page="../top.jsp" />
        <div class="content-page">

            <h2>원재료 수정 화면</h2>
            <hr>
            <form name="editForm" action="/ingredient" method="post">
                <table>
                    <tr>
                        <td>원재료 명 :</td>
                        <td><input type="text" name="name" value="${ingredient.name}"></td>
                    </tr>
                </table>
                <div style="color:red" id="errorName">
                    <c:if test="${param.msg eq '1'}">
                        *중복되는 원재료 입니다.
                    </c:if>
                </div>
                <input type="button" onclick="auth()" value="등록">
                <input type="hidden" name="_method" value="put">
                <input type="hidden" name="no" value="${ingredient.no}">
            </form>
            <form action="/ingredient" method="get">
                <input type="submit" value="목록">
            </form>
        </div>
    </div>
</body>
</html>
