<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page="../head.jsp" />
    <link href="/assets/libs/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/fixedHeader.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/scroller.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/fixedcolumns.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <title>원재료 조회</title>
</head>
<body class="center-menu" data-layout="horizontal">
    <div id="wrapper">
    <jsp:include page="../top.jsp" />
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
                                <h4 class="page-title">원재료 상세 조회</h4>
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
                                        <col width="40%"/>
                                        <col width="30%"/>
                                        <col width="30%"/>
                                    </colgroup>
                                    <thead align="center">
                                    <tr>
                                        <th>원재료 명</th>
                                        <th>등록 일자</th>
                                        <th>사용 여부</th>
                                    </tr>
                                    </thead>

                                    <tbody class="text-center">
                                    <tr>
                                        <td>${ingredient.name}</td>
                                        <td>${ingredient.addDate}</td>
                                        <c:if test="${ingredient.usedCount gt 0}">
                                            <td>사용</td>
                                        </c:if>
                                        <c:if test="${ingredient.usedCount eq 0}">
                                            <td>미사용</td>
                                        </c:if>
                                    </tr>
                                    </tbody>
                                </table>
                                <div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-12">
                                            <div class="dataTables_filter">
                                                <label>
                                                    <c:choose>
                                                        <c:when test="${ingredient.usedCount eq 0}">
                                                            <form action="/ingredient/${ingredient.no}/form" method="get">
                                                                <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="수정">
                                                            </form>
                                                </label>
                                                            <label>
                                                            <form action="/ingredient" method="post">
                                                                <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="삭제">
                                                                <input type="hidden" name="_method" value="delete">
                                                                <input type="hidden" name="no" value="${ingredient.no}">
                                                            </form>
                                                            </label>
                                                            <label>
                                                            <form action="/ingredient" method="get">
                                                                <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="목록">
                                                            </form>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <form action="/ingredient" method="get">
                                                                <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="목록">
                                                            </form>
                                                        </c:otherwise>
                                                    </c:choose>
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
</body>
</html>
