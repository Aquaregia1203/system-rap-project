<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <jsp:include page="../head.jsp" />
</head>
<body class="center-menu" data-layout="horizontal">
    <div id="wrapper">
    <jsp:include page="../top.jsp" />
        <div class="content-page">



            <h2>원재료 목록</h2>
            원재료 명: <input type="text" id="keywordName">
            <input type="button" id="search" value="검색">
            <hr>
            <div id="table"></div>
            <table border="1">
                <c:forEach begin="1" end="9" varStatus="index">
                    <td>
                        <a href="/ingredient?page=${index.count}&name=${param.get(name)}">${index.count}</a>
                    </td>
                </c:forEach>
            </table>
            <form action="/ingredient/form" method="get">
                <input type="submit" value="등록">
            </form>
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
                url: '/ingredient',
                data: 'name=' + $('#keywordName').val(),
                type: 'GET',
                dataType: 'json',
                headers: {"Content-Type": "application/json;charset=UTF-8"},
                success: function (result) {
                    console.log(result)
                    var script = "";
                    script += "<table border='1'><tr><th>번호</th><th>원재료</th><th>등록일자</th></tr>"

                    for (var i = 0; i < result.length; i++) {
                        script += "<tr>";
                        script += "   <td>" + (i + 1) + "</td>";
                        script += "   <td><a href='/ingredient/" + result[i].no + "'>" + result[i].name + "</a></td>";
                        script += "   <td>" + result[i].addDate + "</td>";
                        script += "</tr>";
                    }
                    script += "</table>";
                    $("#table").html(script);
                }
            });
        }
    </script>
</body>
</html>
