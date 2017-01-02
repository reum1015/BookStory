<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="episode_comment_edit_form" method="post" 
	action="${pageContext.request.contextPath}/episodecomment/episode_comment_edit_ok.do">
	<input type="hidden" name="comment_id" value="${comment.id}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">덧글 수정</h4>
	</div>
	<div class="modal-body">
		<c:if test="${comment.member_id != loginInfo.id }">
		  <div class="form-group">
		    <p>귀하의 글이 아닙니다.</p>
		  </div>
		</c:if>
		
		<c:if test="${comment.member_id == loginInfo.id }">
		<!-- 덧글 내용 -->
		<div class="form-group">
		  <textarea rows="5" class="form-control" name="content">${comment.content}</textarea>
		</div>
		</c:if>
	</div>
	<div class="modal-footer">
	<c:if test="${comment.member_id != loginInfo.id }">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		</c:if>
		<c:if test="${comment.member_id == loginInfo.id }">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		<button type="submit" class="btn btn-danger">수정</button>
		</c:if>
	</div>
</form>