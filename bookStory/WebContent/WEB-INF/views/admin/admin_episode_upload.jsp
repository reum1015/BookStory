<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
		
		<!-- admin css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/adminCommon.css"/>
		
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
						<a href="${pageContext.request.contextPath}/index.do" id="main_image_link"></a>
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
     				<a href="${pageContext.request.contextPath}/index.do" class="navbar-brand bookstoryhome">BookStory</a>
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




					
<!-- 메인 화면 시작 -->
<div class="container-fluid admin_main_container hidden-xs">
		<div class="row admin_main_row">
		<!-- 어드민 슬라이드 메뉴 영역 -->
			<div class="col-md-2 amdin_main_slider">
	    		<ul class="nav main_slider_nav" id="admin_main_menu">
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/admin_userInfo.do"><span class="glyphicon glyphicon-user pull-left icon_color" aria-hidden="true"></span>회원 정보</a></li>
	    			<li class="search_list"><a href="#upload_sub" data-toggle="collapse" data-parent="#admin_main_menu" id="accordion1">
	    			<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>업로드</a>
	    				<ul id="upload_sub" class="collapse">
	    					<li>공지사항 업로드</li>
	    					<li><a href="${pageContext.request.contextPath}/admin/novel_upload.do">신규 작품 업로드</a></li>
	    					<li><a href="${pageContext.request.contextPath}/admin/episode_upload.do">에피소드 업로드</a></li>
	    				</ul>
	    			</li>	
					
	    			<li class="search_list"><a href="#"><span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>게시물 관리</a></li>
	    			<li class="search_list"><a href="#"><span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>댓글 관리</a></li>
	    		</ul>
    	</div>
    	<!-- //어드민 슬라이드 메뉴 영역 -->
    		
	    	<!-- 어드민 컨텐트 영역 -->
			<div class="col-md-10 admin_content">
	    		
			<!-- 기존 Article Upload 폼 시작 -->
			<form class="form-horizontal existing_upload" enctype="multipart/form-data">
				<fieldset>
				
					<legend>기존 작품</legend>
					<div class="form-group">
					<label class="control-label col-xs-2" for="writer">검색 </label>
					<div class="col-xs-10 ">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="작가명 혹은 작품명" />
                    <span class="input-group-btn">
                        <button class="btn btn-info" type="button" style="background-color: #CD8F49; border-color:#CD8F49">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
						
						
					</div>
					</div>
				</div>
				
				<!-- 작품 제목 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="user_title">작품 제목 </label>
					<div class="col-xs-10">
												
								<select class="form-control" id="genre">
								<option>우아한 환생</option>
								<option>두입술 사이</option>
								<option>나쁜 관계</option>					
							</select>
						
					</div>
				</div>
				
							
				<!--  장르 & 요일 선택 -->
				<div class="form-group">

						<label for="genre" class="control-label col-xs-2">장르</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="genre">
								<option>로맨스</option>
								<option selected>SF&amp;판타지</option>
								<option>무협</option>
								<option>미스테리</option>
								<option>퓨전</option>							
							</select>
						</div>
						
						<label for="dayby" class="control-label col-xs-2">요일</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="genre">
								<option>월요일</option>
								<option>화요일</option>
								<option>수요일</option>
								<option>목요일</option>
								<option selected>금요일</option>
								<option>토요일</option>
								<option>일요일</option>							
							</select>
						</div>						
				</div>
				
				
				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="user_content">작품 내용</label>
					<div class="col-xs-10">
						<textarea class="form-control" rows="15"></textarea>
					</div>
				</div>

			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">파일첨부(리스트)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="file" multiple/>
				</div>
			</div>
				
				
				<!-- 작가 코멘트 -->

				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="content">작가 코멘트</label>
					<div class="col-xs-10">
						<textarea class="ckeditor form-control" rows="3" id="content"></textarea>
					</div>
				
				</div>
				
				    <div class="form-group">
			      <div class="col-xs-offset-2 col-xs-10">
			        <button type="submit" class="btn btn-success">전송</button>
			        <button type="button" class="btn btn-danger" onclick="history.back();">
					작성취소</button> 
			      </div>
			      </div>
			
				
			
			</fieldset>
			</form><!-- 신규 Article Upload 폼 시작 -->
					
	    	
	    	</div>
			<!-- //어드민 컨텐트 영역 -->
    		
		</div> <!-- end row -->


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
					질 수 있습니다.</small> <br> <img src="${pageContext.request.contextPath}/assets/imgs/main/homebutton.jpg" alt="저작권"  width="100" />   copyright&copy; All rights reserved.
			</address>
		</div>
	</footer>

	
	<!-- Javascript -->
		<script src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	    	
	</body>
</html>