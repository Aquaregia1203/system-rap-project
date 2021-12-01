<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp" />
    <link href="/assets/libs/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/fixedHeader.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/scroller.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/fixedcolumns.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <title>관리자 조회</title>
</head>
<body data-layout="horizontal">
<div id="wrapper">
    <jsp:include page="${pageContext.servletContext.contextPath}/include.jsp" />
    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                </ol>
                            </div>
                            <h4 class="page-title">관리자 상세 조회</h4>
                        </div>
                    </div>
                </div>
                <!-- end page title -->

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <div class="dataTables_wrapper dt-bootstrap4 no-footer">
                            </div>
                            <table id="datatable" class="table table-sm table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                <colgroup>
                                    <col width="*"/>
                                    <col width="*"/>
                                    <col width="20%"/>
                                    <col width="10%"/>
                                    <col width="20%"/>
                                    <col width="10%"/>
                                </colgroup>
                                <thead class="text-center">
                                <tr>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>연락처</th>
                                    <th>구분</th>
                                    <th>등록 일자</th>
                                    <th>상태</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                <tr>
                                    <td>${manager.id}</td>
                                    <td>${manager.name}</td>
                                    <td class="text-center">${manager.contact}</td>
                                    <c:if test="${manager.division eq 'S'}">
                                        <td class="text-center">시스템 관리자</td>
                                    </c:if>
                                    <c:if test="${manager.division eq 'M'}">
                                        <td class="text-center">생산 관리자</td>
                                    </c:if>
                                    <td class="text-center">${manager.addDate}</td>
                                    <c:if test="${manager.status eq 'Y'}">
                                        <td class="text-center">활성화</td>
                                    </c:if>
                                    <c:if test="${manager.status eq 'N'}">
                                        <td class="text-center">비활성화</td>
                                    </c:if>
                                </tr>
                                </tbody>
                            </table>
                            <div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12">
                                        <div class="dataTables_filter">
                                            <label>
                                                <form action="/admin/${manager.id}/form" method="get">
                                                    <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="수정">
                                                </form>
                                            </label>
                                            <label>
                                                <form action="/admin" method="get">
                                                    <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="목록">
                                                </form>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <div id="datatable_filter" class="dataTables_filter">
                                            <label>
                                                <div class="btn-group mb-2">
                                                    <button type="button" class="btn btn-secondary waves-effect"><</button>
                                                    <button type="button" class="btn btn-secondary waves-effect">1</button>
                                                    <button type="button" class="btn btn-secondary waves-effect">></button>
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
