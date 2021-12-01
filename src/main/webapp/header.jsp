<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="topnav">
    <!-- Topbar Start -->
    <div class="navbar-custom">
        <div class="container-fluid">
            <ul class="list-unstyled topnav-menu float-right mb-0">
                <li class="dropdown d-none d-lg-block">
                    <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                        <span class="align-middle"> ${sessionScope.id} | ${sessionScope.name}</span>
                    </a>
                </li>

                <li class="dropdown d-none d-lg-block">
                    <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="/logout" role="button" >
                        <input type="button" class="btn btn-xs btn-primary waves-effect width-xs waves-light" value="로그아웃" id="logoutButton">
                    </a>
                </li>
            </ul>
            <!-- LOGO -->
            <div class="logo-box">
                <a href="index.html" class="logo text-center">
                                    <span class="logo-lg">
                                        <!--img src="assets/images/logo.png" alt="" height="30">-->
                                        <span class="logo-lg-text-light">RAP-SYSTEM</span>
                                    </span>
                    <span class="logo-sm">
                                        <!-- <span class="logo-sm-text-dark">Z</span> -->
                                        <img src="${pageContext.servletContext.contextPath}/assets/images/logo-sm.png" alt="" height="22">
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
                        <a href="#"> <i class="mdi mdi-calendar-blank-multiple"></i>생산계획</a>
                    </li>
                    <li class="has-submenu">
                        <a href="#"> <i class="mdi mdi-book-multiple"></i>레시피</a>
                    </li>
                    <li class="has-submenu">
                        <a href="#"> <i class="mdi mdi-layers"></i>원재료</a>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</header>