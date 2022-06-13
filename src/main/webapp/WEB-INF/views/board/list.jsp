<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf" %>


<div class="contrainer ">
<h2>자유게시판</h2>

<div class="listData">
	<input type="hidden" name="bno" id="bno" value="">
	<input type="hidden" name="page" id="page" value="${pageMaker.criteria.page }">
	<input type="hidden" name="type" id="type" value="${pageMaker.criteria.type }">
	<input type="hidden" name="keyword"  id="keyword" value="${pageMaker.criteria.keyword }">
</div>


<div class="searchArea">
	<form action="${contextPath}/board/list" id="listForm">
		<select name="type">
			<option value="">===</option>
			<option value="T" ${pageMaker.criteria.type eq 'T' ? 'selected' : '' }>제목</option>
			<option value="C" ${pageMaker.criteria.type eq 'C' ? 'selected' : '' }>내용</option>
			<option value="W"${pageMaker.criteria.type eq 'W' ? 'selected' : '' }>작성자</option>
		</select>
		<input type="text" name="keyword">
	</form>
</div>

<button class="btn write"><a href="${contextPath}/board/register">글 쓰기</a></button>

<table class="table table-hover">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>수정일</th>
	</tr>
	<c:forEach items="${list}" var="b">
	<tr>
			<td>${b.bno}</td>
			<td>
				<a href="${b.bno}" class="get">${b.title }</a>
			</td>
			<td>${b.writer}</td>
			<td>
				<fmt:parseDate var="regDate" value="${b.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
				<fmt:formatDate value="${regDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" />
			</td>
			<td>
				<fmt:parseDate var="updateDate" value="${b.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/>
				<fmt:formatDate value="${updateDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" />
			</td>
	</tr>
	</c:forEach>
</table>
<ul class="pagination pagination-sm">
	<c:if test="${pageMaker.prev }">
		<li class="page-item"><a href="${pageMaker.startPage-1 }" class="page-link">이전페이지</a></li>
	</c:if>
<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage }" var="pageNum">
		<li class="page-item ${param.page == pageNum ? 'active' : '' }">
			<a href="${pageNum}" class="page-link">${pageNum}</a>
		</li>
	</c:forEach>
	<c:if test="${pageMaker.next }">
	<li class="page-item">
		<a href="${pageMaker.endPage+1 }" class="page-link">다음페이지</a>
	</li>
	</c:if>
</ul>
</div>

<%@ include file="/WEB-INF/views/layout/footer.jspf" %>

<script>
$(function(){
	let listForm = $('#listForm');
	$('.pagination a').on('click',function(e){
		e.preventDefault();
		
		$('.listData').find('#page').val($(this).attr('href'));
		
		if(listForm.find('input[name="keyword"]').val()==''){
			listForm.find('input[name="keyword"]').remove();
			listForm.find('select[name="type"]').remove();
		}
		
		listForm.append($('#page'));
		listForm.submit();
	});
	
	$('.get').on('click',function(e){
		e.preventDefault();
		let bno = $(this).attr('href');
		$('#bno').val(bno);
		listForm.append($('#bno'));
		listForm.append($('#page'));
		listForm.attr("action","get");
		listForm.submit();
	})
	
})
</script>

