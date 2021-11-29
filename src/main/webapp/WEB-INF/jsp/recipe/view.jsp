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
                                <h4 class="page-title">레시피 상세 조회</h4>
                            </div>
                        </div>
                    </div>
                    <!-- end page title -->

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <div class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-1">
                                            <div class="dataTables_filter">
                                                <label style="font-size: 15pt">
                                                    <b>${recipe.name}</b>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-11">
                                            <div class="dataTables_filter">
                                                <label style="font-size: 15pt">
                                                    등록 일자: ${recipe.addDate}
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table id="datatable" class="table table-sm table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <colgroup>
                                        <col width="40%"/>
                                        <col width="30%"/>
                                        <col width="30%"/>
                                    </colgroup>
                                    <thead class="text-center">
                                    <tr>
                                        <th>원재료</th>
                                        <th>비율</th>
                                        <th>펌프 번호</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${recipe.mixList}" var="mix" varStatus="index">
                                        <tr>
                                            <td class="text-left">
                                                    ${mix.ingredientName}
                                            </td>
                                            <td class="text-right">
                                                    ${mix.ratio} %
                                            </td>
                                            <td class="text-center">
                                                    ${mix.pumpNo}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-12">
                                            <div class="dataTables_filter">
                                                <label>
                                                    <c:choose>
                                                    <c:when test="${recipe.usedCount eq 0}">
                                                    <form action="/recipe/${recipe.no}/form" method="get">
                                                        <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="수정">
                                                    </form>
                                                </label>
                                                <label>
                                                    <form action="/recipe" method="post">
                                                        <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="삭제">
                                                        <input type="hidden" name="_method" value="delete">
                                                        <input type="hidden" name="no" value="${recipe.no}">
                                                    </form>
                                                </label>
                                                <label>
                                                    <form action="/recipe" method="get">
                                                        <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="목록">
                                                    </form>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form action="/recipe" method="get">
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
