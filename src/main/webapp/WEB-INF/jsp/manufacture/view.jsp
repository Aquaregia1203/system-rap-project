<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>생산계획 상세 조회</title>
</head>
<body class="center-menu" data-layout="horizontal">
<div id="wrapper">
    <jsp:include page="../top.jsp" />
        <div class="content-page">
            <div class="content">

                <!-- Start Content-->
                <div class="container-fluid">

                    <!-- start page title -->
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                    </ol>
                                </div>
                                <h4 class="page-title">생산계획 상세 조회</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <div class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-12">
                                            <div class="dataTables_filter">
                                                <form action="/manufacture-plan/execution" method="get">
                                                    <label>
                                                        <c:if test="${(applicationScope.status eq 'OFF' or applicationScope.status eq null)
                                                                    and manufacture.status eq 'N'}">
                                                            <input class="btn btn-sm btn-secondary waves-effect width-xs" type="button" value="생산 시작">
                                                        </c:if>
                                                        <input type="hidden" name="recipeNo" value="${manufacture.recipeNo}" />
                                                        <input type="hidden" name="output" value="${manufacture.output}" />
                                                        <input type="hidden" name="no" value="${manufacture.no}" />
                                                        <input type="hidden" name="status" value="${manufacture.status}" />
                                                    </label>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table id="datatable" class="table table-sm table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <colgroup>
                                        <col width="*"/>
                                        <col width="10%"/>
                                        <col width="*"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="10%"/>
                                        <col width="20%"/>
                                    </colgroup>
                                    <thead class="text-center">
                                    <tr>
                                        <th>레시피</th>
                                        <th>생산량</th>
                                        <th>생산 일자</th>
                                        <th>오차량</th>
                                        <th>생산자</th>
                                        <th>상태</th>
                                        <th>등록 일자</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td>${manufacture.recipeName}</td>
                                            <td>${manufacture.output} kg</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${empty manufacture.manufactureDate}">
                                                        -
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${manufacture.manufactureDate}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${empty manufacture.errorAmount}">
                                                        -
                                                    </c:when>
                                                    <c:otherwise>
                                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${manufacture.errorAmount}" /> g
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${manufacture.managerName}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${manufacture.status eq 'N'}">
                                                        -
                                                    </c:when>
                                                    <c:otherwise>
                                                        완료
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${manufacture.addDate}</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-12">
                                            <div class="dataTables_filter">
                                                <label>
                                                    <c:if test="${manufacture.status eq 'N'}">
                                                        <form action="/manufacture-plan/${manufacture.no}/form" method="GET">
                                                            <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="수정"/>
                                                            <input type="hidden" name="no" value="${manufacture.no}"/>
                                                        </form>
                                                </label>
                                                <label>
                                                    <form action="/manufacture-plan" method="post">
                                                        <td>
                                                            <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="삭제"/>
                                                            <input type="hidden" name="_method" value="DELETE" />
                                                            <input type="hidden" name="no" value="${manufacture.no}"/>
                                                        </td>
                                                    </form>
                                                </label>
                                                <label>
                                                    <form action="/manufacture-plan" method="get">
                                                        <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="목록">
                                                    </form>
                                                </label>
                                                </c:if>
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
                <!-- end container-fluid -->
            </div>
            <!-- end content -->
        </div>

    <!-- ============================================================== -->
    <!-- End Page content -->
    <!-- ============================================================== -->

</div>
<!-- END wrapper -->
</body>
</html>
