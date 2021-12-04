<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <jsp:include page="${pageContext.servletContext.contextPath}/head.jsp" />
</head>

<body data-layout="horizontal" style="font-family: 'Nanum Gothic',sans-serif">
<!-- Begin page -->
<div id="wrapper">
    <!-- Navigation Bar-->
    <jsp:include page="${pageContext.servletContext.contextPath}/WEB-INF/jsp/manager/top.jsp" />

    <div class="content-page">
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="page-title-box">
                            <ol class="breadcrumb m-0"></ol>
                            <div class="page-title-right">
                            </div>
                            <h4 style="font-family: 'Nanum Gothic',sans-serif">관리자 상세 정보</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                <thead class="text-center">
                                <tr>
                                    <th>구분</th>
                                    <th>아이디</th>
                                    <th style="width: 10%">이름</th>
                                    <th style="width: 20%">연락처</th>
                                    <th style="width: 20%">등록 일자</th>
                                    <th style="width: 10%">상태</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <c:choose>
                                        <c:when test="${manager.division eq 'S'}">
                                            <td class="text-center">시스템 관리자</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="text-center">생산 관리자</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${manager.id}</td>
                                    <td class="text-center">${manager.name}</td>
                                    <td class="text-center">${manager.contact}</td>
                                    <td class="text-center">${manager.addDate}</td>
                                    <c:choose>
                                        <c:when test="${manager.status eq 'Y'}">
                                            <td class="text-center">활성화</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="text-center">비활성화</td>
                                        </c:otherwise>
                                    </c:choose>
                                </tr>
                                </tbody>
                            </table>
                            <div class="col-sm-12 text-right">
                                <a href="${pageContext.servletContext.contextPath}/manager/${manager.id}/form" class="btn btn-primary waves-effect">수정</a>
                                <a href="${pageContext.servletContext.contextPath}/manager" class="btn btn-secondary waves-effect">목록</a>
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