<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp" />
    <title>RAP - System : 관리자 등록</title>
</head>

<body style="font-family : 'Nanum Gothic', sans-serif" data-layout="horizontal">
<div id="wrapper">
    <jsp:include page="top.jsp" />
    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="page-title-box">
                            <h4 class="page-title">관리자 등록</h4>
                        </div>
                    </div>
                </div>
                <div class="row row justify-content-center">
                    <div class="col-sm-8">
                        <form action="${pageContext.servletContext.contextPath}/manager" method="post" id="formId">
                            <div class="card-box">
                                <h4 class="header-title"></h4>
                                <p class="sub-header">
                                    생산관리자를 등록합니다. <br/> * 아이디는 중복하여 등록할 수 없습니다.
                                </p>
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">아이디</label>
                                            <div class="col-md-7">
                                                <input type="text" name="id" id="id" class="form-control" value="${manager.id}">
                                                <div style="color: crimson; font-size:12px" id="idError">
                                                    ${message}
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">비밀번호</label>
                                            <div class="col-md-7">
                                                <input type="password" name="password" id="password" class="form-control" value="${manager.password}">
                                                <div style="color: crimson; font-size:12px" id="passwordError">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">이름</label>
                                            <div class="col-md-7">
                                                <input type="text" name="name" id="name" class="form-control" value="${manager.name}">
                                                <div style="color: crimson; font-size:12px" id="nameError">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-3 control-label">연락처</label>
                                            <div class="col-md-7">
                                                <input type="text" name="contact" id="contact" class="form-control" placeholder="ex) 010-1234-5678" value="${manager.contact}" >
                                                <div style="color: crimson; font-size:12px" id="contactError">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 text-right">
                                <button class="btn btn-primary waves-effect waves-light" type="button" id="submitButton">
                                    등록
                                </button>
                                <a href="${pageContext.servletContext.contextPath}/manager" class="btn btn-secondary waves-effect ml-1">목록</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#submitButton").click(function () {
        let result = 0;
        let size = $("#contact").val().length;

        if (size != 13) {
            result++;
            $("#contactError").text("* 연락처를 입력해 주세요.");
        } else {
            $("#contactError").text("");
        }

        if (!$("#id").val()) {
            result++;
            $("#idError").text("* 비밀번호를 입력해 주세요.");
        } else {
            $("#idError").text("");
        }

        if (!$("#name").val()) {
            result++;
            $("#nameError").text("* 이름을 입력해 주세요.");
        } else {
            $("#nameError").text("");
        }

        if (!$("#password").val()) {
            result++;
            $("#passwordError").text("* 비밀번호를 입력해 주세요.");
        } else {
            $("#passwordError").text("");
        }

        for (let i = 0; i < size; i++) {
            let contact = $("#contact").val().charAt(i);

            if (i == 3 || i == 8) {
                if (!isNaN(contact)) {
                    result++;
                    $("#contactError").text("* 올바른 형식의 연락처가 아닙니다.")
                }
            } else {
                if (isNaN(contact)) {
                    result++;
                    $("#contactError").text("* 올바른 형식의 연락처가 아닙니다.")
                }
            }
        }

        if (result === 0) {
            $("#formId").submit();
        }
    });
</script>
<jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp" />
</body>
</html>