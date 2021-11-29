<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page="../head.jsp" />
</head>

<body>

<div class="account-pages mt-5 mb-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6 col-xl-5">
                <div class="card">

                    <div class="text-center account-logo-box">
                        <div class="mt-2 mb-2">
                            <span style="color:white; font-family:Felix Titling, Helvetica,sans-serif; font-size:25pt">RAP-SYSTEM</span>
                        </div>
                    </div>

                    <div class="card-body">
                        <form name="loginForm"  action="/login" method="post" >
                            <c:choose>
                                <c:when test="${! empty sessionScope.saveId}">
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="username" name="id" required="" placeholder="아이디">
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control" type="password" required="" id="password" name="password" placeholder="비밀번호">
                                    </div>

                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox checkbox-success">
                                            <input type="checkbox" name="remember" class="custom-control-input" id="checkbox-signin">
                                            <label class="custom-control-label" for="checkbox-signin">아이디 기억</label>
                                        </div>
                                    </div>
                                    <div class="text-center col-12">
                                        <button class="btn width-md btn-bordered btn-danger waves-effect waves-light" type="submit">로그인</button>
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="username" name="id" required="" placeholder="아이디">
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control" type="password" name="password" required="" id="password" placeholder="비밀번호">
                                    </div>

                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox checkbox-success">
                                            <input type="checkbox" name="remember" class="custom-control-input" id="checkbox-signin">
                                            <label class="custom-control-label" for="checkbox-signin">아이디 기억</label>
                                        </div>
                                    </div>
                                    <div class="text-center col-12">
                                        <button class="btn width-md btn-bordered btn-danger waves-effect waves-light" type="submit">로그인</button>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--    <form name="loginForm"  action="/login" method="post">--%>
<%--        <c:if test="${! empty sessionScope.saveId}">--%>
<%--            아이디   :<input type="text" name="id" value="${sessionScope.saveId}">--%>
<%--            <div id="errorId"></div>--%>
<%--            비밀번호 :<input type="text" name="password">--%>
<%--            <div id="errorPw"></div>--%>
<%--            <input type="button" onclick="login()" value="로그인">--%>
<%--            <div id="errorInfo"></div>--%>
<%--            <input type="checkbox" name="remember" value="check" checked> 아이디 저장--%>
<%--        </c:if>--%>

<%--        <c:if test="${empty sessionScope.saveId}">--%>
<%--            아이디   :<input type="text" name="id">--%>
<%--            <div  id="errorId"></div>--%>
<%--            비밀번호 :<input type="text" name="password">--%>
<%--            <div id="errorPw"></div>--%>
<%--            <input type="button" onclick="login()" value="로그인">--%>
<%--            <div style="color:red" id="errorInfo">${result}</div>--%>
<%--            <input type="checkbox" name="remember" value="check"> 아이디 저장--%>
<%--        </c:if>--%>
<%--    </form>--%>


    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>
    <script type="text/javascript">

        function login(){
            var loginForm = document.loginForm;
            var id = loginForm.id.value;
            var password = loginForm.password.value;
            const errorId = document.getElementById("errorId");
            const errorPw = document.getElementById("errorPw");

            if(!id) {
                errorId.innerHTML = '<div style="color:red">*아이디를 입력하세요</div>'
            } else if (!password) {
                errorPw.innerHTML = '<div style="color:red">*비밀번호를 입력하세요</div>'
            } else {
                loginForm.submit();
            }
        }
    </script>
</body>
</html>
