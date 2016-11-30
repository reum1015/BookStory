<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<html lang='ko'>
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
<!-- Article css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/naviStateColor/articleCommon.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/article/articleWrite.css" />


</head>
<body>
<!-- 게시판 영역 -->
	<div class="container main_container">
		<div class="Article_size">
			<div class="left-block">
				<img
					src="${pageContext.request.contextPath}/assets/imgs/article/FreeArticle1.png"
					alt="자유게시판" class="img-rounded left-block">
			</div>
			<section>
				<form role="form">
					<div class="form-group Article1">
						<label for="ArticleName"
							class="col-xs-2 col-sm-2 control-label text-center">제목</label>
						<div class="col-xs-10 col-sm-10">
							<input class="form-control" id="ArticleName" />
						</div>
					</div>
					<div class="form-group Article3">
						<div class="col-xs-2 col-sm-2 text-center">
							<label for="ArticleName" class="control-label">내용</label>
						</div>
						<div class="col-xs-10 col-sm-10 pull-right">
							<textarea class="form-control" id="ArticleName" rows="10"></textarea>
						</div>
					</div>
					<div class="col-xs-2 col-sm-2 Article1">
						<a href="./article_list.do"><button type="button"
								class="btn btn-default btn-sm pull-right">목록</button></a>
					</div>
					<div class="col-xs-10 col-sm-10 Article1">
						<a href="#"><button class="btn btn-default btn-sm pull-right">취소</button></a>
						<a href="#"><button class="btn btn-primary btn-sm pull-right">등록</button></a>
					</div>
				</form>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>