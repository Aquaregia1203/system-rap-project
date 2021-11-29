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


                <div class="content">

                    <!-- Start Content-->
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">원재료 등록</h4>
                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card-box">
                                    <h4 class="header-title"></h4>

                                    <p class="sub-header">
                                        레시피에 사용할 원재료를 등록합니다. <br/>* 원재료는 다른 원재료와 중복하여 등록할 수 없습니다.
                                    </p>

                                    <div class="row">
                                        <div class="col-lg-10">
                                            <div class="form-group row">
                                                <label class="col-md-2 control-label">원재료 명</label>
                                                <div class="col-md-5">
                                                    <input type="text" class="form-control" >
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-10">
                                            <button type="submit" class="btn btn-purple waves-effect waves-light">등록</button>
                                            <button type="submit" class="btn btn-purple waves-effect waves-light">목록</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- ============================================================== -->
                        <!-- End Page content -->
                        <!-- ============================================================== -->
                    </div>
                </div>
            </div>
            <!-- END wrapper -->
        </div>







            <h2>원재료 등록입니다</h2>
            <hr>
            <form name="addForm" action="/ingredient" method="post">
                <table>
                    <tr>
                        <td>원재료 명 :</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                </table>
                <div style="color:red" id="errorName">
                    <c:if test="${!empty msg}">
                        ${msg}
                    </c:if>
                </div>
                <input type="button" onclick="auth()" value="등록">
            </form>
            <form action="/ingredient" method="get">
                <input type="submit" value="목록">
            </form>

    <script type="text/javascript">
        function auth(){
            var addForm = document.addForm;
            var name = addForm.name.value;
            const errorName = document.getElementById("errorName");

            if(!name) {
                errorName.innerHTML = '<div style="color:red">*원재료 이름을 입력하세요</div>'
            } else {
                addForm.submit();
            }
        }
    </script>
</body>
</html>
