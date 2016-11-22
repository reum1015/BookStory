<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우저에게 알려준다. 
			- ANSI(euc-kr), UTF-8 -->
		<meta charset="utf-8"/>
		<!-- IE의 호환성 보기 모드 금지 -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<!-- 스마트 장치에서의 해상도 균일화 처리 -->
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,
		maximum-scale=1.0,user-scalable=no">
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/icon/book01.png"/>
		<link rel="apple-touch-icon-precomposed" 
			  href="${pageContext.request.contextPath}/assets/icon/apple-touch-icon-144-precomposed.png"/>
			  
		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
		
		<!-- 나눔고딕 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nanumfont.css"/>
		
		<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css"/>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/navbarfont.css"/>
		
		<!-- bootstrap-tabs-x  -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/tab-x/bootstrap-tabs-x.min.css"/>
		
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
	    
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- Article css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/article/articleList.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/booklist/booklist.css" />
</head>

<body>

				<!-- 메인 헤더 -->
		<header class="main_header clearfix page-header hidden-xs">
			
			<!-- 메인 wrapper div -->
			<div class="container clearfix main_header_wrapperdiv">
				
				<!-- 메인 헤더 로그인 회원가입 화면-->
				     <ul class="nav navbar-nav navbar-right hidden-xs">
				        <li><a href="${pageContext.request.contextPath}/login/sign_up_agree.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				        <li><a href="${pageContext.request.contextPath}/login/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
   					</ul>
				
				<!-- 메인 헤더 이미지 -->
				<div class="container main_header_image">
					<h1 class="main_h1">
						<a href="index.do" id="main_image_link"></a>
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
				      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
     				<a href="index.do" class="navbar-brand bookstoryhome">BookStory</a>
    			</div>
    				<div class="container">
    					<div class="collapse navbar-collapse" id="myNavbar">
      						<ul class="nav navbar-nav">
						        <li class="todayNovel"><a href="${pageContext.request.contextPath}/todaynovel/today_novel.do">TodayNovel</a></li>
						        <li class="novelList"><a href="${pageContext.request.contextPath}/novellist/novel_list.do">NoveList</a></li>
						        <li class="community"><a href="${pageContext.request.contextPath}/community/article_list.do">Community</a></li>
						        <li class="mymenu"><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.do">MyMenu</a></li>
       							<li class="main_admin"><a href="${pageContext.request.contextPath}/admin/admin_main.do" class="main_navi_admin active">administrator</a></li>
        						<li><a href="#" class="visible-xs signup_icon"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        						<li><a href="#" class="visible-xs login_icon"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       							<li>
				        			<form class="navbar-form navbar-left pull-left search_form visible-xs" role="search" action="${pageContext.request.contextPath}/totalsearch/total_search.do">
							        	<fieldset>
							        	<div class="input-group form-group">
							        		
								        		<label class="sr-only" for="total_search">통합검색</label>
								          		<input type="text" class="form-control" placeholder="통합검색" id="total_search">
								        	
								          		<span class="input-group-btn">
								          			<button type="submit" class="btn btn-default">검색</button>
												</span>		          	
							          		
							          	</div>
							        	</fieldset>
							      	</form>
        
        
        						</li>
     					</ul>
 
	    	  		<div class="main_login">
						<form class="navbar-form navbar-left pull-right hidden-xs form-inline" role="search"  action="${pageContext.request.contextPath}/totalsearch/total_search.do">
				        	<fieldset>
				        	<div class="input-group input-group-sm">
				          		<input type="text" class="form-control" placeholder="통합검색">
				        		<span class="input-group-btn"> <button type="submit" class="btn btn-default">검색</button></span>
				        	</div>
				        	</fieldset>
				      	</form>
					</div>
      
    </div>
    </div>
  </div>
</nav>	

	<!-- 컨테인 영역 -->
	<div class="container">
		<div class="content">
			<div class="col-xs-6 col-sm-6">
				<h3>작품제목</h3>
				<p>
					글&nbsp&nbsp&nbsp&nbsp<a href="#">작가이름</a>
				</p>
			</div>
			<div class="col-xs-6 col-sm-6 content6">
				<a href="#"> <span class="favorite_module pull-right"> </span>
				</a>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 block_12">
			<img class="col-xs-5 col-sm-5"
				src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
				alt="그림">
			<div class="col-xs-7 col-sm-7 pull-left">
				<span class="grade_area"> <span class="stargrade"></span> <em>9.95</em>
				</span>
				<p class="info_book">
					<span>관심 <span class="">20,353</span>
					</span> <span class="publish"> 월, 금 연재 </span> <span class="genre">
						퓨전 </span>
				</p>
				<p class="dsc">‘마왕’과의 계약으로 운명을 볼 수 있는 눈을 갖게 된 소년, 공손천기. 그러나 그
					거래는 그에게 잔혹한 대가를 요구한다. 부조리한 운명에 거스르기 위한 공손천기의 필사적인 저항. 지금 죽은 자들의 왕,
					사자왕(死者王)이 무림에 강림한다!</p>
			</div>
			<a href="${pageContext.request.contextPath}/novelview/view_page.do" class="btn btn-primary">첫회 보기 </a> <a href="#"
				class="btn btn-default pull-right">전체 대여 </a> <a href="#"
				class="btn btn-default pull-right">전체 구입 </a>
		</div>
		<div class="col-xs-12 col-sm-12 block_12">
			<div class="col-xs-6 col-sm-6 pull-left">
				<h3>
					작품회차<span class="total">(10)</span>
				</h3>
			</div>
			<div class="col-xs-6 col-sm-6 btn_h3">
				<button class="btn btn-default pull-right">대여</button>
				<button class="btn btn-default pull-right">구입</button>
				<button class="btn btn-default pull-right">전체선택/해제</button>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_1">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">10. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">9. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">8. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">7. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">6. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">5. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">4. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">3. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">2. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">1. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
		</div>
	</div>
	<div class="jb-center">
		<ul class="pagination">
			<li class="disabled"><a href="#"><span
					class="glyphicon glyphicon-chevron-left"></span></a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span></a></li>
		</ul>
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
					질 수 있습니다.</small> <br> <img src="${pageContext.request.contextPath}/assets/imgs/main/homebutton.jpg" alt="저작권"  width="100" />   copyright&copy; All rights reserved.
			</address>
		</div>
	</footer>

	
	<!-- Javascript -->
	    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>