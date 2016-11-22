<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우저에게 알려준다. 
			- ANSI(euc-kr), UTF-8 -->
<meta charset="utf-8" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- 스마트 장치에서의 해상도 균일화 처리 -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,
		maximum-scale=1.0,user-scalable=no">

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/icon/book01.png" />
<link rel="apple-touch-icon-precomposed"
	href="assets/icon/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/nanumfont.css" />

<!-- main css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/main.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/navbarfont.css" />

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
	href="${pageContext.request.contextPath}/assets/css/article/articleRead.css" />

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
				<li><a
					href="${pageContext.request.contextPath}/login/login.do"><span
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
						<li class="todayNovel"><a href="${pageContext.request.contextPath}/todaynovel/today_novel.do">TodayNovel</a></li>

						        <li class="novelList"><a href="${pageContext.request.contextPath}/novellist/novel_list.do">NoveList</a></li>

						        <li class="novelList"><a href="${pageContext.request.contextPath}/novellist/novel_list.do">NoveList</a></li>

						        <li class="community"><a href="${pageContext.request.contextPath}/community/article_list.do">Community</a></li>
						        <li class="mymenu"><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.do">MyMenu</a></li>
       							<li class="main_admin"><a href="${pageContext.request.contextPath}/admin/admin_main.do" class="main_navi_admin active">administrator</a></li>
        						<li><a href="#" class="visible-xs signup_icon"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        						<li><a href="#" class="visible-xs login_icon"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
				<img src="../assets/imgs/article/FreeArticle1.png" alt="자유게시판"
					class="img-rounded left-block">
			</div>
			<section>
				<table class="table">
					<thead>
						<tr>
							<th colspan="2">글제목 : 글제목</th>
						</tr>
						<tr>
							<th>작성자 : 작성자이름</th>
							<th>작성일 : 2016-04-23</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="table-bordered view" colspan="2">
								<div class="view_cont1">
								"안녕하세요~"
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="btn btn-default pull-right btn-sm">삭제</button>
								<button type="button" class="btn btn-default pull-right btn-sm">수정</button>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="btn1">
					<a href="${pageContext.request.contextPath}/community/article_list.do"><button type="submit"
							class="btn btn-default btn-sm">목록</button></a>
					<button type="submit" class="btn btn-danger pull-right btn-sm"
						data-toggle="modal" data-target="#article_toadmin">신고</button>
				</div>
				<table class="table">
					<tbody>
						<tr class="row">
							<th class="col-xs-3 col-sm-3"><span>다음글</span></th>
							<td class="col-xs-5 col-sm-7"><a href="#">글제목</a></td>
							<td class="col-xs-2 col-sm-1">글쓴이</td>
							<td class="col-xs-2 col-sm-1">2016.10.03</td>
						</tr>
						<tr class="row">
							<th class="col-xs-3 col-sm-3"><span>이전글</span></th>
							<td class="col-xs-5 col-sm-7"><a href="#">글제목</a></td>
							<td class="col-xs-2 col-sm-1">글쓴이</td>
							<td class="col-xs-2 col-sm-1">2016.08.05</td>
						</tr>
					</tbody>
				</table>
				<!-- 덧글 내용 -->
				<div>
					<h4>
						<img src="${pageContext.request.contextPath}/assets/imgs/article/coment.png" alt="코멘트"
							class="left-block"> <span class="coment_size">총<strong
							class="coment_color">1개</strong>의 코멘트가 있습니다.
						</span>
					</h4>
					<hr />
					<ul class="list-inline">
						<li class="coment_li">
							<div class="coment_div pull-left">
								<span class="nic1">닉네임&nbsp&nbsp&nbsp&nbsp<span
									class="nic2">2016.06.15</span></span>
								<p>코멘트 내용</p>
							</div>
							<button type="submit" class="btn btn-danger pull-right btn-sm"
								data-toggle="modal" data-target="#reply_toadmin">신고</button>
						</li>
					</ul>
					<!-- 덧글 입력 -->
					<div class="write">
						<form class="form-group row">
							<textarea class="form-control col-xs-9 col-sm-9" rows="3"></textarea>
							<button type="submit"
								class="btn btn-primary col-xs-3 col-sm-3 pull-right">등록하기</button>
						</form>
					</div>
				</div>
			</section>
		</div>

		<!-- 게시글 신고 모달 -->
		<div class="modal fade" id="article_toadmin" tabindex="-1"
			role="dialog" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">게시글 신고</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> 이 게시글을
							신고하시겠습니까?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>



		<!--덧글 신고 모달 -->
		<div class="modal fade" id="reply_toadmin" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">덧글 신고</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> 이 덧글을
							신고하시겠습니까?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>


	</div>

	<!-- footer -->
	<footer class="page-footer text-center" id="main_footer">
		<div class="container footer_container">
			<p class="text-center">
			<h5>
				<a href="#">이용약관</a> / <a href="#">운영원칙</a> / <a href="#">개인정보
					취급방침</a> / <a href="#">책임의 한계와 법적고지</a>
			</h5>

			<address>
				<small>본 콘텐츠의 저작권은 제공처에 있으며, 이를 무단 이용하는경우 저작권법 등에 따라 법적 책임을
					질 수 있습니다.</small> <br> <img src="${pageContext.request.contextPath}/assets/imgs/main/homebutton.jpg"
					alt="저작권" width="100" /> copyright&copy; All rights reserved.
			</address>
		</div>
	</footer>


	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>