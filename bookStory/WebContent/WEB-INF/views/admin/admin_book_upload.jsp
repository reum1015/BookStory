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
	    		
			
				<h1 class="page-header" id="upload_title">작품업로드</h1>
			
			
			<!-- 신규작품 Article Upload 폼 시작 -->
			<form class="form-horizontal new_upload" enctype="multipart/form-data" 
			action="${pageContext.request.contextPath}/admin/novel_upload_ok.do" id="novel_upload" method="post">
				<fieldset>
					<legend>신규작품</legend>
				<div class="form-group">
					<label class="control-label col-xs-2" for="book_author">작가명 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="book_author" name="book_author" placeholder="작가명을 입력해 주세요">
					</div>
				</div>
							
				<!--  장르 & 요일 선택 -->
				<div class="form-group">
			
						<label for="genre" class="control-label col-xs-2">장르선택</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="genre" name="genre" >
								<option value="romance">로맨스</option>
								<option value="fantasy">SF&amp;판타지</option>
								<option value="heroism">무협</option>
								<option value="mystery">미스테리</option>
								<option value="fusion">퓨전</option>							
							</select>
						</div>
						
						<label for="dayby" class="control-label col-xs-2">요일선택</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="daily_date" name="daily_date">
								<option value="MON">월요일</option>
								<option value="THE">화요일</option>
								<option value="WEN">수요일</option>
								<option value="THU">목요일</option>
								<option value="FRI">금요일</option>
								<option value="SAT">토요일</option>
								<option value="MON">일요일</option>							
							</select>
						</div>						
				</div>
				
				<!-- 작품 내용 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="book_name">작품 제목 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="book_name" name="book_name" placeholder="작품 제목을 입렵해 주세요 ">
					</div>
				</div>
				
				<!-- 작가 코멘트 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="intro">시놉시스</label>
					<div class="col-xs-10">
						<textarea class="ckeditor form-control" rows="3" id="intro" name="intro"></textarea>
					</div>
				</div>
				
			
			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">파일첨부(캐러셀)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="carousel" multiple/>
				</div>
			</div>
			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">파일첨부(메인)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="main" multiple/>
				</div>
			</div>
			
				<!-- 작가 코멘트 -->

				
				    <div class="form-group">
			      <div class="col-xs-offset-2 col-xs-10">
			        <button type="submit" class="btn btn-success">작품 등록</button>
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

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	    	
	</body>
</html>