<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html lang="ko">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<head>
</head>
<style>
.image{
    height: 100px;
    width: 100px;
    display: inline-block;
    position: absolute;
}
img{
width:100%
}
.title{
    height: 50px;
    width: 500px;
    display: inline-block;
    position: relative;
    margin-top: 50px;
    margin-left: 100px;
}    
</style>

<body>
	<header>
	
	<jsp:include page="/WEB-INF/include/header.jsp" flush="false" />
    
	</header>
	<hr>
	<section>

	<h2>게시판 목록</h2>
	<table class="board_list">
		<colgroup>
			<col width="10%"/>
			<col width="*"/>
			<col width="15%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">제목</th>
				<th scope="col">조회수</th>
				<th scope="col">제조사</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
	</section>
	
	<select id="KEYTAG">
		<option value="" selected>선택</option>
		<option value="modelname">제목</option>
		<option value="CREA_ID">아이디</option>
		<option value="manufacturecompany">제조사</option>
		<option value="ALL">제목+아이디+제조사</option>
	</select> 
	<input type="text" id="KEYWORD" name="KEYWORD"/>
	<a href="#this" class="btn" id="search">search</a>
	
	<div id="PAGE_NAVI"></div>
    <input type="hidden" id="PAGE_INDEX" name="PAGE_INDEX"/>

	<br/>
	<a href="#this" class="btn" id="write">글쓰기</a>
	
	<form id="commonForm" name="commonForm"></form>
	<script src="<c:url value='/resources/js/page.js'/>"></script>
	<script src="<c:url value='/resources/js/common.js'/>"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			fn_selectBoardList(1);
			
			$("#search").on("click", function(e){ //검색 버튼
				e.preventDefault();
				fn_selectBoardList(1);
			});
			
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});	

		});
		
		
		function fn_openBoardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/O_board/openBoardWrite.do' />");
			comSubmit.submit();
		}
		
		function fn_selectBoardList(pageNo){
            var comAjax = new ComAjax();
            comAjax.setUrl("<c:url value='/O_board/selectBoardList.do' />");
            comAjax.setCallback("fn_selectBoardListCallback");
            comAjax.addParam("KEYTAG",$("#KEYTAG").val());
            comAjax.addParam("KEYWORD",$("#KEYWORD").val());
            comAjax.addParam("PAGE_INDEX",pageNo);
            comAjax.addParam("PAGE_ROW", 20);
            comAjax.ajax();
        }
         
        function fn_selectBoardListCallback(data){
            var total = data.TOTAL;
            var body = $("table>tbody");
            body.empty();
            if(total == 0){
                var str = "<tr>" +
                                "<td colspan='4'>조회된 결과가 없습니다.</td>" +
                            "</tr>";
                body.append(str);
            }
            else{
                var params = {
                    divId : "PAGE_NAVI",
                    pageIndex : "PAGE_INDEX",
                    totalCount : total,
                    eventName : "fn_selectBoardList"
                };
                gfn_renderPaging(params);
                 
                var str = "";
                $.each(data.list, function(key, value){
                    str += "<tr>" +
                                "<td style='height:100px'>" + value.idx + "</td>" +
                                "<td class='modelname' >" +
                                	
                                	"<div class='image'>"+
                                    	"<a href='<c:url value='/O_board/openBoardDetail.do?idx=" + value.idx + "' />'>"+ 
                                    		"<img src='${pageContext.request.contextPath}/resources/template/img/mouseIMG/" + value.stored_file_name +"' />" +
                            			"</a>" +
                            		"</div>" +
                            		
                            		"<div class='title'>"+
                            			"<a href='<c:url value='/O_board/openBoardDetail.do?idx=" + value.idx + "' />'>" +
                            				value.modelname + 
                            			"</a>"+
                            		"</div>"+
                            		
                                "</td>" +
                                "<td>" + value.price + "</td>" +
                                "<td>" + value.manufacturecompany + "</td>" +
                            "</tr>";
                });
                body.append(str);
                 
            }
        }
	</script>	
</body>
</html>