<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<html lang='ko'>
<head>

<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>

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

	<!-- 메인 헤더 -->
	<header class="main_header clearfix page-header hidden-xs">

		<!-- 메인 wrapper div -->
		<div class="container clearfix main_header_wrapperdiv">

			<!-- 메인 헤더 로그인 회원가입 화면-->
			<ul class="nav navbar-nav navbar-right hidden-xs">
				<li><a
					href="${pageContext.request.contextPath}/login/sign_up_agree.do"><span
						class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="${pageContext.request.contextPath}/login/login.do"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>

			<!-- 메인 헤더 이미지 -->
			<div class="container main_header_image">
				<h1 class="main_h1">
					<a href="${pageContext.request.contextPath}/index.do"
						id="main_image_link"></a>
				</h1>
				<p class="sr-only">북스토리 메인 헤더영역</p>
			</div>

		</div>
		<div id="top_mar"></div>



	</header>

	<!-- 네비게이션 바 (메뉴 영역) -->
	<nav class="navbar navbar-default main_navi">
		<div class="container">
			<div class="navbar-header clearfix">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="${pageContext.request.contextPath}/index.do"
					class="navbar-brand bookstoryhome">BookStory</a>
			</div>
			<div class="container">
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="todayNovel"><a
							href="${pageContext.request.contextPath}/todaynovel/today_novel.do">TodayNovel</a></li>
						<li class="novelList"><a
							href="${pageContext.request.contextPath}/novellist/novel_list.do">NoveList</a></li>
						<li class="community"><a
							href="${pageContext.request.contextPath}/community/article_list.do">Community</a></li>
						<li class="mymenu"><a
							href="${pageContext.request.contextPath}/mymenu/recent_novel_list.do">MyMenu</a></li>
						<li class="main_admin"><a
							href="${pageContext.request.contextPath}/admin/admin_main.do"
							class="main_navi_admin active">administrator</a></li>

						<li><a href="#" class="visible-xs"><span
								class="glyphicon glyphicon-user"></span> Sign Up</a></li>
						<li><a href="#" class="visible-xs"><span
								class="glyphicon glyphicon-log-in"></span> Login</a></li>
						<li>
							<form
								class="navbar-form navbar-left pull-left search_form visible-xs"
								role="search">
								<fieldset>
									<div class="input-group form-group">

										<label class="sr-only" for="total_search">통합검색</label> <input
											type="text" class="form-control" placeholder="통합검색"
											id="total_search"> <span class="input-group-btn">
											<button type="submit" class="btn btn-default">검색</button>
										</span>
									</div>
								</fieldset>
							</form>
						</li>
					</ul>

					<div class="main_login">
						<form
							class="navbar-form navbar-left pull-right hidden-xs form-inline"
							role="search">
							<fieldset>
								<div class="input-group input-group-sm">
									<input type="text" class="form-control" placeholder="통합검색">
									<span class="input-group-btn">
										<button type="submit" class="btn btn-default">검색</button>
									</span>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</nav>



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