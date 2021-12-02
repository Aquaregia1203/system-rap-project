<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>RAP - System : 생산계획 상세 조회</title>
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
                            <div class="page-title-right">
                                <ol class="breadcrumb m-0"></ol>
                            </div>
                            <h4 class="page-title" style="font-family: 'Nanum Gothic',sans-serif">생산계획 상세 정보</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <div class="row text-right">
                                <div class="col-sm-12 col-md-12">
                                    <a href="${pageContext.servletContext.contextPath}/manufacture-plan/execution" class="btn btn-primary waves-effect">생산 시작</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 col-md-12"><br></div>
                            </div>
                            <table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                <thead class="text-center">
                                <tr>
                                    <th>레시피</th>
                                    <th>생산량</th>
                                    <th>생산 일자</th>
                                    <th>오차량</th>
                                    <th>생산자</th>
                                    <th>상태</th>
                                    <th>등록 일자</th>
                                </tr>
                                </thead>

                                <tbody>
                                    <tr>
                                        <td>${manufacture.recipeName}</td>
                                        <td class="text-right">${manufacture.output}kg</td>
                                        <c:choose>
                                            <c:when test="${empty manufacture.manufactureDate}">
                                                <td class="text-center">-</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="text-center">${manufacture.manufactureDate}</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${manufacture.errorAmount eq 0}">
                                                <td class="text-right">-</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="text-right">${manufacture.errorAmount}g</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td class="text-center">${manufacture.managerName}</td>
                                        <c:choose>
                                            <c:when test="${manufacture.status eq 'N'}">
                                                <td class="text-center">-</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td class="text-center">${manufacture.status}</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td class="text-center">${manufacture.addDate}</td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="col-sm-12 text-right">
                                <form action="${pageContext.servletContext.contextPath}/manufacture-plan" method="post">
                                    <c:if test="${manufacture.status eq 'N'}">
                                        <a href="${pageContext.servletContext.contextPath}/manufacture-plan/${manufacture.no}/form" class="btn btn-primary waves-effect">수정</a>
                                        <button type="submit" class="btn btn-primary waves-effect">삭제</button>
                                        <input type="hidden" name="_method" value="delete">
                                        <input type="hidden" name="no" value="${manufacture.no}">
                                    </c:if>
                                    <a href="${pageContext.servletContext.contextPath}/manufacture-plan" class="btn btn-secondary waves-effect">목록</a>
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
        <jsp:include page="${pageContext.servletContext.contextPath}/bottom.jsp" />
</body>
</html>