<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="episode_comment_report_form" method="post" 
	action="${pageContext.request.contextPath}/episodecomment/episode_comment_report_ok.do">
	
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">덧글 신고</h4>
	</div>



	<c:if test="${reportCount > 0 && readComment.member_id != loginInfo.id}">
	<div class="modal-body">
	<p>이미 신고가 완료된 덧글입니다.</p>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
	</div>
	</c:if>

	<c:if test="${readComment.member_id != loginInfo.id && reportCount <= 0}">
	<div class="modal-body">
	<p>이게시물을 신고 하시겠습니까?</p>
	
	<input type="hidden" value="${readComment.content}" name="comment_content" id="comment_content">
	<input type="hidden" value="${member_id}" name="member_id" id="member_id">
	<input type="hidden" value="${readComment.member_id}" name="comment_memberId" id="comment_memberId">
	<input type="hidden" value="${readComment.id}" name="comment_id" id="comment_id"/>
	<input type="hidden" value="${readComment.user_nickname}" name="user_nickname" id="user_nickname"/>
	<p>${comment.content}</p>
	
	<p>신고 이유</p>
	<div class="row">
    <div class="col-xs-12">
	    <div class="radio">
			  <label><input type="radio" name="report_reason" value="option1">음란성 또는 청소년에게 부적합한 내용</label>
		</div>
		<div class="radio">
			  <label><input type="radio" name="report_reason" value="option2">폭언 또는 욕설</label>
		</div>
		<div class="radio">
			  <label><input type="radio" name="report_reason" value="option3">게시물 광고</label>
		</div>

    </div>
  </div>

	
	</div>
	<div class="modal-footer">
		<button type="submit" class="btn btn-danger">신고</button>
		<button type="button" class="btn btn-success" data-dismiss="modal">취소</button>
	</div>
	</c:if>
	
	<c:if test="${readComment.member_id == loginInfo.id}">
	<div class="modal-body">
	<p>본인의 글은 신고 할수 없습니다.</p>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
	</div>
	</c:if>

</form>