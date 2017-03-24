<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

결제하기

<table>
	<tr>
		<th>번호</th>
		<th>상품명</th>
		<th>수량</th>
		<th>가격</th>
		<th>배송비</th>
	</tr>
	<c:forEach var="map" items="${map }">
	<tr>
 		<td>${map.idx}</td>
		<td>${map.modelname }</td>
		<td>${map.items_count }</td>
		<td>${map.price }</td>
		<td>${map.d_price }</td>
	</tr>
	</c:forEach>

</table>
	<table>
	<tr>
		<th>합계</th>
	</tr>
	<tr>
		<td>${map[0].sum_price }</td>
	</tr>	
	</table>
<br/>
<br/>



<br/>

<a href="/temp/board/boardPayment.do" id="payment">구매하기</a>



</body>
</html>