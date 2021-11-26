<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function auth() {
            var addForm = document.addForm;
            var id = addForm.id.value;
            var password = addForm.password.value;
            var name = addForm.name.value;
            var top = addForm.top.value;
            var middle = addForm.middle.value;
            var bottom = addForm.bottom.value;
            const errorId = document.getElementById("errorId");
            const errorPwd = document.getElementById("errorPwd");
            const errorName = document.getElementById("errorName");
            const errorContact = document.getElementById("errorContact");

            if (!id) {
                errorId.innerHTML = '<div style="color:red; font-size: 8px">*아이디를 입력해 주세요.</div>';
            } else {
                errorId.innerHTML = '';
            }

            if (!password) {
                errorPwd.innerHTML = '<div style="color:red; font-size: 8px">*비밀번호를 입력해 주세요.</div>';
            } else {
                errorPwd.innerHTML = '';
            }

            if (!name) {
                errorName.innerHTML = '<div style="color:red; font-size: 8px">*이름을 입력해 주세요.</div>';
            } else {
                errorName.innerHTML = '';
            }

            if (!top || !middle || !bottom) {
                errorContact.innerHTML = '<div style="color:red; font-size: 8px">*연락처를 입력해 주세요.</div>';
            } else {
                errorContact.innerHTML = '';
            }

            if (!id || !password || !name || !top || !middle || !bottom) {
            } else {
                addForm.submit();
            }

        }
    </script>
</head>
<body>
    <jsp:include page="top.jsp" />
    <h2>관리자 등록하기</h2>
    <hr>
    <form name="addForm" action="/admin" method="post">
        <table>
            <tr>
                <td>아이디 :</td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <th colspan="2">
                    <div id="errorId"></div>
                </th>
            </tr>
            <tr>
                <td>비밀번호 :</td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <th colspan="2">
                    <div id="errorPwd"></div>
                </th>
            </tr>
            <tr>
                <td>이름 :</td>
                <td><input type="text" name="name"></td>
            </tr>
            <tr>
                <th colspan="2">
                    <div id="errorName"></div>
                </th>
            </tr>
            <tr>
                <td>연락처 :</td>
                <td>
                    <select name="top">
                        <option value="">선택..</option>
                        <option value="010">010</option>
                    </select> -
                    <input type="text" name="middle"> -
                    <input type="text" name="bottom">
                </td>
            </tr>
            <tr>
                <th colspan="2">
                    <div id="errorContact">${message}</div>
                </th>
            </tr>
        </table>
        <input type="button" onclick="auth()" value="등록">
    </form>
    <form action="/admin" method="get">
        <input type="submit" value="목록">
    </form>
    <div id="errorInfo"></div>
</body>
</html>
