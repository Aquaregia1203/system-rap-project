<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <jsp:include page="../top.jsp" />
    <h2>관리자 수정 화면입니다</h2>
    <hr>
    <form action="/admin" method="post">
        <table>
            <tr>
                <td>아이디 : ${manager.id}</td>
            </tr>
            <tr>
                <td>비밀번호 :</td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td>이름 :</td>
                <td><input type="text" name="name" value="${manager.name}"> </td>
            </tr>
            <tr>
                <td>연락처 :</td>
                <td>
                    <select name="phone">
                        <option value="">선택..</option>
                        <option value="010" selected>010</option>
                    </select> -
                    <input type="text" name="phone" value="${phone[1]}"> -
                    <input type="text" name="phone" value="${phone[2]}">
                </td>
            </tr>
            <tr>
                <td>상태 :</td>
                <td>
                    <c:if test="${manager.status eq 'Y'}">
                        <input type="radio" name="status" value="Y" checked>활성화
                        <input type="radio" name="status" value="N">비활성화
                    </c:if>
                    <c:if test="${manager.status eq 'N'}">
                        <input type="radio" name="status" value="Y">활성화
                        <input type="radio" name="status" value="N" checked>비활성화
                    </c:if>
                </td>
            </tr>
        </table>
        <input type="submit" value="수정">
        <input type="hidden" name="_method" value="put">
        <input type="hidden" name="id" value="${manager.id}">
    </form>
    <form action="/admin" method="get">
    <input type="submit" value="목록">
    </form>
</body>
</html>
