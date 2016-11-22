<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
	<head>
	<!-- 최아름 -->
	<!-- dddd -->
	<!-- 수정용 -->
	
	<!-- djdjdj -->
	<!-- 깃허브 주석 -->
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
	    
	    <style type="text/css">
	    .ui-tabs .ui-tabs-nav { list-style: none; position: relative; padding: 0; margin: 0; }
		.ui-tabs .ui-tabs-nav li { position: relative; float: left; margin: 0 3px -2px 0; padding: 0; }
		.ui-tabs .ui-tabs-nav li a { display: block; padding: 10px 20px; background: #f0f0f0; border: 2px #cccccc solid; border-bottom-color: #cccccc; outline: none; border-radius: 4px 4px 0px 0px; color: rgb(85, 85, 85); text-decoration: none; }
		.ui-tabs .ui-tabs-nav li a.active { display: block; padding: 10px 20px; background: #ffffff; border: 2px #cccccc solid; border-bottom-color: #ffffff; outline: none; border-radius: 4px 4px 0px 0px; color: #000000; }
		.ui-tabs .ui-tabs-nav li.ui-tabs-selected a { padding: 10px 20px 12px 20px; background: purple; border-bottom-style: none; border-radius: 0px 0px 0px 0px; }
		.ui-tabs .ui-tabs-nav li.ui-tabs-selected a, .ui-tabs .ui-tabs-nav li.ui-state-disabled a, .ui-tabs .ui-tabs-nav li.ui-state-processing a { cursor: default; }
		.ui-tabs .ui-tabs-nav li a, .ui-tabs.ui-tabs-collapsible .ui-tabs-nav li.ui-tabs-selected a { cursor: pointer; }
		.ui-tabs .ui-tabs-panel { display: block; clear: both; border: 2px #cccccc solid; padding: 10px; border-radius: 0px 4px 4px 4px; }
		.ui-tabs .ui-tabs-hide  { display: none; }
		
		.three ul.nav li a.primary-text {color: #008400;}
		.three ul.nav li a.muted-text {color: #666666;}
		.three ul.nav li a:hover {color: #222222;}
		.three .nav-tabs > li { border-radius: 0}
		.three .nav-tabs > li.active > a { border-top: 2px solid #008400;}

		.nav-tabs > li > a { margin-right: 2px; line-height: 1.42857; border: 1px solid transparent; border-radius: 0px; }
	    
		
	    </style>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
			$(function(){
				
				$(".male_button").click(function(){
					$(".main_gender_list_female").css('display','none');
					$(".main_gender_list_male").css('display', 'block');
					$(".male_button").css('background-color','#FFEBCD');
					$(".female_button").css('background-color','#FFF');
				});
				
				$(".female_button").click(function(){
					$(".main_gender_list_female").css('display','block');
					$(".main_gender_list_male").css('display', 'none');
					$(".male_button").css('background-color','#FFF');
					$(".female_button").css('background-color','#FFEBCD');
				});
				
			});
		</script>
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
						<a href="/index.do" id="main_image_link"></a>
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
     				<a href="/index." class="navbar-brand bookstoryhome">BookStory</a>
    			</div>
    				<div class="container">
    					<div class="collapse navbar-collapse" id="myNavbar">
      						<ul class="nav navbar-nav">
      						
      						
      						
      							<!-- 주석용 깃허브 -->
						        <li class="todayNovel"><a href="${pageContext.request.contextPath}/todaynovel/mon_novel.do">TodayNovel</a></li>
						        <li class="novelList"><a href="${pageContext.request.contextPath}/novellist/novel_list.jsp">NoveList</a></li>
						        <li class="community"><a href="${pageContext.request.contextPath}/community/article_list.jsp">Community</a></li>
						        <li class="mymenu"><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.jsp">MyMenu</a></li>
       							<li class="main_admin"><a href="${pageContext.request.contextPath}/admin/admin_main.do" class="main_navi_admin active">administrator</a></li>
        						<li><a href="#" class="visible-xs signup_icon"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        						<li><a href="#" class="visible-xs login_icon"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       							<li>
				        			<form class="navbar-form navbar-left pull-left search_form visible-xs" role="search" action="${pageContext.request.contextPath}/totalsearch/total_search.jsp">
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
						<form class="navbar-form navbar-left pull-right hidden-xs form-inline" role="search"  action="${pageContext.request.contextPath}/totalsearch/total_search.jsp">
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



	<!-- 메인 섹션 시작 -->
	<div class="container main_container">
	
		<!-- 캐러셀 시작 -->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			  <!-- Indicators -->
			  <ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			  </ol>
			
			  <!-- Wrapper for slides -->
			  <div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <a href="#"><img src="${pageContext.request.contextPath}/assets/imgs/carousel/01.png" alt="..."></a>
			      <div class="carousel-caption">
			        	<h4>내용입력</h4>
			      </div>
			    </div>
			    <div class="item">
			      <a href="#"><img src="${pageContext.request.contextPath}/assets/imgs/carousel/02.png" alt="..."></a>
			      <div class="carousel-caption">
			        	<h4>내용입력</h4>
			      </div>
			    </div>
			       <div class="item">
			      <a href="#"><img src="${pageContext.request.contextPath}/assets/imgs/carousel/03.png" alt="..."></a>
			      <div class="carousel-caption">
			        	<h4>내용입력</h4>
			      </div>
			    </div>
			  </div>

			  <!-- Controls -->
			  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
			    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		<!-- 캐러셀 끝 -->
		
		<!-- 장르별 추천작 시작-->
            <!-- 장르별 추천작 & 드롭다운 메뉴(장르 선택) -->
					<div class="dropdown genre_choice">
						<h4 id="genre_title">장르별 추천작</h4>
		            	   <div class="btn-group pull-right check_button">
								<button type="button" data-toggle="dropdown" class="btn btn-warning dropdown-toggle">장르선택 <span class="caret"></span></button>
									<ul class="dropdown-menu">
										   <li><a href="#">로맨스</a></li>
										     <li><a href="#">SF&amp;판타지</a></li>
										     <li ><a href="#">무협</a> </li>
										     <li ><a href="#">미스터리</a> </li>
										     <li ><a href="#">퓨전</a> </li>
										               
										            </ul>
							</div>
					</div>
       		    <!-- 장르별 추천작 & 드롭다운 메뉴(장르 선택) 끝 -->   
       
       
       <!-- 장르별 추천작 리스트 -->
        <div class="row genre_row">
             <!-- 항목1 -->
             <div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="bookList/bookList.html" class="main_alist">
								<span class="icon_new"></span>
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	<span class="genre">미스테리</span>
				                    	<span class="subj v2">르네 마그리트의 '연인'</span>
				                    	
				                    	<span>
				                    		<span class="author v2">유지나</span> 
				                    		<span class="num_total">총 5회</span>
				                    	</span>
				                    	<span class="score_area">
											<span class="icon_star"></span>
											<em class="score">9.94</em>
										</span>
				                    	<span class="favorite">
											<span>관심</span>
											<span>22,215</span>
										</span>
										<span class="emptybox">
										
										</span>
									</span>
							</a>
						</div>
					</div>
            
            
            <!-- 항목2 -->
             <div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
							<span class="icon_com"></span>
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist02.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	<span class="genre">미스테리</span>
				                    	<span class="subj v2">르네 마그리트의 '연인'</span>
				                    	
				                    	<span>
				                    		<span class="author v2">유지나</span> 
				                    		<span class="num_total">총 5회</span>
				                    	</span>
				                    	<span class="score_area">
											<span class="icon_star"></span>
											<em>9.94</em>
										</span>
				                    	<span class="favorite">
											<span>관심</span>
											<span>22,215</span>
										</span>
										<span class="emptybox">
										
										</span>
									</span>
							</a>
						</div>
					</div>
		
            <!-- 항목3 -->
             <div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist03.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	<span class="genre">미스테리</span>
				                    	<span class="subj v2">르네 마그리트의 '연인'</span>
				                    	
				                    	<span>
				                    		<span class="author v2">유지나</span> 
				                    		<span class="num_total">총 5회</span>
				                    	</span>
				                    	<span class="score_area">
											<span class="icon_star"></span>
											<em>9.94</em>
										</span>
				                    	<span class="favorite">
											<span>관심</span>
											<span>22,215</span>
										</span>
										<span class="emptybox">
										
										</span>
									</span>
							</a>
						</div>
					</div>
		

            <!-- 항목4 -->
             <div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist04.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	<span class="genre">미스테리</span>
				                    	<span class="subj v2">르네 마그리트의 '연인'</span>
				                    	
				                    	<span>
				                    		<span class="author v2">유지나</span> 
				                    		<span class="num_total">총 5회</span>
				                    	</span>
				                    	<span class="score_area">
											<span class="icon_star"></span>
											<em>9.94</em>
										</span>
				                    	<span class="favorite">
											<span>관심</span>
											<span>22,215</span>
										</span>
										<span class="emptybox">
										
										</span>
									</span>
							</a>
						</div>
					</div>
				
			</div> <!-- 장르별 추천작 리스트 끝-->
		  
	
		
		<!-- 남여별 인기작 & 통합 랭킹 -->

		<div class="row gender_row">
			
			<!-- 남녀별 인기작 -->
			<div class="col-xs-12 col-sm-8 text-left section_area list_gender box">
				
				
				<div class="list_gender_titleButton_div">
					<h4 class="list_gender_title">남여별 인기작</h4>
		  
		  			<div class="btn-group list_gender_button" data-toggle="buttons">
	
					<a href="#" class="btn btn-default female_button" role="button">여성</a>
					<a href="#" class="btn btn-default male_button" role="button">남성</a>

					</div>
				</div>
				
				
				<div class="main_gender_list_female">					
	    			<div class="col-xs-6 col-md-4 list_gender_li">
	    				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					<span class="icon_new"></span>
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list01.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    
	    			<div class="col-xs-6 col-md-4 list_gender_li  list_gender_02">
	    				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list02.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	
	    			<div class="col-xs-6 col-md-4 list_gender_li">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					<span class="icon_com"></span>
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list03.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	  
				
	    			<div class="col-xs-6 col-md-4 list_gender_li list_gender_04">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list04.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    			
	    			<div class="col-xs-6 col-md-4 list_gender_li">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list05.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    			
	    			<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    		</div>	
	    		<!-- 남여별 인기작 숨김영역 남자 -->	
	    		<div class="main_gender_list_male">	
	    			<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    			
	    			<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    			
	    			<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    			
	    			<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    			
	    			<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    			
	    			<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>

	    			</div>
	  			</div>
			<!-------- 연령별 선호작  ---------->
			<div class="col-xs-12 col-sm-4 text-center section_area list_rank box">
  						<h4 class="text-left">연령별 선호작품</h4>
						<div class="btn-group btn-group-justified" role="group" aria-label="...">
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default">남자</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default">여자</button>
							  </div>

						</div>
						<div class="row empty_box_rank"></div>

						<!-- tab-x -->
						<div id="btn-group-justified">
						   <ul class="nav nav-tabs nav-justified">
						    <li class="active"><a data-toggle="tab" href="#home">10대</a></li>
						    <li><a data-toggle="tab" href="#menu1">20대</a></li>
						    <li><a data-toggle="tab" href="#menu2">30대</a></li>
						    <li><a data-toggle="tab" href="#menu3">40대</a></li>
						  </ul>
						
						  <div class="tab-content total_ranking_tab">
						    <div id="home" class="tab-pane fade in active">
						      <ul class="list-group listgroup_rank">
							      	<li  class="list-group-item text-"><a href="#">[판타지]마왕군 네크로맨서</a></li>
							      	<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
	     							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
	      							<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>	
	      							<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>	
	      							<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>	
	      							<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>	
	      							<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은 장미 아가씨</a></li>
	      							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
     				 			</ul>
     				 		</div>	
				    <div id="menu1" class="tab-pane fade">
				       <ul class="list-group listgroup_rank">
							      	<li  class="list-group-item text-"><a href="#">[판타지]마왕군 네크로맨서</a></li>
							      	<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
	     							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
	      							<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>	
	      							<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>	
	      							<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>	
	      							<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>	
	      							<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은 장미 아가씨</a></li>
	      							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>	
     				 			</ul>
				    </div>
				    <div id="menu2" class="tab-pane fade">
				    <ul class="list-group listgroup_rank">
							      	<li  class="list-group-item text-"><a href="#">[판타지]마왕군 네크로맨서</a></li>
							      	<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
	     							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
	      							<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>	
	      							<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>	
	      							<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>	
	      							<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>	
	      							<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은 장미 아가씨</a></li>
	      							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>	
     				 			</ul>
				    </div>
				    <div id="menu3" class="tab-pane fade">
				      <ul class="list-group listgroup_rank">
							      	<li  class="list-group-item text-"><a href="#">[판타지]마왕군 네크로맨서</a></li>
							      	<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
	     							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
	      							<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>	
	      							<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>	
	      							<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>	
	      							<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>	
	      							<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은 장미 아가씨</a></li>
	      							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>	
     				 			</ul>
				    </div>
				  </div>
				</div>
			
		
							<!-- //tab-x end -->
							
					</div><!-- 연령별 선호작 끝 -->
				
				</div> <!-- 남여별 인기작 & 통합 랭킹 끝 -->
			
			</div><!-- 메인 섹션 끝 -->
			
			<!-- footer include -->
		
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
		<script src="${pageContext.request.contextPath}/assets/js/tab-x/bootstrap-tabs-x.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	</body>
</html>