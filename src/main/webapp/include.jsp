<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>

<header id="topnav">
    <div class="navbar-custom">
        <div class="container-fluid">
            <ul class="list-unstyled topnav-menu float-right mb-0">
                <li class="dropdown d-none d-lg-block">
                    <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="align-middle">${sessionScope.name}</span>
                    </a>
                </li>

                <li class="dropdown d-none d-lg-block">
                    <a class="nav-link dropdown-toggle mr-0"  href="${pageContext.servletContext.contextPath}/logout" role="button" >
                        <input type="button" class="btn btn-xs btn-primary waves-effect width-xs waves-light" value="로그아웃">
                    </a>
                </li>
            </ul>
            <div class="logo-box">
                <a href="${pageContext.servletContext.contextPath}/manufacture-plan" class="logo text-center">
                    <span class="logo-lg">
                        <span class="logo-lg-text-light">레시피 기반 자동 배합 및 생산 관리 시스템</span>
                    </span>
                    <span class="logo-sm">
                    </span>
                </a>
            </div>

            <div class="clearfix"></div>
        </div>
    </div>

    <div class="topbar-menu">
        <div class="container-fluid">
            <div id="navigation">
                <!-- Navigation Menu-->
                <ul class="navigation-menu">
                    <li class="has-submenu">
                        <a href="${pageContext.servletContext.contextPath}/manufacture-plan">
                            <i class="mdi mdi-calendar-blank-multiple"></i>생산계획</a>
                    </li>
                    <li class="has-submenu">
                        <a href="${pageContext.servletContext.contextPath}/recipe">
                            <i class="mdi mdi-book-multiple"></i>레시피</a>
                    </li>
                    <li class="has-submenu">
                        <a href="${pageContext.servletContext.contextPath}/ingredient">
                            <i class="mdi mdi-layers"></i>원재료</a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</header>
