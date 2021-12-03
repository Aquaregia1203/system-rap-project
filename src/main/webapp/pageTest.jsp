<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>

<html>
<head>
    <title>Title</title>
    <jsp:include page="head.jsp" />
</head>
<body data-layout="horizontal" style="font-family: 'Nanum Gothic',sans-serif">
<div class="wrapper" >
  <div class="row">
    <div class="col-sm-12 col-md-7">
      <div class="dataTables_paginate paging_simple_numbers" id="b">
        <ul class="pagination">
          <li class="paginate_button page-item previous disabled" id="a" >
            <button type="button" class="page-link">이전</button>
          </li>
          <li class="paginate_button page-item active">
            <a href="#" class="page-link">1</a>
          </li>
          <li class="paginate_button page-item ">
            <a href="#" class="page-link">2</a>
          </li>
          <li class="paginate_button page-item ">
            <a href="#" class="page-link">3</a>
          </li>
          <li class="paginate_button page-item ">
            <a href="#" class="page-link">4</a>
          </li>
          <li class="paginate_button page-item ">
            <a href="#" class="page-link">5</a>
          </li>
          <li class="paginate_button page-item next" id="c">
            <a href="#" class="page-link">다음</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
<jsp:include page="bottom.jsp" />
</body>
</html>
