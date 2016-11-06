<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
	String root = application.getRealPath("/");
	System.out.println(root);

	String tom = application.getServerInfo();
	System.out.println(tom);
	
	String root1 = request.getRealPath("/");
	
	System.out.println(root1);
	
%>
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
		<link rel="shortcut icon" href="assets/icon/book01.png"/>
		<link rel="apple-touch-icon-precomposed" 
			  href="assets/icon/apple-touch-icon-144-precomposed.png"/>
			  
		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
		
		<!-- 나눔고딕 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="assets/css/nanumfont.css"/>
		
		<link rel="stylesheet" type="text/css" href="assets/css/navbarfont.css"/>
		
		<!-- main css -->
		<link rel="stylesheet" type="text/css" href="assets/css/main.css"/>
		
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
	</head>
	<body>

		<!-- 메인 헤더 -->
		<header class="main_header clearfix page-header">
			
			<!-- 메인 wrapper div -->
			<div class="container clearfix main_header_wrapperdiv">
				
				<!-- 메인 헤더 로그인 회원가입 화면-->
				     <ul class="nav navbar-nav navbar-right hidden-xs">
				        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
   					</ul>
				
				<!-- 메인 헤더 이미지 -->
				<div class="container main_header_image">
					<h1 class="main_h1"></h1>
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
     				<a href="/bookstorylocal/index.jsp" class="navbar-brand bookstoryhome">BookStory</a>
    			</div>
    				<div class="container">
    					<div class="collapse navbar-collapse" id="myNavbar">
      						<ul class="nav navbar-nav">
						        <li><a href="#">TodayNovel</a></li>
						        <li><a href="#">NoveList</a></li>
						        <li><a href="#">Community</a></li>
						        <li><a href="#">MyMenu</a></li>
       							<li><a href="admin/adminUserInfo.html" class="main_navi_admin">administrator</a></li>
       				    
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
			      <a href="#"><img src="assets/imgs/carousel/01.png" alt="..."></a>
			      <div class="carousel-caption">
			        	<h4>내용입력</h4>
			      </div>
			    </div>
			    <div class="item">
			      <a href="#"><img src="assets/imgs/carousel/02.png" alt="..."></a>
			      <div class="carousel-caption">
			        	<h4>내용입력</h4>
			      </div>
			    </div>
			       <div class="item">
			      <a href="#"><img src="assets/imgs/carousel/03.png" alt="..."></a>
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
		            	 <button class="btn btn-default dropdown-toggle pull-right genre_button" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
							    장르선택
							  <span class="caret"></span>
						 </button>
						  <ul class="dropdown-menu pull-right" role="menu" aria-labelledby="dropdownMenu1">
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">로맨스</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">SF&amp;판타지</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">무협</a></li>
						    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">미스테리</a></li>
						  </ul>
					</div>
       		    <!-- 장르별 추천작 & 드롭다운 메뉴(장르 선택) 끝 -->   
       
       
       <!-- 장르별 추천작 리스트 -->
        <div class="row genre_row">
             <!-- 항목1 -->
             <div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="assets/imgs/genre/mainlist01.png" class="main_list_img">
								
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
								<img alt="thumb" src="assets/imgs/genre/mainlist02.png" class="main_list_img">
								
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
								<img alt="thumb" src="assets/imgs/genre/mainlist03.png" class="main_list_img">
								
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
								<img alt="thumb" src="assets/imgs/genre/mainlist04.png" class="main_list_img">
								
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
		
		  <!-- 장르별 추천작 리스트 끝-->
	
		
		<!-- 남여별 인기작 & 통합 랭킹 -->

		<div class="row gender_row">
			
			<!-- 남녀별 인기작 -->
			<div class="col-xs-12 col-sm-8 text-left section_area list_gender box">
				<h4>남여별 인기작</h4>
	  
	  			
	    			<div class="col-xs-6 col-md-4 list_gender_li">
	    				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="assets/imgs/gender/list01.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
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
	    					
		      				
		       					<img class="gender_list_img img-response" src="assets/imgs/gender/list02.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
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
	    					
		      				
		       					<img class="gender_list_img img-response" src="assets/imgs/gender/list03.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	  
				
	    			<div class="col-xs-6 col-md-4 list_gender_li  list_gender_04">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="assets/imgs/gender/list04.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
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
	    					
		      				
		       					<img class="gender_list_img img-response" src="assets/imgs/gender/list05.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>
	    			
	    			<div class="col-xs-6 col-md-4 list_gender_li  list_gender_06">
	      				<div class="thumbnail main_gender_list">
	    					<a href="#" >
	    					<span class="gender_list_skin"></span>
	    					
		      				
		       					<img class="gender_list_img img-response" src="assets/imgs/gender/list06.jpg" alt="Pulpit Rock" style="width:100%;height:100%">
		      				
		      				
								<span class="main_gender_info">
									<span class="gender_title">위험한 신혼부부</span>
									<span class="gender_author">박수정(방울마마)</span>
								
							</span>	
							</a>
	      				</div>
	    			</div>

	    		</div>
	  		
			<!-------- 통합 랭킹 ---------->
			<div class="col-xs-12 col-sm-4 text-center section_area list_rank box">
				
  						<h4 class="text-left">통합 랭킹</h4>
  							<div class="btn-group btn-group-justified totla_rank_gender">
							  <a href="#" class="btn btn-primary">남자</a>
							  <a href="#" class="btn btn-primary">여자</a>
							  
							</div>
  							
							<ul class="nav nav-tabs">
							  <li class="active"><a href="#">Home</a></li>
							  <li><a href="#">Menu 1</a></li>
							  <li><a href="#">Menu 2</a></li>
							  <li><a href="#">Menu 3</a></li>
							</ul>
  						
  							<div class="list-group">
							    <a href="#" class="list-group-item">
									<span class="ranking_img">
										<img alt="" src="">
									</span>
									<span class="ranking_title">1.선생님의 이름으로</span>
									<span class="ranking_author">하이린</span>
							    </a>
							    <a href="#" class="list-group-item">
									<span class="ranking_img">
										<img alt="" src="">
									</span>
									<span class="ranking_title">2.선생님의 이름으로</span>
									<span class="ranking_author">하이린</span>
							    </a>
							    <a href="#" class="list-group-item">
								<span class="ranking_img">
										<img alt="" src="">
									</span>
									<span class="ranking_title">3.선생님의 이름으로</span>
									<span class="ranking_author">하이린</span>
							    </a>
							    <a href="#" class="list-group-item">
								<span class="ranking_img">
										<img alt="" src="">
									</span>
									<span class="ranking_title">4.선생님의 이름으로</span>
									<span class="ranking_author">하이린</span>
							    </a>
							    <a href="#" class="list-group-item">
								<span class="ranking_img">
										<img alt="" src="">
									</span>
									<span class="ranking_title">5.선생님의 이름으로</span>
									<span class="ranking_author">하이린</span>
							    </a>
							    <a href="#" class="list-group-item">
								<span class="ranking_img">
										<img alt="" src="">
									</span>
									<span class="ranking_title">6.선생님의 이름으로</span>
									<span class="ranking_author">하이린</span>
							    </a>
							    <a href="#" class="list-group-item">
								<span class="ranking_img">
										<img alt="" src="">
									</span>
									<span class="ranking_title">7.선생님의 이름으로</span>
									<span class="ranking_author">하이린</span>
							    </a>
							    <a href="#" class="list-group-item">
								<span class="ranking_img">
										<img alt="" src="">
									</span>
									<span class="ranking_title">8.선생님의 이름으로</span>
									<span class="ranking_author">하이린</span>
							    </a>								    								   							    							    							    
  							</div>

				
				
				</div>
			</div>
		</div>
		
		</div>
		<!-- 메인 섹션 끝 -->
	

	<footer class="page-footer main_footer text-center">
		<div class="container footer_container">
			<p class="text-center">
			<h5>
				<a href="#">이용약관</a> / <a href="#">운영원칙</a> / <a href="#">개인정보
					취급방침</a> / <a href="#">책임의 한계와 법적고지</a>
			</h5>

			<address>
				<small>본 콘텐츠의 저작권은 제공처에 있으며, 이를 무단 이용하는경우 저작권법 등에 따라 법적 책임을
					질 수 있습니다.</small> <br> <img src="assets/imgs/main/homebutton.jpg" alt="저작권"  width="100" />   copyright&copy; All rights reserved.
			</address>
		</div>
	</footer>

	
	
		<!-- Javascript -->
	    <script src="assets/js/jquery.min.js"></script>
	    <script src="assets/js/bootstrap.min.js"></script>
	</body>
</html>
