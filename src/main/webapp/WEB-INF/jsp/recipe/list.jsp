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
                            <ol class="breadcrumb m-0"></ol>
                            <div class="page-title-right">
                                <label>
                                    레시피 명 :
                                </label>

                                <label>
                                    <input class="form-control form-control-sm" type="text" placeholder="Search..." id="keywordName">
                                </label>

                                <label>
                                    <button id="search" class="btn btn-sm btn-secondary waves-effect">검색</button>
                                </label>
                            </div>
                            <h4 style="font-family: 'Nanum Gothic',sans-serif">레시피</h4>
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
                                        <th>레시피</th>
                                        <th>등록 일자</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    <tr>
                                        <td class="text-center">1</td>
                                        <td>오리엔탈 소스</td>
                                        <td class="text-center">2021-11-22</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-7" id="pageBox">
                                </div>
                            </div>
                            <div class="col-sm-12 text-right">
                                <a href="${pageContext.servletContext.contextPath}/recipe/form"><button class="btn btn-primary waves-effect">등록</button></a>
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
        var page = 1;
        var url = "/recipe";

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
                url:'${pageContext.servletContext.contextPath}/recipe',
                data:{
                    'name' : $('#keywordName').val(),
                    'page' : page,
                    'url' : url
                },
                type:'GET',
                dataType:'json',
                headers: { "Content-Type" : "application/json;charset=UTF-8" },
                success:function (result){
                    let recipeList = result["recipeList"];
                    let pageTag = result["tag"];

                    var script = "";
                    script += '<table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">';
                    script += '    <thead class="text-center">';
                    script += '        <tr>';
                    script += '            <th style="width: 5%">번호</th>';
                    script += '            <th>레시피</th>';
                    script += '            <th style="width: 20%">등록일자</th>';
                    script += '        </tr>';
                    script += '   </thead>';

                    script += '  <tbody>';

                    for (var i = 0; i < recipeList.length; i++) {
                        script += '<tr>';
                        script += '    <td class="text-center">' + ((i + 1) + (10 * (page - 1))) + '</td>';
                        script += '   <td><a href="${pageContext.servletContext.contextPath}/recipe/' + recipeList[i].no + '">' + recipeList[i].name + '</a></td>';
                        script += '   <td class="text-center">' + recipeList[i].addDate + '</td>';
                        script += '</tr>';
                    }

                    script += '</tbody>';
                    script += "</table>";
                    $("#table").html(script);
                    $("#pageBox").html(pageTag);
                }
            });
        }
    </script>
    <jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp" />
</body>
</html>
