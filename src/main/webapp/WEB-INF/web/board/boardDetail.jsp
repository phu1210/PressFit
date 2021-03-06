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
		<img src="${map.image}" width="200px" height="200px"/>
		</div>
	<table class="board_view">
		<colgroup>
			<col width="15%"/>
			<col width="35%"/>
			<col width="15%"/>
			<col width="35%"/>
		</colgroup>
		
		<caption>
		<h3>${map.TITLE }</h3>
		</caption>
		
		<tbody>
			<tr>
				<th scope="row">글 번호</th>
				<td>${map.IDX }</td>
			</tr>
			<tr>
				<th scope="row">조회수</th>
				<td>${map.HIT_CNT }</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>${map.CREA_ID }</td>
			</tr>
				<th scope="row">작성시간</th>
				<td>${map.CREA_DTM }</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="4">${map.CONTENTS }
			</tr>
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
				<th scope="row">상품평</th>
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
	<form id="commonForm" name="commonForm"></form>
	<script src='<c:url value='/resources/js/common.js'/>'></script>
	<script type="text/javascript">
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
				fn_openBoardBasket();
			})
			
			$("#buy").on("click", function(e){	// 바로구매 버튼
				e.preventDefault();
				fn_openBoardBuy();
			})
			
			$("a[name='file']").on("click", function(e){ //파일 이름
				e.preventDefault();
				fn_downloadFile($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardList.do' />");
			comSubmit.submit();
		}

		function fn_openBoardReply(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardReply.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		
		function fn_openBoardUpdate(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardUpdate.do' />");
			comSubmit.addParam("IDX", idx);
			comSubmit.submit();
		}
		
		function fn_openBoardBasket(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardBasket.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardBuy(){
			var idx = "${map.IDX}";
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/openBoardBuy.do' />");
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