<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<head>
</head>
<body>
	<header>
	
	<jsp:include page="/WEB-INF/include/header.jsp" flush="false" />

	</header>
	<hr>
	<br/>
	<br/>
		<div border="1">
		<img src="${pageContext.request.contextPath}/resources/template/img/mouseIMG/${map.stored_file_name}" width="300px" height="300px"/>
		</div>
		
		<form id="frm" name="frm" enctype="multipart/form-data">
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		
		<caption>
		<h3>${map.modelname }<input type="hidden" name="modelname" value="${map.modelname }"/></h3>
		</caption>
		<tbody>
			<tr>
				<th scope="row" align="left">글 번호 :</th>
				<td>${map.idx }<input type="hidden" name="IDX_NO" value="${map.idx }"/></td>
			</tr>			<tr>
				<th scope="row" align="left">제조사 :</th>
				<td>${map.manufacturecompany }<input type="hidden" name="manufacturecompany" value="${map.manufacturecompany }"/></td>
			</tr>
			<tr>
				<th scope="row" align="left">수량 :</th>
				<td>
					<select name="items_count" size="1">
							<c:forEach begin="1" end="10" var="i">
							<option value="${i}"> ${i}
							
							</option>
							</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row" align="left">가격 :</th>
				<td>${map.price }<input type="hidden" name="price" value="${map.price }"/></td>
			</tr>
 			<tr>
				<th scope="row" align="left">배송비 :</th>
				<td>${map.d_price }<input type="hidden" name="d_price" value="${map.d_price }"/></td>
			</tr>
			
			<tr>
				<th scope="row" align="left">옵션 선택 : </th>
				<td>
					<select name="items_select" size="1">
						<c:forEach begin="1" end="5" var="i">
						<option value="${i}"> ${i}
						</option>
						</c:forEach>
				</select>
			<tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">				
					<c:forEach var="row" items="${list }">
						<p>
							<input type="hidden" id="IDX" value="${row.IDX }">
							<a href="#this" name="file">${row.ORIGINAL_FILE_NAME }</a> 
							(${row.FILE_SIZE }kb)
						</p>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<th scope="row" align="left">상품평</th>
			</tr>
		</tbody>
	</table>
	
	<br/>
	<br/>
	<hr>
	<br/>
	
	
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="reply">답글달기</a>
	<a href="#this" class="btn" id="update">수정하기</a>
	<a href="#this" class="btn" id="basket">장바구니 담기</a>
	<a href="#this" class="btn" id="buy">바로 구매</a>
	<a href="#this" class="btn" id="delete">게시물 삭제</a>
	</form>
	<form id="commonForm" name="commonForm"></form>
	<script src='<c:url value='/resources/js/common.js'/>'></script>
	<script type="text/javascript" >
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#reply").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardReply();
			});
			
			$("#update").on("click", function(e){ //수정하기 버튼
				e.preventDefault();
				fn_openBoardUpdate();
			});
			
			$("#basket").on("click", function(e){	// 장바구니 담기 버튼
				e.preventDefault();
				fn_insertBasket();
			})
			
			$("#buy").on("click", function(e){	// 바로구매 버튼
				e.preventDefault();
				fn_openBoardBuy();
			})
			
			$("a[name='file']").on("click", function(e){ //파일 이름
				e.preventDefault();
				fn_downloadFile($(this));
			});
			
			$("a[name='file']").on("click", function(e){ // 디테일 삭제
				e.preventDefault();
				fn_deleteBoard($(this));
			});
			
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/O_board/openBoardList.do' />");
			comSubmit.submit();
		}

		function fn_openBoardReply(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/O_board/openBoardReply.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/O_board/openBoardUpdate.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		
		function fn_insertBasket(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/O_board/insertBasket.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		
		function fn_openBoardBuy(){
			 var idx = "${map.IDX}"; 
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/add/openBoardBuy.do' />");
			comSubmit.addParam("IDX", idx); 
			comSubmit.submit();
		}
		
		function fn_deleteBoard(){
			 var idx = "${map.IDX}"; 
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/add/openBoardBuy.do' />");
			comSubmit.addParam("IDX", idx); 
			comSubmit.submit();
		}
		
		function fn_downloadFile(obj){
			var idx = obj.parent().find("#IDX").val();
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
	</script>
</body>
</html>