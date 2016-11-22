<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우저에게 알려준다. 
			- ANSI(euc-kr), UTF-8 -->
<meta charset="utf-8" />
<!-- IE의 호환성 보기 모드 금지 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- 스마트 장치에서의 해상도 균일화 처리 -->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">

<!-- 모바일 웹 페이지 설정 -->
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/icon/book01.png" />
<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/icon/apple-touch-icon-144-precomposed.png" />

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />

<!-- 나눔고딕 웹 폰트 적용 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nanumfont.css" />

<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/navbarfont.css" />

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

<!-- 스타일 sheet -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/mymenu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/mymenuCommon.css" />


</head>
<body>

	<!-- 메인 헤더 -->
	<header class="main_header clearfix page-header hidden-xs">

		<!-- 메인 wrapper div -->
		<div class="container clearfix main_header_wrapperdiv">

			<!-- 메인 헤더 로그인 회원가입 화면-->
			<ul class="nav navbar-nav navbar-right hidden-xs">
				<li><a href="${pageContext.request.contextPath}/login/sign_up_agree.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				<li><a href="${pageContext.request.contextPath}/login/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>

			<!-- 메인 헤더 이미지 -->
			<div class="container main_header_image">
				<h1 class="main_h1">
					<a href="${pageContext.request.contextPath}/index.jsp" id="main_image_link"></a>
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
				<a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand bookstoryhome">BookStory</a>
			</div>
			<div class="container">
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li class="todayNovel"><a href="${pageContext.request.contextPath}/todaynovel/mon_novel.jsp">TodayNovel</a></li>
						        <li class="novelList"><a href="${pageContext.request.contextPath}/novellist/novel_list.jsp">NoveList</a></li>
						        <li class="community"><a href="${pageContext.request.contextPath}/community/article_list.jsp">Community</a></li>
						        <li class="mymenu"><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.jsp">mymenu</a></li>
       							<li class="main_admin"><a href="${pageContext.request.contextPath}/admin/admin_main.jsp" class="main_navi_admin active">administrator</a></li>
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




	<!-- 메인 화면 시작 -->
	<nav class="navbar navbar-default main_navi main_navi_sub">


		<div class="container main_navi_sub_list">
			<div class="table-responsive" id="myNavbar_sub">
				<table class="table table-striped table-bordered table-hover"
					id="table">
					<thead>
						<tr>
							<th><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.jsp"><span>최근 본 작품</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/favor_novel_list.jsp"><span>관심작품</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/bookmark_list.jsp"><span>책갈피</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/purchase_list.jsp"><span>구매내역</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/my_point.jsp"><span>내 포인트</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/my_info.jsp"><span>내정보</span></a></th>

						</tr>
					</thead>

				</table>





			</div>
		</div>
	</nav>

	<div class="container" id="content">
		<div class="table-responsive">
			<div class="table_container">
				<table class="table">
					<thead>
						<tr>
							<th>구매일자</th>
							<th>구분</th>
							<th>제목</th>
							<th></th>
							<th>금액</th>
							<th>대여기간</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>기간만료</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>기간만료</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>기간만료</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>기간만료</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>기간만료</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>구매</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 200원</td>
							<td>-</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>기간만료</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>기간만료</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>기간만료</td>
						</tr>
						<tr>
							<td>2016.10.03</td>
							<td>대여</td>
							<td><a href="#"><img alt="이드(개정판)"
									src="${pageContext.request.contextPath}/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
							<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
							<td>낱권 100원</td>
							<td>2일</td>
						</tr>
					</tbody>
				</table>
				<div id="pagination">
					<ul class="pagination">
						<li class="disabled"><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 메인 화면 끝 -->



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