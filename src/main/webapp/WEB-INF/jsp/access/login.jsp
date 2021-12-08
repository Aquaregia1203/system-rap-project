<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp" />
</head>

<body style="font-family: 'Nanum Gothic',sans-serif;">

<div class="account-pages mt-5 mb-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6 col-xl-5">
                <div class="card">
                    <div class="text-center account-logo-box">
                        <div class="mt-2 mb-2">
                            <span style="color:white; font-size:20pt">레시피 기반 자동 배합 및 생산 관리</span>
                        </div>
                    </div>

                    <div class="card-body">
                        <form name="loginForm" action="${pageContext.servletContext.contextPath}/login" method="post" >
                            <c:choose>
                                <c:when test="${! empty sessionScope.saveId}">
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="id" name="id" required="" placeholder="아이디" value="${sessionScope.saveId}">
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control" type="password" required="" id="password" name="password" placeholder="비밀번호">
                                    </div>
                                    <c:if test="${!empty result}">
                                        <div class="form-group">
                                            <label class="control-label">${result}</label>
                                        </div>
                                    </c:if>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox checkbox-success">
                                            <input type="checkbox" name="remember" value="check" class="custom-control-input" id="checkbox-signin" checked>
                                            <label class="custom-control-label" for="checkbox-signin">아이디 기억</label>
                                        </div>
                                    </div>
                                    <div class="text-center col-12">
                                        <button class="btn width-md btn-bordered btn-danger waves-effect waves-light" type="submit">로그인</button>
                                    </div>
                                </c:when>

                                <c:otherwise>
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="id" name="id" required="" placeholder="아이디">
                                    </div>

                                    <div class="form-group">
                                        <input class="form-control" type="password" name="password" required="" id="password" placeholder="비밀번호">
                                    </div>
                                    <c:if test="${!empty result}">
                                        <div class="form-group">
                                            <label class="control-label">${result}</label>
                                        </div>
                                    </c:if>

                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox checkbox-success">
                                            <input type="checkbox" name="remember" value="check" class="custom-control-input" id="checkbox-signin">
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

<jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp"/>
</body>
</html>
