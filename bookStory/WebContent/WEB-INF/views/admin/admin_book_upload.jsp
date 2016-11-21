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
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/icon/book01.png"/>
		<link rel="apple-touch-icon-precomposed" 
			  href="assets/icon/apple-touch-icon-144-precomposed.png"/>
		  
		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
		
		<!-- 나눔고딕 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nanumfont.css"/>
		
		<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css"/>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/navbarfont.css"/>
		
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
		
		$(function(){
			
			$(".existing_upload").css('display','none');
			$(".new_button").css('background-color','#FFEBCD');
			
			$(".new_button").click(function(){
				$(".existing_upload").css('display','none');
				$(".new_upload").css('display','block');
				$(".new_button").css('background-color','#FFEBCD');
				$(".existing_button").css('background-color','#FFF');
			});
			
			$(".existing_button").click(function(){
				$(".new_upload").css('display','none');
				$(".existing_upload").css('display','block');
				$(".existing_button").css('background-color','#FFEBCD');
				$(".new_button").css('background-color','#FFF');
			});
			
			
			
		});
		</script>
		
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
				        <li><a href="${pageContext.request.contextPath}/login/sign_up_agree.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				        <li><a href="${pageContext.request.contextPath}/login/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
						        <li class="todayNovel"><a href="${pageContext.request.contextPath}/todaynovel/mon_novel.jsp">TodayNovel</a></li>
						        <li class="novelList"><a href="${pageContext.request.contextPath}/novellist/novel_list.jsp">NoveList</a></li>
						        <li class="community"><a href="${pageContext.request.contextPath}/community/article_list.jsp">Community</a></li>
						        <li class="mymenu"><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.jsp">MyMenu</a></li>
       							<li class="main_admin"><a href="${pageContext.request.contextPath}/admin/admin_main.jsp" class="main_navi_admin active">administrator</a></li>
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




					<nav class="navbar navbar-default main_navi main_navi_sub">
  							<div class="container main_navi_sub_list">
    							<div class="" id="myNavbar_sub">
		      						<ul class="nav navbar-nav">
								        <li><a href="${pageContext.request.contextPath}/admin/adminUserInfo.jsp">회원 관리</a></li>
								        <li><a href="${pageContext.request.contextPath}/admin/replyManage.jsp">게시글 댓글 관리</a></li>
								        <li><a href="${pageContext.request.contextPath}/admin/articleUpload.jsp">작품 올리기</a></li>
		     						</ul>
	    						</div>
    						</div>
					</nav>	
<!-- 메인 화면 시작 -->
	<div class="container main_container">
	
	
		<div class="article_upload_container">
			<h1 class="page-header" id="upload_title">작품업로드
			     
			

                  <a href="#" class="btn btn-default new_button" role="button">신규</a>
					<a href="#" class="btn btn-default existing_button" role="button">기존작품</a>
			</h1>
			
			
			<!-- 신규작품 Article Upload 폼 시작 -->
			<form class="form-horizontal new_upload" enctype="multipart/form-data">
				<fieldset>
					<legend>신규작품</legend>
				<div class="form-group">
					<label class="control-label col-xs-2" for="writer">작가명 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="writer" name="writer" placeholder="아이디를 입력해 주세요">
						
					</div>
				</div>
							
				<!--  장르 & 요일 선택 -->
				<div class="form-group">
			
						<label for="genre" class="control-label col-xs-2">장르선택</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="genre">
								<option>로맨스</option>
								<option>SF&amp;판타지</option>
								<option>무협</option>
								<option>미스테리</option>
								<option>퓨전</option>							
							</select>
						</div>
						
						<label for="dayby" class="control-label col-xs-2">요일선택</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="genre">
								<option>월요일</option>
								<option>화요일</option>
								<option>수요일</option>
								<option>목요일</option>
								<option>금요일</option>
								<option>토요일</option>
								<option>일요일</option>							
							</select>
						</div>						
				</div>
				
				<!-- 작품 내용 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="user_title">작품 제목 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="user_title" name="user_title" placeholder="작품 제목을 입렵해 주세요 ">
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
				<label for="file" class="col-xs-2 control-label">파일첨부(캐러셀)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="file" multiple/>
				</div>
			</div>
			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">파일첨부(메인)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="file" multiple/>
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
                        <button class="btn btn-info" type="button">
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

						<label for="genre" class="control-label col-xs-2">장르선택</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="genre">
								<option>로맨스</option>
								<option selected>SF&amp;판타지</option>
								<option>무협</option>
								<option>미스테리</option>
								<option>퓨전</option>							
							</select>
						</div>
						
						<label for="dayby" class="control-label col-xs-2">요일선택</label>
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