<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<body class="center-menu" data-layout="horizontal">
<div id="wrapper">
    <jsp:include page="top.jsp" />
    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="page-title-box">
                            <h4 class="page-title">관리자 수정</h4>
                        </div>
                    </div>
                </div>
                <div class="row row justify-content-center">
                    <div class="col-sm-8">
                        <div class="card-box">
                            <h4 class="header-title"></h4>
                            <p class="sub-header">
                                생산관리자를 수정합니다. <br/> * 아이디는 중복될 수 없습니다.
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
                                수정
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
