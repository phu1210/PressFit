<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>
<html lang="ko">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript" >	

    function order(){
		var idx = document.getElementsByName("check");
		for(var i=0;i<idx.length;i++){
			if(idx[i].checked == true ){
				var list = new Array(idx[i].value);
				alert(list);	
			}
		}
  	return list;
}
</script>
<head>
</head>
<body>
	<header>
	
	<jsp:include page="/WEB-INF/include/header.jsp" flush="false" />

	</header>
	<hr>
	<br/>
장바구니
<br/>
<br/>
<form name="check" action="<c:url value='/add/cartCheck.do' />" method="get" onsubmit="return order();">
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
		<td><input type="checkbox" id="check_id" name="check" value="${map.idx }"></td>
 		<td>${map.idx}<input type="hidden" name="idx" value="${map.idx }"/></td>
 		<%-- <td>${map.title }</td> --%>
		<td><a href="<c:url value='/O_board/openBoardDetail.do?IDX=${map.IDX_NO }'/>">${map.modelname }<input type="hidden" name="modelname" value="${map.modelname }"/></a></td>
		<td>${map.items_count }<input type="hidden" name="items_count" value="${map.items_count }"/></td>
		<td>${map.price }<input type="hidden" name="price" value="${map.price }"/></td>
		<td>${map.d_price }<input type="hidden" name="d_price" value="${map.d_price }"/></td>
		<td>주문부분</td>
	</tr>
	</c:forEach>
</table>
<br/>
<br/>
<input type="submit" id="buy" value="주문하기" />
</form>

<div>
<div style="border:1px; solid:blue; width:300; height:200px; float:left;">
<%-- 상품이미지 부분<img src="${map.image}" width="200px" height="100px"/> --%>
</div>

<div style="border:1px; solid:red; width:400; height:400; float:left;"> 

</div>
</div>

</body>
</html>
