<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>RAP - System : 원재료 상세 조회</title>
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
                            <h4 class="page-title" style="font-family: 'Nanum Gothic',sans-serif">원재료 상세 정보</h4>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <table class="table table-striped table-bordered dt-responsive" style="border-collapse: collapse; border-spacing: 0; width: 100%;">
                                <thead class="text-center">
                                <tr>
                                    <th>원재료 명</th>
                                    <th>등록 일자</th>
                                    <th>사용 여부</th>
                                </tr>
                                </thead>

                                <tbody>
                                <tr>
                                    <td class="text-center">${ingredient.name}</td>
                                    <td class="text-center">${ingredient.addDate}</td>
                                    <td class="text-center">
                                        <c:choose>
                                            <c:when test="${ingredient.usedCount eq 0}">
                                                미사용
                                            </c:when>
                                            <c:otherwise>
                                                사용
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <div class="col-sm-12 text-right">
                                <form action="${pageContext.servletContext.contextPath}/ingredient" method="post">
                                    <c:if test="${ingredient.usedCount eq 0}">
                                        <a href="${pageContext.servletContext.contextPath}/ingredient/${ingredient.no}/form" class="btn btn-primary waves-effect">수정</a>
                                        <button type="submit" class="btn btn-primary waves-effect">삭제</button>
                                        <input type="hidden" name="_method" value="delete">
                                        <input type="hidden" name="no" value="${ingredient.no}">
                                    </c:if>
                                    <a href="${pageContext.servletContext.contextPath}/ingredient" class="btn btn-primary waves-effect">목록</a>
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