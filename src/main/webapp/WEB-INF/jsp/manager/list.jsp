<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>RAP - System : 관리자 목록</title>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp"/>
</head>

<body data-layout="horizontal" style="font-family: 'Nanum Gothic',sans-serif">
<!-- Begin page -->
<div id="wrapper">
    <!-- Navigation Bar-->
    <jsp:include page="${pageContext.servletContext.contextPath}/WEB-INF/jsp/manager/top.jsp"/>

    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb m-0"></ol>
                            <div class="page-title-right">
                                <label>
                                    <div class="form-group form-inline">
                                        관리자 명:
                                        <input id="keywordName" class="form-control" type="text" placeholder="Search...">
                                        <button id="search" class="btn btn-primary waves-effect">검색</button>
                                    </div>
                                </label>
                            </div>
                            <h4 class="page-title" style="font-family: 'Nanum Gothic',sans-serif">관리자</h4>
                        </div>
                    </div>
                </div>
<%--                <div class="row">--%>
<%--                    <div class="col-sm-12 text-right">--%>
<%--                        <label>--%>
<%--                            <div class="form-group form-inline">--%>
<%--                                관리자 명:--%>
<%--                                <input id="keywordName" class="form-control" type="text" placeholder="Search...">--%>
<%--                                <button id="search" class="btn btn-primary waves-effect">검색</button>--%>
<%--                            </div>--%>
<%--                        </label>--%>
<%--                    </div>--%>
<%--                </div>--%>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <div id="table">
                                <table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <thead class="text-center">
                                    <tr>
                                        <th>번호</th>
                                        <th>구분</th>
                                        <th>아이디</th>
                                        <th>이름</th>
                                        <th>연락처</th>
                                        <th>등록일자</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <c:forEach items="${managerList}" var="manager" varStatus="index">
                                        <tr>
                                            <td>${index.count}</td>
                                            <c:choose>
                                                <c:when test="${manager.division eq 'S'}">
                                                    <td>시스템 관리자</td>
                                                </c:when>
                                                <c:otherwise>
                                                    <td>생산 관리자</td>
                                                </c:otherwise>
                                            </c:choose>
                                            <td><a href="${pageContext.servletContext.contextPath}/manager/${manager.id}">${manager.id}</a></td>
                                            <td>${manager.name}</td>
                                            <td>${manager.contact}</td>
                                            <td>${manager.addDate}</td>
                                        </tr>
                                    </c:forEach>
<%--                                    <tr>--%>
<%--                                        <td class="text-center">1</td>--%>
<%--                                        <td>오리엔탈 소스</td>--%>
<%--                                        <td class="text-center">2021-11-22</td>--%>
<%--                                    </tr>--%>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-12 col-md-6"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12 text-right">
                                <a href="${pageContext.servletContext.contextPath}/manager/form"><button class="btn btn-primary waves-effect">등록</button></a>
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
                    url:'${pageContext.servletContext.contextPath}/manager',
                    data:'name=' + $('#keywordName').val(),
                    type:'GET',
                    dataType:'json',
                    headers: { "Content-Type" : "application/json;charset=UTF-8" },
                    success:function (result){
                        let divisions = "";
                        let status = "";

                        console.log(result)
                        var script = "";
                        script += '<table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">';
                        script += '<thead class="text-center">';
                        script += '<tr>';
                        script += '    <th>번호</th>';
                        script += '    <th>구분</th>';
                        script += '    <th>아이디</th>';
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
                            script += '    <td class="text-center">' + (i + 1) + '</td>';
                            script += '    <td>' + divisions + '</td>';
                            script += '    <td><a href="${pageContext.servletContext.contextPath}/manager/' + result[i].id +'">' + result[i].id + '</a></td>';
                            script += '    <td class="text-center">' + result[i].name + '</td>';
                            script += '    <td class="text-center">' + result[i].contact + '</td>';
                            script += '    <td class="text-center">' + result[i].addDate + '</td>';
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
        <jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp" />
</body>
</html>
