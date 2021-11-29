<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../head.jsp" />
    <link rel="shortcut icon" href="#">
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0">
                                </ol>
                            </div>
                            <h4 class="page-title">관리자 목록</h4>
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
                                                관리자 명:
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
                                            <form action="/admin/form" method="get">
                                                <label>
                                                    <input class="btn btn-sm btn-secondary waves-effect width-xs" type="submit" value="등록">
                                                </label>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12 col-md-6">
                                        <div class="dataTables_filter">
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
                url:'/admin',
                data:'name=' + $('#keywordName').val(),
                type:'GET',
                dataType:'json',
                headers: { "Content-Type" : "application/json;charset=UTF-8" },
                success:function (result){
                    let divisions = "";
                    let status = "";

                    console.log(result)
                    var script = "";
                    script += '<table class="table table-sm table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" style="border-collapse: collapse; border-spacing: 0; width: 100%;" role="grid" aria-describedby="datatable_Info">';
                    script += '<colgroup>';
                    script += '    <col width="10%"/>';
                    script += '    <col width="*"/>';
                    script += '    <col width="*"/>';
                    script += '    <col width="10%"/>';
                    script += '    <col width="*"/>';
                    script += '    <col width="*"/>';
                    script += '</colgroup>';
                    script += '<thead align="center" >';
                    script += '<tr>';
                    script += '    <th>번호</th>';
                    script += '    <th>구분</th>';
                    script += '     <th>아이디</th>';
                    script += '    <th>이름</th>';
                    script += '    <th>연락처</th>';
                    script += '    <th>등록 일자</th>';
                    script += '</tr>';
                    script += '</thead>';
                    script += '<tbody>';

                    for (var i = 0; i < result.length; i++) {
                        if (result[i].division === "S") {
                            divisions = "시스템 관리자";
                        } else  {
                            divisions = "생산 관리자";
                        }

                        if (result[i].status === "Y") {
                            status = "활성";
                        } else  {
                            status = "비활성";
                        }

                        script += '<tr>';
                        script += '    <td align="center">' + (i + 1) + '</td>';
                        script += '    <td>' + divisions + '</td>';
                        script += '    <td><a href="/admin/' + result[i].id +'">' + result[i].id + '</a></td>';
                        script += '    <td align="center">' + result[i].name + '</td>';
                        script += '    <td align="center">' + result[i].contact + '</td>';
                        script += '    <td align="center">' + result[i].addDate + '</td>';
                        script += '</tr>';
                    }
                    script += '</tbody>';
                    script += "</table>";
                    $("#table").html(script);
                    $("#allTable").remove();
                }
            });
        }
    </script>
</body>
</html>
