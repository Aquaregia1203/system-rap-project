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
    레시피 조회 화면

        <table border="2">
            <tr>
                <td>
                    ${recipe.name}
                </td>
                <td>
                   등록일자 : ${recipe.addDate}
                </td>
            </tr>
            <tr>
                <th>
                   원재료
                </th>
                <th>
                    비율
                </th>
                <th>
                    펌프번호
                </th>
            </tr>
            <c:forEach items="${recipe.mixList}" var="mix" varStatus="index">
                <tr>
                    <td>
                        ${mix.ingredientName}
                    </td>
                    <td>
                            ${mix.ratio} %
                    </td>
                    <td>
                            ${mix.pumpNo}
                    </td>
                </tr>
            </c:forEach>
            <form action="/recipe" METHOD="POST">
                <tr>
                    <c:if test="${recipe.usedCount eq 0}">
                        <td>
                            <a href="/recipe/${recipe.no}/form">수정</a>
                        </td>
                        <td>
                            <input type="submit" value="삭제" />
                        </td>
                    </c:if>
                    <td><a href="/recipe">목록</a></td>
                </tr>
                <input tpye="hidden" name="_method" value="DELETE" />
                <input tpye="hidden" name="no" value="${recipe.no}" />
            </form>
        </table>
    </div>
</div>
</body>
</html>
