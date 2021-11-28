<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title>생산계획 목록</title>
</head>

<body>
<script type="text/javascript">
    $(document).ready(function (){
        $("#search").click(function (){
            $("#table").html("");
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
                    $("#allTable").remove();
                }
            });
        });
    });
</script>
<jsp:include page="../top.jsp" />

<h1>생산계획 목록</h1>
생산 일자 : 시작일 <input type="date" id="start" name="start"> ~
            종료일<input type="date" id = "end" name="end">

            <input type="button" id="search" value="검색" />
<div id="table"></div>
<table border="2" id="allTable">
    <tr>
        <th>
            번호
        </th>
        <th>
            생산 일자
        </th>
        <th>
            레시피
        </th>
        <th>
            생산량
        </th>
        <th>
            상태
        </th>
        <th>
            등록 일자
        </th>
    </tr>
    <c:forEach items="${manufactureList}" var="manufacture"
               begin="${start}" end="${end}" varStatus="index">
        <tr>
            <td>${manufactureList.size() - index.index}</td>
            <!-- 생산일자 없을 때는 '-'로 표기 -->
                <c:choose>
                    <c:when test="${empty manufacture.manufactureDate}">
                        <td> - </td>
                    </c:when>
                    <c:otherwise>
                        <td>${manufacture.manufactureDate}</td>
                    </c:otherwise>
                </c:choose>

            <td><a href="/manufacture-plan/${manufacture.no}">${manufacture.recipeName}</a></td>
            <td>${manufacture.output} kg</td>

                <c:if test="${manufacture.status eq 'Y'}">
                    <th>완료</th>
                </c:if>
                <c:if test="${manufacture.status  eq 'N'}">
                    <td> - </td>
                </c:if>
            <td>${manufacture.addDate}</td>
        </tr>
    </c:forEach>
    <tr>
        <td>
            <a href="/manufacture-plan/form">등록</a>
        </td>
    </tr>
</table>
<table border="2">
    <tr>
        <c:forEach begin="1" end="9" varStatus="index">
            <td>
                <a href="/manufacture-plan?page=${index.count}&name=${param.get(name)}">${index.count}</a>
            </td>
        </c:forEach>
    </tr>
</table>
</body>
</html>
