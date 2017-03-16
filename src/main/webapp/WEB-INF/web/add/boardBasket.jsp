<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>
<html lang="ko">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<script type="text/javascript" >	


/* function post_to_url(path, params, method){
	method = method||"post";
	
	var form = document.createElement("form");
	form.setAttribute("method",method);
	form.setAttribute("action",path);
	
	var idx = document.getElementsByName("check");
	for(var key in params){
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", idx);
		hiddenField.setAttribute("value", list);
	for(var i=0;i<idx.length;i++){
		if(idx[i].checked == true){
			var list = new Array(idx[i].value);
		
		/* var hiddenField = document.createElement("input"); */
		
		/* hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", params[key]);
		
		form.appendChild(hiddenField);
	}
	}
	
	document.body.appendChild(form);
	form.submit();
}





} */


/*    	function order(key,value){
		var idx = document.getElementsByName("check");
		
		for(var i=0;i<idx.length;i++){
			if(idx[i].checked == true){
				var list = new Array(idx[i].value);	
				var ex1;
				ex1 = list.join('/');
			}
		}
		alert(ex1);
		location.href="${pageContext.request.contextPath}/add/openBoardBuy.do?idx="+list
	}  */
  	
	function selectDelRow() {
		var chk = document.getElementById("check_id"); // 체크박스객체를 담는다
		var len = chk.length;    //체크박스의 전체 개수
		var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
		var checkCnt = 0;        //체크된 체크박스의 개수
		var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
		var cnt = 0;                 

		for(var i=0; i<len; i++){
		if(chk[i].checked == true){
		checkCnt++;        //체크된 체크박스의 개수
		checkLast = i;     //체크된 체크박스의 인덱스
		}
		} 

		for(var i=0; i<len; i++){
		if(chk[i].checked == true){  //체크가 되어있는 값 구분
		checkRow = chk[i].value;
		            	
		if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
		rowid += "'"+checkRow+"'";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
		}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
		if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
		rowid += "'"+checkRow+"'";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
		}else{
		rowid += "'"+checkRow+"',";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
		}
							
		}
		cnt++;
		checkRow = '';    //checkRow초기화.
		}

		alert(rowid);    //'value1', 'value2', 'value3' 의 형태로 출력된다.
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
		<td><input type="checkbox" id="check_id" name="check[]" value="${map.IDX }"></td>
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

<table>
	<tr>
		<td>주문금액</td>
		<!-- <td><a href="#this" class="btn" id="Buy" onClick="order(this)">주문하기</a></td> -->

</table>








<input type="button" value="주문" onClick="selectDelRow()" />


<!-- <a href="javascript:post_to_url('${pageContext.request.contextPath}/add/openBoardBuy.do',('IDX':'list'))">주문</a>
<a href="javascript:post_to_url('http://localhost:8080/pressfittest/target.jsp',{'type1':'aaa','type2':'bbb'})">POST보내기</a> -->










<div>
<div style="border:1px; solid:blue; width:300; height:200px; float:left;">
<%-- 상품이미지 부분<img src="${map.image}" width="200px" height="100px"/> --%>
</div>

<div style="border:1px; solid:red; width:400; height:400; float:left;"> 

</div>
</div>



</body>
</html>
