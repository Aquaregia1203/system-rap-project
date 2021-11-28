<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>Title</title>
</head>
<body>
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
                    script += "<table border='1'>";
                    script += "    <tr>";
                    script += "        <th>번호</th>";
                    script += "        <th>구분</th>";
                    script += "        <th>아이디</th>";
                    script += "        <th>이름</th>";
                    script += "        <th>연락처</th>";
                    script += "        <th>등록 일자</th>";
                    script += "        <th>상태</th>";
                    script += "    </tr>";

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

                        script += "<tr>";
                        script += "   <td>" + (i + 1) +"</td>";
                        script += "   <td>" + divisions +"</td>";
                        script += "   <td><a href='/admin/" + result[i].id + "'>" + result[i].id + "</a></td>";
                        script += "   <td>" + result[i].name + "</td>";
                        script += "   <td>" + result[i].contact + "</td>";
                        script += "   <td>" + result[i].addDate + "</td>";
                        script += "   <td>" + status + "</td>";
                        script += "</tr>";
                    }
                    script += "</table>";
                    $("#table").html(script);
                    $("#allTable").remove();
                }
            });
        }
    </script>
<jsp:include page="top.jsp" />
    <h2>관리자 목록을 나열합니다.</h2>
    관리자 명: <input type="text" id="keywordName">
    <input type="button" id="search" value="검색">
    <hr>
    <div id="table"></div>
    <table border="1">
        <tr>
            <c:forEach begin="1" end="9" varStatus="index">
                <td>
                    <a href="/admin?page=${index.count}&name=${parm}">${index.count}</a>
                </td>
            </c:forEach>
        </tr>
    </table>
    <form action="/admin/form" method="get">
        <input type="submit" value="등록">
    </form>
</body>
</html>
