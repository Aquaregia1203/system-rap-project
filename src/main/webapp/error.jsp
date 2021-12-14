<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp" />
</head>

<body class="authentication-bg" style="font-family: 'Nanum Gothic',sans-serif;">
    <div class="home-btn d-none d-sm-block">
        <a href="${pageContext.servletContext.contextPath}/manufacture-plan"><i class="fas fa-home h2"></i></a>
    </div>
    <div class="account-pages my-5 pt-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-sm-6 text-center">

                    <div class="wrapper-page">
                        <img src="${pageContext.servletContext.contextPath}/assets/images/animat-search-color.gif" alt="" height="120">
                        <h2 class="text-uppercase text-danger">오류!</h2>
                        <p class="text-muted mb-2">
                            잘못된 요청입니다. 다시 시도해 주세요.
                        </p>

                        <a class="btn btn-success waves-effect waves-light mt-4" href="${pageContext.servletContext.contextPath}/manufacture-plan">돌아가기</a>
                    </div>
                </div>

            </div>
            <!-- end col -->
        </div>
        <!-- end row -->
    </div>
<jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp"/>
</body>
</html>
