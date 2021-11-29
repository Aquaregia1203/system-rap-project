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

            <h2>조회 화면입니다.</h2>
            <hr>
            <table border="1">
                <tr>
                    <td>이름</td>
                    <td>등록 일자</td>
                    <td>사용 여부</td>
                </tr>
                <tr>
                    <td>${ingredient.name}</td>
                    <td>${ingredient.addDate}</td>
                    <c:if test="${ingredient.usedCount gt 0}">
                        <td>사용</td>
                    </c:if>
                    <c:if test="${ingredient.usedCount eq 0}">
                        <td>미사용</td>
                    </c:if>
                </tr>
            </table>
            <c:choose>
                <c:when test="${ingredient.usedCount eq 0}">
                    <form action="/ingredient/${ingredient.no}/form" method="get">
                        <input type="submit" value="수정">
                    </form>
                    <form action="/ingredient" method="post">
                        <input type="submit" value="삭제">
                        <input type="hidden" name="_method" value="delete">
                        <input type="hidden" name="no" value="${ingredient.no}">
                    </form>
                    <form action="/ingredient" method="get">
                        <input type="submit" value="목록">
                    </form>
                </c:when>
                <c:otherwise>
                    <form action="/ingredient" method="get">
                        <input type="submit" value="목록">
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
