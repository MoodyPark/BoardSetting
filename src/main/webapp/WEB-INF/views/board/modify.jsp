<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf" %>

수정페이지

<form action="modify" method="post">
	<input type="hidden" name="bno" value="${board.bno }">
	게시물 번호 : ${board.bno } <br>
	제목 : <input type="text" name="title" value="${board.title }"/> <br>
	작성자 : ${board.writer} <br>
	내용 : 
	<textarea rows="20" cols="20" name="content">${board.content}</textarea>
	<button class="btn btn-danger">수정하기</button>
</form>




<%@ include file="/WEB-INF/views/layout/footer.jspf" %>