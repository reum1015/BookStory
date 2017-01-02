<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="episode_comment_report_form" method="post" 
	action="${pageContext.request.contextPath}/episodecomment/episode_comment_report_ok.do">
	<input type="hidden" name="comment_id" value="${comment.id}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">덧글 신고</h4>
	</div>

	<div class="modal-body">
		<c:if test="${comment.member_id == loginInfo.id }">
		  <div class="form-group">
		    <p>본인 글은 신고가 불가능 합니다.</p>
		  </div>
		  </c:if>
		  <p>아직입니다...</p>
		  
		  
	</div>
	
		
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	</div>

</form>