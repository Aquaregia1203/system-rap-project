<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <header id="topnav">
        <div class="navbar-custom">
            <div class="container-fluid">
                <ul class="list-unstyled topnav-menu float-right mb-0">


                    <!-- 우측 상단 메뉴. 로그아웃 버튼과 로그인 계정 및 이름이 들어가야함-->
                    <li class="dropdown d-none d-lg-block">
                        <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="" role="button" aria-haspopup="false" aria-expanded="false">
                            <span class="align-middle"> ${sessionScope.id} | ${sessionScope.name}</span>
                        </a>

                    </li>
                    <li class="dropdown d-none d-lg-block">
                        <a class="nav-link dropdown-toggle mr-0" data-toggle="dropdown" href="/logout" role="button" aria-haspopup="false" aria-expanded="false">
                            <input type="button" class="btn btn-info waves-effect width-md waves-light btn-lg" value="로그아웃" id="logoutButton">

                        </a>
                    </li>
                </ul>

                <!-- LOGO -->
                <div class="logo-box">
                    <a href="/manufacture-plan" class="logo text-center">
                                    <span class="logo-lg">
                                        <span class="logo-lg-text-light">RAP - System</span>
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
                            <a href="/ingredient">
                                <i class="mdi mdi-layers"></i>원재료
                            </a>
                        </li>

                        <li class="has-submenu">
                            <a href="/recipe">
                                <i class="mdi mdi-book-multiple"></i>레시피
                            </a>
                        </li>

                        <li class="has-submenu">
                            <a href="/manufacture-plan"> <i class="mdi mdi-comment-text"></i>생산계획
                            </a>
                        </li>
                    </ul>
                    <!-- End navigation menu -->

                    <div class="clearfix"></div>
                </div>
                <!-- end #navigation -->
            </div>
            <!-- end container -->
        </div>
    </header>

