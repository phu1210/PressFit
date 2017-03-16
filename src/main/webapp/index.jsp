<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
</head>
<body>
	<header>
	
	<jsp:include page="/WEB-INF/include/header.jsp" flush="false" />
    
	</header>
	<hr>
	<section>
	<a href="${pageContext.request.contextPath }/member/memberJoin.do">회원가입</a>
	<a href="${pageContext.request.contextPath }/login/login.do">로그인</a>
	<a href="${pageContext.request.contextPath }/board/openBoardList.do">게시판</a>
	
	<c:if test="${not empty userVO }">
	<a href="${pageContext.request.contextPath }/member/${userVO.id}/Mypage.do">마이페이지</a>
	<a href="${pageContext.request.contextPath }/login/logout.do">로그아웃</a>
	</c:if>
	ssss
	</section>
	<hr>
	<footer>
	
	</footer>
</body>
</html>                           