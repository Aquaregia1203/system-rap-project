<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>

<html>
<head>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp" />
</head>
<body style="font-family : 'Nanum Gothic', sans-serif" data-layout="horizontal">
    <div id="wrapper">
    <jsp:include page="${pageContext.servletContext.contextPath}/include.jsp" />
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-8">
                            <div class="page-title-box">
                                <h4 class="page-title">원재료 수정</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-sm-8">
                            <form action="${pageContext.servletContext.contextPath}/ingredient" method="POST" id="putForm">
                            <div class="card-box">
                                <h4 class="header-title"></h4>

                                <p class="sub-header">
                                    레시피에 사용할 원재료를 수정합니다. <br/>* 원재료는 다른 원재료와 중복하여 수정할 수 없습니다.
                                </p>
                                    <input type="hidden" name="_method" value="PUT" />
                                    <input type="hidden" name="no" value="${ingredient.no}" />
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="form-group row">
                                                <label class="col-md-3 control-label">원재료 명</label>
                                                <div class="col-md-8">
                                                    <input type="text" id="inputText" name="name" class="form-control" value="${ingredient.name}" >
                                                    <div class="col-md-8" style="color:red; font-size:15px" id="errorName">
                                                        <c:if test="${param.error eq '1'}">
                                                            * 이미 존재하는 원재료 입니다.
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <div class="col-md-12 text-right">
                                <input type="button" id="button" class="btn btn-primary waves-effect waves-light" value="수정" />
                                <a href="${pageContext.servletContext.contextPath}/ingredient" class="btn btn-secondary waves-effect waves-light">목록</a>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $("#button").click(function () {
            if ($("#inputText").val() != "") {
                $("#putForm").submit();
            } else {
                $("#errorName").text("* 원재료 명을 입력해 주세요.");
            }
        });
    </script>

    <jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp" />
</body>
</html>
