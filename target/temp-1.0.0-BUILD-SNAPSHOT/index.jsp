<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<a href="${pageContext.request.contextPath }/member/memberJoin.do">회원가입</a>
	<a href="${pageContext.request.contextPath }/login/login.do">로그인</a>
	<a href="${pageContext.request.contextPath}/board/1/list.do">게시판</a>
	
	<c:if test="${not empty userVO }">
	<a href="${pageContext.request.contextPath }/member/${userVO.id}/Mypage.do">마이페이지</a>
	<a href="${pageContext.request.contextPath }/login/logout.do">로그아웃</a>
	</c:if>
	
</body>
</html>                           