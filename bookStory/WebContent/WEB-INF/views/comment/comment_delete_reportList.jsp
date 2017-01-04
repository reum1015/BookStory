<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="commentDeleteList" method="post" 
	action="${pageContext.request.contextPath}/admin/commentDeleteListOk.do">
	<input type="hidden" name="comment_id" value="${comment_id}" />
	<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading"></h4>
				</div>
				<div class="modal-body">
					신고 목록에서 삭제 하시겠습니까?
				</div>
				<div class="modal-footer ">
					<button type="submit" class="btn btn-warning"style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> 확인
					</button>
					
				</div>
	
</form>