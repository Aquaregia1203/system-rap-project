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
    <title>레시피 목록 조회</title>
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
                                    <h4 class="page-title">레시피 목록</h4>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box table-responsive">
                                    <div class="dataTables_wrapper dt-bootstrap4 no-footer">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="dataTables_filter">
                                                    <label>
                                                        레시피 명:
                                                        <input id="keywordName" class="form-control form-control-sm" type="text"
                                                               placeholder="Search...">
                                                        <input id="search" class="btn btn-sm btn-secondary waves-effect width-xs" type="button" value="검색">
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="table"></div>
                                    <div id="datatable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
                                        <div class="row">
                                            <div class="col-sm-12 col-md-12">
                                                <div class="dataTables_filter">
                                                    <form action="/recipe/form" method="get">
                                                        <label>
                                                            <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="등록">
                                                        </label>
                                                    </form>
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


        <script type="text/javascript">
            $(document).ready(function (){
                drawTable();
                $("#search").click(function (){
                    $("#table").html("");
                    drawTable();
                });
            });
            function drawTable() {
                $.ajax({
                    url:'/recipe',
                    data:'name=' + $('#keywordName').val(),
                    type:'GET',
                    dataType:'json',
                    headers: { "Content-Type" : "application/json;charset=UTF-8" },
                    success:function (result){
                        console.log(result);
                        var script = "";
                        script += '<table id="datatable" class="table table-sm table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">';
                        script += '    <colgroup>';
                        script += '        <col width="10%"/>';
                        script += '        <col width="*"/>';
                        script += '        <col width="20%"/>';

                        script += '    </colgroup>';
                        script += '    <thead align="center">';
                        script += '    <tr>';
                        script += '        <th>번호</th>';
                        script += '       <th>레시피</th>';
                        script += '        <th>등록일자</th>';
                        script += '   </tr>';
                        script += '   </thead>';

                        script += '  <tbody>';

                        for (var i = 0; i < result.length; i++) {
                            script += '<tr>';
                            script += '    <td align="center">' + (i+1) + '</td>';
                            script += '   <td><a href="/recipe/' + result[i].no + '">' + result[i].name + '</a></td>';
                            script += '   <td align="center">' + result[i].addDate + '</td>';
                            script += '</tr>';
                        }
                        script += '</tbody>';
                        script += "</table>";
                        $("#table").html(script);
                    }
                });
            }
        </script>
</body>
</html>
