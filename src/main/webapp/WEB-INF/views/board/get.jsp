<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf" %>

<div class="container p-3 my-3 bg-primary text-white">

<div class="getData">
	<input type="hidden" name="page" id="page" value="${param.page}">
	<input type="hidden" name="type" id="type" value="${param.type}">
	<input type="hidden" name="keyword" id="keyword" value="${param.keyword}">
</div>





	<form id="getForm">
		<input type="hidden" name="bno" value="${board.bno}"/>
		<input type="hidden" name="title" value="${board.title}"/>
		<input type="hidden" name="writer" value="${board.writer}"/>
		<input type="hidden" name="content" value="${board.content}"/>
		<%-- <input type="hidden" name="regDate" value="${board.regDate}"/>
		<input type="hidden" name="updateDate" value="${board.updateDate}"/> --%>
		<h3>글조회 </h3> 
		<p> 제목 : ${board.title } </p>
		<p> 작가 : ${board.writer} </p>
		<p> 등록일 : 
		<fmt:parseDate var="regDate" value="${board.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
		<fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" />
		</p>
		<p> 수정일 :
		<fmt:parseDate var="updateDate" value="${board.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
		<fmt:formatDate value="${updateDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" />
		</p>
		<div>
			내용 : ${board.content }
		</div>
			<button class="btn btn-warning modify">수정</button>
			<button class="btn btn-danger remove">삭제</button>
			<button class="btn btn-primary list">목록</button>
</form>
</div>

<script>
$(function(){
	let getForm = $("#getForm");
	$('#getForm .list').on('click',function(){ // 목록페이지
		getForm.append($('#page'));
		getForm.append($('#type'));
		getForm.append($('#keyword'));
		getForm.empty();
		getForm.attr("action","list");
		getForm.submit();	
	})
	$('#getForm .modify').on('click',function(){ // 수정페이지
		getForm.attr("action","modify");
		getForm.submit();	
	})
	$('#getForm .remove').on('click',function(){ // 삭제처리
		getForm.attr("method","post");
		getForm.attr("action","remove");
		getForm.submit();
	});
	
})
</script>


<%@ include file="/WEB-INF/views/layout/footer.jspf" %>