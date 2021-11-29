<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Responsive bootstrap 4 admin template" name="description" />
    <meta content="Coderthemes" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link rel="shortcut icon" href="/assets/images/favicon.ico">
    <link href="/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" id="bootstrap-stylesheet" />
    <link href="/assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/css/app.min.css" rel="stylesheet" type="text/css" id="app-stylesheet" />
    <link href="/assets/libs/datatables/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/fixedHeader.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/scroller.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/dataTables.colVis.css" rel="stylesheet" type="text/css" />
    <link href="/assets/libs/datatables/fixedcolumns.bootstrap4.min.css" rel="stylesheet" type="text/css" />
    <title>생산계획 목록 조회</title>
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
                            <h3 class="page-title">생산계획 목록</h3>
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
                                            <div class="form-group">생산 일자:
                                                <label>
                                                    <div>
                                                        <div class="input-daterange input-group" id="date-range">
                                                            <input type="text" class="form-control" name="start">
                                                            <div class="input-group-append">
                                                                <span class="input-group-text bg-secondary text-white b-0">to</span>
                                                            </div>
                                                            <input type="text" class="form-control" name="end">
                                                        </div>
                                                    </div>
                                                </label>
                                                <input id="search" class="btn btn-sm btn-secondary waves-effect width-xs" type="button" value="검색">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="table"></div>
                            <div class="dataTables_wrapper dt-bootstrap4 no-footer">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12">
                                        <div class="dataTables_filter">
                                            <form action="/manufacture-plan/form" method="get">
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
            url:'/manufacture-plan',
            data: {
                'start' : $('#start').val(),
                'end' : $('#end').val()
            },
            type: 'GET',
            dataType: 'json',
            headers: { "Content-Type" : "application/json;charset=UTF-8"},
            success:function (result){
                let manufactureDate = "";
                let status = "-";

                console.log(result)
                var script = "";
                script +='<table id="datatable" class="table table-sm table-striped table-bordered dt-responsive nowrap" style="border-collapse: collapse; border-spacing: 0; width: 100%;">';
                script +='   <colgroup>';
                script +='        <col width="10%"/>';
                script +='       <col width="*"/>';
                script +='       <col width="*"/>';
                script +='        <col width="10%"/>';
                script +='       <col width="10%"/>';
                script +='       <col width="*"/>';
                script +='    </colgroup>';
                script +='  <thead align="center">';
                script +='      <tr>';
                script +='          <th>번호</th>';
                script +='          <th>생산 일자</th>';
                script +='          <th>레시피</th>';
                script +='          <th>생산량</th>';
                script +='          <th>상태</th>';
                script +='          <th>등록 일자</th>';
                script +='      </tr>';
                script +='  </thead>';
                script +='  <tbody>';

                for (var i = 0; i < result.length; i++) {
                    if (!result[i].manufactureDate) {
                        manufactureDate = "-";
                    }

                    if (result[i].status === "Y") {
                        status = "완료";
                    }

                    script +='<tr>';
                    script +='  <td align="center">' + (result.length - i) + '</td>';
                    script +='  <td>' + manufactureDate +'</td>';
                    script +='  <td><a href="/manufacture-plan/' + result[i].no +'">' + result[i].recipeName + '</a></td>';
                    script +='  <td align="center">' + result[i].output + '</td>';
                    script +='  <td align="center">' + status + '</td>';
                    script +='  <td align="center">' + result[i].addDate + '</td>';
                    script +='</tr>';
                }
                script +=' </tbody>';
                script += "</table>";
                $("#table").html(script);
            }
        });
    }
</script>

<script src="/assets/libs/moment/moment.min.js"></script>
<script src="/assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="/assets/libs/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
<script src="/assets/libs/clockpicker/bootstrap-clockpicker.min.js"></script>
<script src="/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<script src="/assets/libs/bootstrap-daterangepicker/daterangepicker.js"></script>
<script src="/assets/js/pages/form-pickers.init.js"></script>
<script src="/assets/js/app.min.js"></script>

</body>
</html>
