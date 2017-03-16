<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<th></th>
		<th>번호</th>
		<!-- <th>제목</th> -->
		<th>상품/옵션정보</th>
		<th>수량</th>
		<th>가격</th>
		<th>배송비</th>
		<th>주문</th>
	</tr>
	<c:forEach var="map" items="${map }">
	<tr>
		<td><input type="checkbox" name="check" value="ROW_1"></td>
 		<td>${map.IDX}</td>
 		<%-- <td>${map.title }</td> --%>
		<td><a href="<c:url value='/O_board/openBoardDetail.do?IDX=${map.IDX_NO }'/>">${map.ITEMS_INFO }</a></td>
		<td>${map.ITEMS_COUNT }</td>
		<td>${map.PRICE }</td>
		<td>${map.D_PRICE }</td>
		<td>주문부분</td>
	</tr>
	</c:forEach>
</table>





<br/>

<a href="/temp/board/boardPayment.do" id="payment">구매하기</a>



</body>
</html>