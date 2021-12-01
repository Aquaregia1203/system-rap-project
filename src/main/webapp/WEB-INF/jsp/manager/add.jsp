<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8" />
    <title>관리자 등록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Responsive bootstrap 4 admin template" name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="assets/images/favicon.ico">
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet" />
    <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet" />

</head>

<body data-layout="horizontal">
<div id="wrapper">
    <jsp:include page="top.jsp" />
    <div class="content-page">
        <div class="content">

            <!-- Start Content-->
            <div class="container-fluid">

                <!-- start page title -->
                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="page-title-box">

                            <h4 class="page-title">관리자 등록</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row row justify-content-center">
                    <div class="col-sm-8">
                        <div class="card-box">
                            <h4 class="header-title"></h4>
                            <p class="sub-header">
                                생산관리자를 등록합니다. <br/> * 아이디는 중복될 수 없습니다.
                            </p>
                            <div class="row">
                                <div class="col-lg-12">
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">아이디</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">비밀번호</label>
                                            <div class="col-md-7">
                                                <input type="password" class="form-control" >
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-md-2 control-label" for="example-email">이름</label>
                                            <div class="col-md-7">
                                                <input type="email" id="example-email" name="example-email" class="form-control" >
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-md-2 control-label">연락처</label>
                                            <div class="col-md-7">
                                                <input type="text" class="form-control" placeholder="000-0000-0000" >
                                            </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12 text-right">
                            <button class="btn btn-primary waves-effect waves-light" type="submit">
                                등록
                            </button>
                            <button type="reset" class="btn btn-secondary waves-effect ml-1">
                                목록
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


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

</body>
</html>