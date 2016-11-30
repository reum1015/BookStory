<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="#" class="visible-xs signup_icon"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="#" class="visible-xs login_icon"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li>
						<form
							class="navbar-form navbar-left pull-left search_form visible-xs"
							role="search"
							action="${pageContext.request.contextPath}/totalsearch/total_search.do">
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
						role="search"
						action="${pageContext.request.contextPath}/totalsearch/total_search.do">
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