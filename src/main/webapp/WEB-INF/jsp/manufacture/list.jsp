<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>RAP - System : 생산계획 목록</title>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp" />
</head>

<body data-layout="horizontal" style="font-family: 'Nanum Gothic',sans-serif">
<!-- Begin page -->
<div id="wrapper">
    <!-- Navigation Bar-->
    <jsp:include page="${pageContext.servletContext.contextPath}/include.jsp" />

    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb m-0">
                            </ol>
                            <div class="page-title-right">
                                <label>
                                    <div class="form-group form-inline">
                                        생산 일자:
                                        <div>
                                            <div class="input-daterange input-group">
                                                <input type="date" class="form-control" name="start" id="start"/>
                                                <div class="input-group-append">
                                                    <span class="input-group-text bg-primary text-white b-0">to</span>
                                                </div>

                                                <input type="date" class="form-control" name="end" id="end"/>
                                            </div>
                                        </div>
                                        <button id="search" class="btn btn-primary waves-effect">검색</button>
                                    </div>
                                </label>
                            </div>
                            <h4 class="page-title" style="font-family: 'Nanum Gothic',sans-serif">생산계획</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <div id="table">
                                <table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead class="text-center">
                                    <tr>
                                        <th>번호</th>
                                        <th>생산 일자</th>
                                        <th>레시피</th>
                                        <th>생산량</th>
                                        <th>상태</th>
                                        <th>등록 일자</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td class="text-center">2021-12-01 17:02:25</td>
                                        <td>오리엔탈 소스</td>
                                        <td class="text-right">100kg</td>
                                        <td class="text-center">완료</td>
                                        <td class="text-center">2021-11-22</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="col-sm-12 text-right">
                                <a href="${pageContext.servletContext.contextPath}/manufacture-plan/form" class="btn btn-primary waves-effect">등록</a>
                            </div>
                        </div>
                    </div>
                </div>
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12">
                                Recipe-based automatic formulation and production management System
                            </div>
                        </div>
                    </div>
                </footer>
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
                url:'${pageContext.servletContext.contextPath}/manufacture-plan',
                data: {
                    'start' : $('#start').val(),
                    'end' : $('#end').val()
                },
                type: 'GET',
                dataType: 'json',
                headers: { "Content-Type" : "application/json;charset=UTF-8"},
                success:function (result){
                    let date, status;

                    console.log(result)
                    var script = "";
                    script +='<table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">';
                    script +='  <thead class="text-center">';
                    script +='      <tr>';
                    script +='          <th style="width: 5%">번호</th>';
                    script +='          <th>생산 일자</th>';
                    script +='          <th>레시피</th>';
                    script +='          <th style="width: 10%">생산량</th>';
                    script +='          <th style="width: 10%">상태</th>';
                    script +='          <th style="width: 20%">등록 일자</th>';
                    script +='      </tr>';
                    script +='  </thead>';
                    script +='  <tbody>';

                    for (var i = 0; i < result.length; i++) {
                        if (result[i].manufactureDate) {
                            date = result[i].manufactureDate;
                        } else {
                            date = "-";
                        }

                        if (result[i].status === "Y") {
                            status = "완료";
                        } else {
                            status = "-";
                        }

                        script +='<tr>';
                        script +='  <td class="text-center">' + (result.length - i) + '</td>';
                        script +='  <td class="text-center">' + date +'</td>';
                        script +='  <td><a href="${pageContext.servletContext.contextPath}/manufacture-plan/' + result[i].no +'">' + result[i].recipeName + '</a></td>';
                        script +='  <td class="text-right">' + result[i].output + 'kg</td>';
                        script +='  <td class="text-center">' + status + '</td>';
                        script +='  <td class="text-center">' + result[i].addDate + '</td>';
                        script +='</tr>';
                    }
                    script +=' </tbody>';
                    script += "</table>";
                    $("#table").html(script);
                }
            });
        }
    </script>
        <jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp" />
        <script src="${pageContext.servletContext.contextPath}/assets/libs/moment/moment.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/assets/libs/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/assets/libs/clockpicker/bootstrap-clockpicker.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/assets/libs/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
        <script src="${pageContext.servletContext.contextPath}/assets/libs/bootstrap-daterangepicker/daterangepicker.js"></script>

        <!-- Init js-->
        <script src="${pageContext.servletContext.contextPath}/assets/js/pages/form-pickers.init.js"></script>
</body>
</html>