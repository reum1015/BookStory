<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true"%>
<form id="comment_report_form" method="post"
	action="${pageContext.request.contextPath}/comment/comment_report_ok.do">
	<input type="hidden" name="comment_id" value="${comment.id}" />
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="modal-title">덧글 신고</h4>
	</div>
	<div class="modal-body">
		<c:if test="${comment.member_id == loginInfo.id }">
			<div class="form-group">
				<p>본인 덧글에 신고는 불가능합니다..</p>
			</div>
		</c:if>
		<!-- 신고자 id 가져오기-->
		<input type="hidden" class="form-control" name="id" id="subject1"
			value="${id}">
		<!-- 게시자 id 가져오기-->
		<input type="hidden" class="form-control" name="member_id"
			id="subject2" value="${member_id}">
		<!-- 신고 덧글 내용 -->
		<input type="hidden" class="from-control" name="comment_content"
			value="${comment_content}">
		<!-- 신고자 -->
		<div class="form-group">
			<label for="member_id1" class="col-md-2 control-label">신고자</label>
			<div class="col-md-10">
				<input type="text" class="form-control" name="nick_name"
					id="subject1" value="${nick_name}" readonly="readonly">
			</div>
		</div>
		<!-- 게시자 -->
		<div class="form-group">
			<label for="member_id2" class="col-md-2 control-label">게시자</label>
			<div class="col-md-10">
				<input type="text" class="form-control" name="user_nickname"
					id="subject2" value="${user_nickname}" readonly="readonly">
			</div>
		</div>
		<!-- 신고 내용 -->
		<div class="form-group">
			<label for="select1" class="col-md-2 control-label">신고내용</label>
			<div class="radio col-md-4">
				<label> <input type="radio" name="report_content"
					id="optionsRadios1" value="option1" checked> 음란성 또는 청소년에게
					부적합한 내용
				</label>
			</div>
			<div class="radio col-md-3">
				<label> <input type="radio" name="report_content"
					id="optionsRadios2" value="option2"> 폭언 또는 욕설 내용
				</label>
			</div>
			<div class="radio col-md-3">
				<label> <input type="radio" name="report_content"
					id="optionsRadios3" value="option3"> 게시물 광고 내용
				</label>
			</div>
		</div>
		<!-- 게시글 번호 -->
		<div class="form-group">
			<label for="member_id2" class="col-md-2 control-label">게시글번호</label>
			<div class="col-md-10">
				<input type="text" class="form-control" name="article_id"
					id="subject4" value="${article_id}" readonly="readonly">
			</div>
		</div>
		<br /> <br />
		<!-- 신고내용 끝 -->
		<!-- 덧글 내용 -->
		<div class="form-group">
			<textarea rows="5" class="form-control" name="content">${comment.content}</textarea>
		</div>
	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		<button type="submit" class="btn btn-danger">확인</button>
	</div>
</form>