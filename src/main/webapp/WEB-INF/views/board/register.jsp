<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf" %>

<div class="container">
<form action="register" method="post">
	제목 : <input type="text" name="title"><br>
	작가 : <input type="text" name="writer"><br>
	<textarea rows="25" cols="50" name="content"></textarea>
	<button class="btn btn-primary">등록</button>
</form>
</div>


<%@ include file="/WEB-INF/views/layout/footer.jspf" %>