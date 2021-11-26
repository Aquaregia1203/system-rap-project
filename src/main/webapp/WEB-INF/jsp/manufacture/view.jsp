<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<jsp:include page="../top.jsp" />
<body>
        <h2>생산계획 상세 정보</h2>
        <form action="/manufacture-plan/execution" method="get">
            <c:if test="${(applicationScope.status eq 'OFF' or applicationScope.status eq null)
                                and manufacture.status eq 'N'}">
                <input type="submit" value="생산 시작" />
            </c:if>
            <input type="hidden" name="recipeNo" value="${manufacture.recipeNo}" />
            <input type="hidden" name="output" value="${manufacture.output}" />
            <input type="hidden" name="no" value="${manufacture.no}" />
            <input type="hidden" name="status" value="${manufacture.status}" />
        </form>
        <table border="2">
            <tr>
                <th>
                    레시피
                </th>
                <th>
                    생산량
                </th>
                <th>
                    생산 일자
                </th>
                <th>
                    오차량
                </th>
                <th>
                    생산자
                </th>
                <th>
                    상태
                </th>
                <th>
                    등록 일자
                </th>
            </tr>
            <tr>
                <td>
                    ${manufacture.recipeName}
                </td>
                <td>
                    ${manufacture.output} kg
                </td>
                <td>
                    <c:choose>
                        <c:when test="${empty manufacture.manufactureDate}">
                             -
                        </c:when>
                        <c:otherwise>
                            ${manufacture.manufactureDate}
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${empty manufacture.errorAmount}">
                            -
                        </c:when>
                        <c:otherwise>
                            <fmt:formatNumber type="number" maxFractionDigits="3" value="${manufacture.errorAmount}" /> g
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    ${manufacture.managerName}
                </td>
                <td>
                    <c:choose>
                        <c:when test="${manufacture.status eq 'N'}">
                            -
                        </c:when>
                        <c:otherwise>
                            완료
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>
                    ${manufacture.addDate}
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <c:if test="${manufacture.status eq 'N'}">
                    <form action="/manufacture-plan/${manufacture.no}/form" method="GET">
                        <td>
                            <input type="submit" value="수정"/>
                            <input type="hidden" name="no" value="${manufacture.no}"/>
                        </td>
                    </form>
                    <form action="/manufacture-plan" method="post">
                        <td>
                            <input type="submit" value="삭제"/>
                            <input type="hidden" name="_method" value="DELETE" />
                            <input type="hidden" name="no" value="${manufacture.no}"/>
                        </td>
                    </form>
                </c:if>
                <td>
                    <a href="/manufacture-plan">목록</a>
                </td>
            </tr>
        </table>
</body>
</html>
