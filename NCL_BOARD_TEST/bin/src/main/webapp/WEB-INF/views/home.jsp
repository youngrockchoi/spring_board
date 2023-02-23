<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%-- <%@ page session="false" %> --%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is !! </P>

<form action="${pageContext.request.contextPath}/logout" method="POST"> 
	<sec:csrfInput/>
	<input type="submit" value="로그아웃" />
</form>

<!-- 권한이 없는 익명의 사용자일 경우 -->
<sec:authorize access="isAnonymous()">
로그인<br>
회원가입
</sec:authorize>

<!-- 권한에 관계없이 로그인 인증을 받은 경우 -->
<sec:authorize access="isAuthenticated()">
로그아웃<br>
회원정보보기
</sec:authorize>

<!-- 해당 권한이 있을 경우 -->
<sec:authorize access="hasRole('admin')">
관리자 페이지<br>
</sec:authorize>

<%-- 
	<!-- guest 접근불가 -->
	<sec:authorize access="hasAnyRole('ROLE_SYS', 'ROLE_ADMIN', 'ROLE_MANGER', 'ROLE_USER')">
	<a href="dataDown" id="dataDown">다운로드<span></span></a>
	</sec:authorize>
	
	<sec:authorize access="hasAnyRole('ROLE_SYS', 'ROLE_ADMIN')">
	<a href="configSensor" id="configSensor">측정기리스트<span></span></a>
	</sec:authorize> 
--%>


</body>
</html>
