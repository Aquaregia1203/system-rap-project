<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function auth() {
            var editForm = document.editForm;
            var password = editForm.password.value;
            var name = editForm.name.value;
            var top = editForm.top.value;
            var middle = editForm.middle.value;
            var bottom = editForm.bottom.value;
            const errorPwd = document.getElementById("errorPwd");
            const errorName = document.getElementById("errorName");
            const errorContact = document.getElementById("errorContact");

            if (!password) {
                errorPwd.innerHTML = '<div style="color:red">*비밀번호를 입력해 주세요.</div>';
            } else {
                errorPwd.innerHTML = '';
            }

            if (!name) {
                errorName.innerHTML = '<div style="color:red">*이름을 입력해 주세요.</div>';
            } else {
                errorName.innerHTML = '';
            }

            if (!top || !middle || !bottom) {
                errorContact.innerHTML = '<div style="color:red">*연락처를 입력해 주세요.</div>';
            } else {
                errorContact.innerHTML = '';
            }

            if (!password || !name || !top || !middle || !bottom) {
            } else {
                editForm.submit();
            }

        }
    </script>
</head>
<body>
<jsp:include page="top.jsp" />
    <h2>관리자 수정 화면입니다</h2>
    <hr>
    <form name="editForm" action="/admin" method="post">
        <table>
            <tr>
                <td>아이디 : ${manager.id}</td>
            </tr>
            <tr>
                <td>비밀번호 :</td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="errorPwd"></div>
                </td>
            </tr>
            <tr>
                <td>이름 :</td>
                <td><input type="text" name="name" value="${manager.name}"> </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="errorName"></div>
                </td>
            </tr>
            <tr>
                <td>연락처 :</td>
                <td>
                    <select name="top">
                        <option value="">선택..</option>
                        <option value="010" selected>010</option>
                    </select> -
                    <input type="text" name="middle" value="${contact.middle}"> -
                    <input type="text" name="bottom" value="${contact.bottom}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="errorContact"></div>
                </td>
            </tr>
            <tr>
                <c:if test="${manager.division eq 'M'}">
                    <td>상태 :</td>
                    <td>
                        <c:choose>
                            <c:when test="${manager.status eq 'Y'}">
                                <input type="radio" name="status" value="Y" checked>활성화
                                <input type="radio" name="status" value="N">비활성화
                            </c:when>
                            <c:otherwise>
                                <input type="radio" name="status" value="Y">활성화
                                <input type="radio" name="status" value="N" checked>비활성화
                            </c:otherwise>
                        </c:choose>
                    </td>
                </c:if>
            </tr>
        </table>
        <input type="button" onclick="auth()" value="수정">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" name="id" value="${manager.id}">
    </form>
    <form action="/admin" method="get">
    <input type="submit" value="목록">
    </form>
</body>
</html>
