<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>생산계획 목록</title>
</head>

<body>

<jsp:include page="../top.jsp" />

<h1>생산계획 목록</h1>
<form action="/manufacture-plan" method="get" >
생산 일자 : 시작일 <input type="date" name="start" > ~
            종료일<input type="date" name="end" >

            <input type="submit" value="검색" />
</form>
<table border="2">
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
