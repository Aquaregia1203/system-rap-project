<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>어디로 가야하오</title>
</head>
<body>
    <form name="rapsystem" action="${pageContext.servletContext.contextPath}/manufacture-plan" method="get">
        <button id="rapsystem" type="submit">RAP 시스템 가기</button>
    </form>
    <form name="bootpage" action="${pageContext.servletContext.contextPath}/boot" method="get">
        <button id="bootpage" type="submit">bootpage 가기</button>
    </form>
</body>
</html>
