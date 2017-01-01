<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="member_delete_form" method="post"
	action="${pageContext.request.contextPath}/admin/admin_member_delete_Ok.do">
	<input type="hidden" name="memberId" value="${memberId}" id="memberId" />
	<input type="hidden" name="nick_name" value="${nick_name}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">
			<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
		</button>
		<h4 class="modal-title custom_align" id="Heading">강제 탈퇴</h4>
	</div>
	<div class="modal-body">

		<div class="alert alert-danger">${nick_name}님 을 강제로
			탈퇴시키겠습니까?
		</div>

	</div>
	<div class="modal-footer ">
		<button type="submit" class="btn btn-success">
			<span class="glyphicon glyphicon-ok-sign"></span> 네
		</button>
		<button type="button" class="btn btn-default" data-dismiss="modal">
			<span class="glyphicon glyphicon-remove"></span> 아니오
		</button>
	</div>
</form>