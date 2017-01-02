<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메인 헤더 -->
<header class="main_header clearfix page-header hidden-xs">

	<!-- 메인 wrapper div -->
	<div class="container clearfix main_header_wrapperdiv">
		<c:choose>
			<c:when test="${loginInfo==null}">
				<!-- 메인 헤더 로그인 회원가입 화면-->
				<ul class="nav navbar-nav navbar-right hidden-xs">
					<li><a
						href="${pageContext.request.contextPath}/login/sign_up_agree.do"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a
						href="${pageContext.request.contextPath}/login/login.do"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<!-- 로그인 된 경우 -->
				<ul class="nav navber-nav navbar-right">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" style="padding: 5px">
							${loginInfo.nick_name}님 <span class="caret"></span>
					</a> <!-- 로그인한 경우 표시될 메뉴 -->
						<ul class="dropdown-menu">
							<li><a
								href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a></li>
							<li><a
								href="${pageContext.request.contextPath}/login/edit.do">회원정보
									수정</a></li>
							<li><a
								href="${pageContext.request.contextPath}/login/out.do">회원탈퇴</a></li>
						</ul></li>
				</ul>
				<!-- // 로그인 된 경우 -->
			</c:otherwise>
		</c:choose>
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
						href="${pageContext.request.contextPath}/mymenu/recentepisode_list.do">MyMenu</a></li>
					<c:if test="${member_level == 'BB'}">
						<li class="main_admin"><a
							href="${pageContext.request.contextPath}/admin/admin_main.do"
							class="main_navi_admin active">administrator</a></li>
					</c:if>
					<li><a
						href="${pageContext.request.contextPath}/login/sign_up_agree.do"
						class="visible-xs signup_icon"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a
						href="${pageContext.request.contextPath}/login/login.do"
						class="visible-xs login_icon"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
					<li>

						<form class="navbar-form navbar-left"
							action="${pageContext.request.contextPath}/book/BookSearch.do"
							method="post" id="search-form">
							<fieldset>

								<div class="col-xs-10">
									<div class="input-group">
										<input type="text" class="form-control col-xs-10"
											placeholder="작품명 or 작가명" id="keyword" name="keyword" /> <span
											class="input-group-btn">
											<button class="btn btn-info" type="submit"
												style="background-color: #CD8F49; border-color: #CD8F49">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</span>
									</div>
								</div>
							</fieldset>
						</form>


					</li>
				</ul>

			</div>
		</div>
	</div>
</nav>