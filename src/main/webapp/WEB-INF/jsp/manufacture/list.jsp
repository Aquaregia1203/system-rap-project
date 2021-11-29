<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="../head.jsp" />
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
                let status = "";

                console.log(result)
                var script = "";
                script +="<table border='2'>";
                script +="    <tr>";
                script +="        <th>번호</th>";
                script +="        <th>생산 일자</th>";
                script +="        <th>레시피</th>";
                script +="        <th>생산량</th>";
                script +="        <th>상태</th>";
                script +="        <th>등록 일자</th>";
                script +="    </tr>";

                for (var i = 0; i < result.length; i++) {
                    if (!result[i].manufactureDate) {
                        manufactureDate = "-";
                    }

                    if (result[i].status === "Y") {
                        status = "완료";
                    }

                    script += "<tr>";
                    script += "   <td>" + (i + 1) +"</td>";
                    script += "   <td>" + manufactureDate +"</td>";
                    script += "   <td><a href='/manufacture-plan/" + result[i].no + "'>" + result[i].recipeName + "</a></td>";
                    script += "   <td>" + result[i].output + "</td>";
                    script += "   <td>" + result[i].status + "</td>";
                    script += "   <td>" + result[i].addDate + "</td>";
                    script += "</tr>";
                }
                script += "</table>";
                $("#table").html(script);
            }
        });
    }
</script>

<body class="center-menu" data-layout="horizontal">
<div id="wrapper">
    <jsp:include page="../top.jsp" />
        <div class="content-page">

<h1>생산계획 목록</h1>
생산 일자 : 시작일 <input type="date" id="start" name="start"> ~
            종료일<input type="date" id = "end" name="end">

            <input type="button" id="search" value="검색" />
<div id="table"></div>
<table border="2">
    <tr>
        <td>
            <a href="/manufacture-plan/form">등록</a>
        </td>
        <c:forEach begin="1" end="9" varStatus="index">
            <td>
                <a href="/manufacture-plan?page=${index.count}&name=${param.get(name)}">${index.count}</a>
            </td>
        </c:forEach>
    </tr>
</table>
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
                let status = "";

                console.log(result)
                var script = "";
                script +="<table border='2'>";
                script +="    <tr>";
                script +="        <th>번호</th>";
                script +="        <th>생산 일자</th>";
                script +="        <th>레시피</th>";
                script +="        <th>생산량</th>";
                script +="        <th>상태</th>";
                script +="        <th>등록 일자</th>";
                script +="    </tr>";

                for (var i = 0; i < result.length; i++) {
                    if (!result[i].manufactureDate) {
                        manufactureDate = "-";
                    }

                    if (result[i].status === "Y") {
                        status = "완료";
                    }

                    script += "<tr>";
                    script += "   <td>" + (i + 1) +"</td>";
                    script += "   <td>" + manufactureDate +"</td>";
                    script += "   <td><a href='/manufacture-plan/" + result[i].no + "'>" + result[i].recipeName + "</a></td>";
                    script += "   <td>" + result[i].output + "</td>";
                    script += "   <td>" + result[i].status + "</td>";
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
