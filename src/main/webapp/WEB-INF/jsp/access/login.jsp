<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript">
        function login(){
            var loginForm = document.loginForm;
            var id = loginForm.id.value;
            var password = loginForm.password.value;
            const errorId = document.getElementById("errorId");
            const errorPw = document.getElementById("errorPw");

            if(!id) {
                errorId.innerHTML = '<div style="color:red">*아이디를 입력하세요<div>'
            } else if (!password) {
                errorPw.innerHTML = '<div style="color:red">*비밀번호를 입력하세요<div>'
            } else {
                loginForm.submit();
            }
        }
    </script>
</head>
<body>
    <h2>로그인</h2>
    <hr>
    <form name="loginForm"  action="/login" method="post">
        <c:if test="${! empty sessionScope.saveId}">
            아이디   :<input type="text" name="id" value="${sessionScope.saveId}">
            <div id="errorId"></div>
            비밀번호 :<input type="text" name="password">
            <div id="errorPw"></div>
            <input type="button" onclick="login()" value="로그인">
            <input type="checkbox" name="remember" value="check" checked> 아이디 저장
        </c:if>
        <c:if test="${empty sessionScope.saveId}">
            아이디   :<input type="text" name="id">
            <div id="errorId"></div>
            비밀번호 :<input type="text" name="password">
            <div id="errorPw"></div>
            <input type="button" onclick="login()" value="로그인">
            <input type="checkbox" name="remember" value="check"> 아이디 저장
        </c:if>
    </form>
</body>
</html>
