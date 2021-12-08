<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
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
                                <label>생산 일자 :</label>
                                <label>
                                    <input class="form-control form-control-sm" type="date" name="start" id="start">
                                </label>
                                <label>
                                    ~
                                </label>
                                <label>
                                    <input class="form-control form-control-sm" type="date" name="end" id="end">
                                </label>
                                <label>
                                    <button id="search" class="btn btn-sm btn-secondary waves-effect">검색</button>
                                </label>
                            </div>
                            <h4 style="font-family: 'Nanum Gothic',sans-serif">생산계획</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <div id="table"></div>
                            <div class="row">
                                <div class="col-sm-12 col-md-1">
                                </div>
                                <div class="col-sm-12 col-md-10" id="pageBox">
                                </div>
                                <div class="col-sm-12 col-md-1 text-right">
                                    <a href="${pageContext.servletContext.contextPath}/manufacture-plan/form" class="btn btn-primary waves-effect">등록</a>
                                </div>
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
    </div>
</div>
<script type="text/javascript">
    var page = 1;
    var url = "/manufacture-plan";

    function navigatePage(id) {
        let buttonNo = $("#" + id).val();

        if (id == "pageButton0") {
            page = Number(page) - 1;
        } else if (id == "pageButton6") {
            page = Number(page) + 1;
        } else {
            page = buttonNo;
        }

        drawTable();
    }

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
                'end' : $('#end').val(),
                'url' : url,
                'page' : page
            },
            type: 'GET',
            dataType: 'json',
            headers: { "Content-Type" : "application/json;charset=UTF-8"},
            success:function (result){
                let date, status;
                let manufactureList = result["manufactureList"];
                let pageTag = result["tag"];

                var script = "";
                script +='<table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">';
                script +='  <thead class="text-center">';
                script +='      <tr>';
                script +='          <th style="width: 5%">번호</th>';
                script +='          <th style="width: 20%">등록 일자</th>';
                script +='          <th style="width: 20%">생산 일자</th>';
                script +='          <th>레시피</th>';
                script +='          <th style="width: 10%">생산량</th>';
                script +='          <th style="width: 10%">상태</th>';
                script +='      </tr>';
                script +='  </thead>';
                script +='  <tbody>';

                for (var i = 0; i < manufactureList.length; i++) {
                    if (manufactureList[i].manufactureDate) {
                        date = manufactureList[i].manufactureDate;
                    } else {
                        date = "-";
                    }

                    if (manufactureList[i].status === "Y") {
                        status = "<i class='mdi mdi-check-circle' style='color: limegreen'></i>";
                    } else {
                        status = "<i class='mdi mdi-minus'></i>";
                    }

                    script +='<tr>';
                    script +='  <td class="text-center">' + ((i + 1) + (10 * (page - 1))) + '</td>';
                    script +='  <td class="text-center">' + manufactureList[i].addDate + '</td>';
                    script +='  <td class="text-center">' + date +'</td>';
                    script +='  <td><a href="${pageContext.servletContext.contextPath}/manufacture-plan/' + manufactureList[i].no +'">' + manufactureList[i].recipeName + '</a></td>';
                    script +='  <td class="text-right">' + manufactureList[i].output + 'kg</td>';
                    script +='  <td class="text-center">' + status + '</td>';
                    script +='</tr>';
                }

                script +=' </tbody>';
                script += "</table>";
                $("#table").html(script);
                $("#pageBox").html(pageTag);
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