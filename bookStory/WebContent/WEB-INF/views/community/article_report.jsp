<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>
<!-- 반응형 웹을 지원하지 않을 경우 -->
<!-- <link rel="stylesheet" type="text/css" href="assets/css/non-responsive.css"/> -->

<!-- IE8 이하 버전 지원 -->
<!--[if lt IE 9]>
	    <script type="text/javascript" src="assets/js/html5shiv.js"></script>
	    <script type="text/javascript" src="assets/js/respond.min.js"></script>
	    <![endif]-->

<!-- IE10 반응형 웹 버그 보완 -->
<!--[if gt IE 9]>
	    <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
	    <script type="text/javascript" src="assets/js/ie10.js"></script>
	    <![endif]-->

<style type="text/css">
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
	
<script type="text/javascript">
</script>
</head>
<body>
	<div class="container">
		<form class="form-horizontal" role="form" method="post"
			action="${pageContext.request.contextPath}/community/article_report_ok.do">
			<fieldset>
			<br /> <br />
				<legend>게시글 신고</legend>
				<!-- 신고자 id -->
				<div class="form-group">
					<label for="member_id1" class="col-md-2 control-label">신고자 id</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="id"
							id="subject1" value="${id}">
					</div>
				</div>
				<!-- 게시자 id -->
				<div class="form-group">
					<label for="member_id2" class="col-md-2 control-label">게시자 id</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="member_id"
							id="subject2" value="${member_id}">
					</div>
				</div>
				<!-- 신고자 -->
				<div class="form-group">
					<label for="member_id1" class="col-md-2 control-label">신고자</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="nick_name"
							id="subject1" value="${nick_name}">
					</div>
				</div>
				<!-- 게시자 -->
				<div class="form-group">
					<label for="member_id2" class="col-md-2 control-label">게시자</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="user_nickname"
							id="subject2" value="${user_nickname}">
					</div>
				</div>
				<!-- 글제목 -->
				<div class="form-group">
					<label for="member_id2" class="col-md-2 control-label">글제목</label>
					<div class="col-md-10">
						<input type="text" class="form-control" name="subject"
							id="subject3" value="${subject}" readonly="readonly">
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
							id="subject4" value="${article_id}" >
					</div>
				</div>
				<br /> <br />
				<!-- 신고내용 끝 -->
				<div class="pull-right">
					<button type="submit" class="btn btn-danger">신고하기</button>
					<button type="button" class="btn btn-primary"
						onclick="history.back();">취소</button>
				</div>
			</fieldset>
		</form>
		<br /> <br /> <br /> <br /> <br />
	</div>

	<!-- 신고하기 모달 -->
	<div class="modal fade" id="report">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- header -->
				<div class="modal-header">
					<!-- 닫기(x) 버튼 -->
					<button type="button" class="close" data-dismiss="modal">×</button>
				</div>
				<!-- body -->
				<div class="modal-body">이 게시글을 정말 신고 하시겠습니까?</div>
				<!-- Footer -->
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger" data-dismiss="modal">확인</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>