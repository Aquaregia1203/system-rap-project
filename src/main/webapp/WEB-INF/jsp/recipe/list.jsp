<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>레시피 목록</title>
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
            url:'/recipe',
            data:'name=' + $('#keywordName').val(),
            type:'GET',
            dataType:'json',
            headers: { "Content-Type" : "application/json;charset=UTF-8" },
            success:function (result){
                console.log(result);
                var script = "";
                script += "<table border='1'>";
                script += "    <tr>";
                script += "        <th>번호</th>";
                script += "        <th>레시피</th>";
                script += "        <th>등록일자</th>";
                script += "    </tr>";

                for (var i = 0; i < result.length; i++) {
                    script += "<tr>";
                    script += "   <td>" + (i + 1) +"</td>";
                    script += "   <td><a href='/recipe/" + result[i].no + "'>" + result[i].name + "</a></td>";
                    script += "   <td>" + result[i].addDate + "</td>";
                    script += "</tr>";
                }
                script += "</table>";
                $("#table").html(script);
            }
        });
    }
</script>
<jsp:include page="../top.jsp" />
        <h1>레시피 목록</h1>
        레시피 명 : <input type="text" id="keywordName">
        <input type="button" id="search" value="검색">
        <hr>
        <div id="table"></div>
        <table border="2">
            <tr>
                <c:forEach begin="1" end="9" varStatus="index">
                    <td>
                        <a href="/recipe?page=${index.count}&name=${param.get(name)}">${index.count}</a>
                    </td>
                </c:forEach>
            </tr>
        </table>
    </body>
</html>
