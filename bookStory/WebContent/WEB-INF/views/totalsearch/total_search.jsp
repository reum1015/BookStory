<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
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
		<link rel="shortcut icon" href="../assets/icon/book01.png"/>
		<link rel="apple-touch-icon-precomposed" 
			  href="assets/icon/apple-touch-icon-144-precomposed.png"/>
			  
		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css"/>
		
		<!-- 나눔고딕 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="../assets/css/nanumfont.css"/>
		
		<!-- main css -->
		<link rel="stylesheet" type="text/css" href="../assets/css/main.css"/>
		
		<link rel="stylesheet" type="text/css" href="../assets/css/navbarfont.css"/>
		
		
		<link rel="stylesheet" type="text/css" href="../assets/css/app/app.css"/>
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
	
	<link rel="stylesheet" type="text/css" href="../assets/css/totalSearch/total_search.css" />
	<script type="text/javascript">
		


	
	</script>


</head>
<body>

		<!-- 메인 헤더 -->
		<header class="main_header clearfix page-header hidden-xs">
			
			<!-- 메인 wrapper div -->
			<div class="container clearfix main_header_wrapperdiv">
				
				<!-- 메인 헤더 로그인 회원가입 화면-->
				     <ul class="nav navbar-nav navbar-right hidden-xs">
				        <li><a href="../Login/SignUpAgree.html"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				        <li><a href="../Login/Login.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
   					</ul>
				
				<!-- 메인 헤더 이미지 -->
				<div class="container main_header_image">
					<h1 class="main_h1">
						<a href="../index.html" id="main_image_link"></a>
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
     				<a href="../index.html" class="navbar-brand bookstoryhome">BookStory</a>
    			</div>
    				<div class="container">
    					<div class="collapse navbar-collapse" id="myNavbar">
      						<ul class="nav navbar-nav">
						        <li class="todayNovel"><a href="../todayNovel/todayNovel.html">TodayNovel</a></li>
						        <li class="novelList"><a href="../novelList/novelList.html">NoveList</a></li>
						        <li class="community"><a href="../community/articleList.html">Community</a></li>
						        <li class="mymenu"><a href="../myMenu/recentNovelList.html">MyMenu</a></li>
       							<li class="main_admin"><a href="../admin/adminUserInfo.html" class="main_navi_admin active">administrator</a></li>
       				    
        						<li><a href="#" class="visible-xs"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        						<li><a href="#" class="visible-xs"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       							<li>
				        			<form class="navbar-form navbar-left pull-left search_form visible-xs" role="search">
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
						<form class="navbar-form navbar-left pull-right hidden-xs form-inline" role="search">
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



	<!-- 메인 컨텐트 시작 -->


    <div class="container search_container">
    
    <div class="row total_row">
    	<div class="col-md-2 slider_menu">
    		<ul class="nav slider_nav">
    			<li class="search_list"><a href="#">통합검색<span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a></li>
    			<li class="search_list"><a href="#">작품<span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a></li>
    			<li class="search_list"><a href="#">로맨스<span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a></li>
    			<li class="search_list"><a href="#">SF&amp;판타지<span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a></li>
    			<li class="search_list"><a href="#">무협<span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a></li>
    			<li class="search_list"><a href="#">미스테리<span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a></li>
    			<li><a href="#">퓨전<span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a></li>
    			<li><a href="#">자유게시판<span class="glyphicon glyphicon-menu-right pull-right" aria-hidden="true"></span></a></li>
    			
    			
    		
    		</ul>
    	
    	</div>
    	<div class="col-md-10 result_content">
    		<h1>검색 결과</h1>
				
    	
    	</div>
    
    
    
    </div><!-- End Row -->
    
 
 

			
 	</div><!--/.container-->

 


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
					질 수 있습니다.</small> <br> <img src="../assets/imgs/main/homebutton.jpg" alt="저작권"  width="100" />   copyright&copy; All rights reserved.
			</address>
		</div>
	</footer>
	<!-- Javascript -->

		
	    <script src="../assets/js/jquery.min.js"></script>
	    <script src="../assets/js/bootstrap.min.js"></script>
</body>
</html>