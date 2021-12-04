<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                            </div>
                            <h4 style="font-family: 'Nanum Gothic',sans-serif">레시피 상세 정보</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <div class="row">
                                <div class="col-sm-12 col-md-9">
                                    <div style="font-size: 20pt; font-weight: bold">${recipe.name}</div>
                                </div>
                                <div class="col-sm-12 col-md-3 text-right">
                                    <div style="font-size: 20pt; font-weight: bold">등록일자:${recipe.addDate}</div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-12"><br></div>
                            </div>
                            <table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                <thead class="text-center">
                                <tr>
                                    <th>원재료 명</th>
                                    <th>비율</th>
                                    <th>펌프 번호</th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach items="${recipe.mixList}" var="mix">
                                    <tr>
                                        <td>${mix.ingredientName}</td>
                                        <td class="text-right">
                                            <fmt:formatNumber type="percent" minIntegerDigits="0" value="${mix.ratio * 0.01}"/>
                                        </td>
                                        <td class="text-center">${mix.pumpNo}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <div class="col-sm-12 text-right">
                                <form action="${pageContext.servletContext.contextPath}/recipe" method="post">
                                    <c:if test="${recipe.usedCount eq 0}">
                                        <a href="${pageContext.servletContext.contextPath}/recipe/${recipe.no}/form" class="btn btn-primary waves-effect">수정</a>
                                        <button type="submit" class="btn btn-primary waves-effect">삭제</button>
                                        <input type="hidden" name="_method" value="delete">
                                        <input type="hidden" name="no" value="${recipe.no}">
                                    </c:if>
                                    <a href="${pageContext.servletContext.contextPath}/recipe" class="btn btn-secondary waves-effect">목록</a>
                                </form>
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
    </div>
</div>

<jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp" />
</body>
</html>