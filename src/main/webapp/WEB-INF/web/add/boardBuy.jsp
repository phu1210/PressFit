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

�����ϱ�

<table>
	<tr>
		<th>��ȣ</th>
		<th>��ǰ��</th>
		<th>����</th>
		<th>����</th>
		<th>��ۺ�</th>
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
		<th>�հ�</th>
	</tr>
	<tr>
		<td>${map[0].sum_price }</td>
	</tr>	
	</table>
<br/>
<br/>



<br/>

<a href="/temp/board/boardPayment.do" id="payment">�����ϱ�</a>



</body>
</html>