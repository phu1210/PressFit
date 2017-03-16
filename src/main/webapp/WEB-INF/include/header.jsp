<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<script src='<c:url value='resources/js/common.js'/>'></script>


<a href="${pageContext.request.contextPath}/O_board/openBoardList.do">O-Board 게시판</a>&nbsp;
<a href="${pageContext.request.contextPath}/board/openBoardList.do">T-Board 게시판</a>&nbsp;
<a href="${pageContext.request.contextPath}/board/openBoardList.do">C-Board 게시판</a>&nbsp;
<a href="${pageContext.request.contextPath}/board/openBoardList.do">Q-Board 게시판</a>&nbsp;
<a href="${pageContext.request.contextPath}/add/openBoardBasket.do">장바구니로</a>&nbsp;
