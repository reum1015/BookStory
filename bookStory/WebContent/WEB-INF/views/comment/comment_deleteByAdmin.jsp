<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="commentDeleteByAdmin" method="post" 
	action="${pageContext.request.contextPath}/admin/commentDeleteByAdminOk.do">
	<input type="hidden" name="comment_id" value="${comment_id}" />
		<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">댓글 강제 삭제</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> 이글을 삭제 하시겠습니까?
					</div>

				</div>
				<div class="modal-footer ">
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> 확인
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> 취소
					</button>
				</div>
	
</form>