<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>관리자 목록</title>
    <jsp:include page="../head.jsp" />
</head>
<body class="center-menu" data-layout="horizontal">
<div id="wrapper">
    <jsp:include page="top.jsp" />
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
                            <h4 class="page-title" style="font-family:'나눔스퀘어 Bold'">관리자 목록</h4>
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
                            <div id="table">
                                <table class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                    <colgroup>
                                        <col width="10%"/>
                                        <col width="*"/>
                                        <col width="*"/>
                                        <col width="10%"/>
                                        <col width="*"/>
                                        <col width="*"/>
                                    </colgroup>
                                    <thead class="text-center" style="font-family:'나눔스퀘어_ac'">
                                        <tr>
                                            <th>번호</th>
                                            <th>구분</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>연락처</th>
                                            <th>등록 일자</th>
                                        </tr>
                                    </thead>
                                    <tbody style="font-family:'나눔스퀘어_ac'">
                                        <c:forEach items="${managerList}" var="manager" varStatus="index">
                                            <tr>
                                                <c:if test="${page < }}">
                                                    <td class="text-center">${index.count}</td>
                                                </c:if>
                                                <c:choose>
                                                    <c:when test="${manager.division eq 'S'}">
                                                        <td>시스템 관리자</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>생산 관리자</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td><a href="/admin/${manager.id}">${manager.id}</a></td>
                                                <td class="text-center">${manager.name}</td>
                                                <td class="text-center">${manager.contact}</td>
                                                <td class="text-center">${manager.addDate}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
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
                                    <div class="col-sm-12 col-md-12">
                                        <div class="dataTables_filter text-center">
                                            <label>
                                                <div class="btn-group mb-2">
                                                    <ul>
                                                        <li>
                                                            <a href='<c:url value="/admin?page=${page-1 }"/>'><i class="fa fa-chevron-left"></i></a>
                                                        </li>
                                                        <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
                                                            <li>
                                                                <a href='<c:url value="/admin?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
                                                            </li>
                                                        </c:forEach>
                                                        <li>
                                                            <a href='<c:url value="/admin?page=${page+1 }"/>'><i class="fa fa-chevron-right"></i></a>
                                                        </li>
                                                    </ul>
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
                    script += '<table class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed" style="border-collapse: collapse; border-spacing: 0; width: 100%;" role="grid" aria-describedby="datatable_Info">';
                    script += '<colgroup>';
                    script += '    <col width="10%"/>';
                    script += '    <col width="*"/>';
                    script += '    <col width="*"/>';
                    script += '    <col width="10%"/>';
                    script += '    <col width="*"/>';
                    script += '    <col width="*"/>';
                    script += '</colgroup>';
                    script += '<thead class="text-center" style="font-family: 나눔명조,sans-serif">';
                    script += '<tr>';
                    script += '    <th>번호</th>';
                    script += '    <th>구분</th>';
                    script += '     <th>아이디</th>';
                    script += '    <th>이름</th>';
                    script += '    <th>연락처</th>';
                    script += '    <th>등록 일자</th>';
                    script += '</tr>';
                    script += '</thead>';
                    script += '<tbody style="font-family: 나눔명조, sans-serif">';

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
                        script += '    <td><a href="/admin/' + result[i].id +'">' + result[i].id + '</a></td>';
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
</body>
</html>
