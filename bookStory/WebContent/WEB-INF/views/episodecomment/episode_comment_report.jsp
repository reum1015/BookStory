<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form id="episode_comment_report_form" method="post" 
	action="${pageContext.request.contextPath}/episodecomment/episode_comment_report_ok.do">
	
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">덧글 신고</h4>
	</div>

	
	<c:if test="${comment.member_id == loginInfo.id}">
	<div class="modal-body">
	<p>본인의 글은 신고 할수 없습니다.</p>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
	</div>
	
	
	</c:if>
	<c:if test="${comment.member_id != loginInfo.id}">
	<div class="modal-body">
	<p>이게시물을 신고 하시겠습니까?</p>
	
	<input type="hidden" value="${comment.content}" name="comment_content" id="comment_content">
	<input type="hidden" value="${member_id}" name="member_id" id="member_id">
	<input type="hidden" value="${comment.member_id}" name="comment_memberId" id="comment_memberId">
	<input type="hidden" value="${comment.id}" name="comment_id" id="comment_id"/>
	<p>${comment.content}</p>
	
	
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-danger">신고</button>
		<button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
	</div>
	</c:if>
	
		
	

</form>