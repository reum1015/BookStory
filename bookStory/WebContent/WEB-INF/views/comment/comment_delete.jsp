<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="comment_delete_form" method="post" 
	action="${pageContext.request.contextPath}/comment/comment_delete_ok.do">
	<input type="hidden" name="comment_id" value="${comment_id}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">덧글 삭제</h4>
	</div>
	
		<c:choose>
			<c:when test="${myComment == true}">
			<div class="modal-body">
				<!-- 자신의 글에 대한 삭제 -->
				<p>정말 이 덧글을 삭제하시겠습니까?</p>
			</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		<button type="submit" class="btn btn-danger">삭제</button>
	</div>
			</c:when>
			<c:otherwise>
			<div class="modal-body">
				<!-- 자신의 글이 아닌 경우 -->
				<p>귀하의 글이 아닙니다.</p>
			</div>
		<div class="modal-footer">
		 <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		</div>
			</c:otherwise>
		</c:choose>
	
</form>