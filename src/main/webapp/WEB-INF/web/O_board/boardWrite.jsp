<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<head>
</head>
<body>
<header>
	
	<jsp:include page="/WEB-INF/include/header.jsp" flush="false" />

	</header>
	<hr>
	<h3 align="center">게시글 작성</h3>
	<br/>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*"/>
			</colgroup>

			<tr></tr>
			<tr></tr>
			<tr></tr>
			<tbody>
				<tr>
					<th scope="row" align="left">제목</th>
					<td><input type="text" id="TITLE" name="TITLE" class="wdp_90"></input></td>
				</tr>
				<tr>
					<th scope="row" align="left">상품정보</th>
					<td colspan="2" class="view_text">
						<textarea rows="10" cols="50" title="내용" id="CONTENTS" name="CONTENTS"></textarea>
					</td>
				</tr>
				<tr>
					<th scope="row" align="left" width="300">가격입력 :</th>
					<td><input type="text" id="PRICE" name="PRICE" class="" /></td>
				</tr>
				<tr>
				<th scope="row" align="left">배송비 :</th>
				<td><select name="D_PRICE" size="1">
						<option selected> 무료
						<option> 2,500
				</select></td>
				</tr>
			</tbody>
		</table>
		<div id="fileDiv">
			<p>
				<input type="file" id="file" name="file_0">
				<a href="#this" class="btn" id="delete" name="delete">삭제</a>
			</p>
		</div>
		
		<br/><br/>
		<a href="#this" class="btn" id="addFile">파일 추가</a>
		<a href="#this" class="btn" id="write">작성하기</a>
		<a href="#this" class="btn" id="list">목록으로</a>
	</form>
	<form id="commonForm" name="commonForm"></form>
	
	<script type="text/javascript" src="<c:url value='/resources/js/common.js'/>"></script>
	<script type="text/javascript">
		var gfv_count = 1;
	
		$(document).ready(function(){
			$("#list").on("click", function(e){ //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			
			$("#write").on("click", function(e){ //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});
			
			$("#addFile").on("click", function(e){ //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		});
		
		function fn_openBoardList(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/O_board/openBoardList.do' />");
			comSubmit.submit();
		}
		
		function fn_insertBoard(){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/O_board/insertBoard.do' />");
			comSubmit.submit();
		}
		
		function fn_addFile(){
			var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("a[name='delete']").on("click", function(e){ //삭제 버튼
				e.preventDefault();
				fn_deleteFile($(this));
			});
		}
		
		function fn_deleteFile(obj){
			obj.parent().remove();
		}
	</script>
</body>
</html>