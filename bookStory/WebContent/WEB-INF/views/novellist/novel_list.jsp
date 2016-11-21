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
		
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/novelList.css"/>
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
	    
	    /**완성작 보기 체크박스*/
			@import('https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.0/css/bootstrap.min.css') 
			
			.funkyradio div {
			  clear: both;
			  overflow: hidden;
			}
			
			.funkyradio label {
			  width: 100%;
			  border-radius: 3px;
			  border: 1px solid #D1D3D4;
			  font-weight: normal;
			}
			
			.funkyradio input[type="radio"]:empty,
			.funkyradio input[type="checkbox"]:empty {
			  display: none;
			}
			
			.funkyradio input[type="radio"]:empty ~ label,
			.funkyradio input[type="checkbox"]:empty ~ label {
			  position: relative;
			  line-height: 2.5em;
			  text-indent: 3.25em;
			  margin-top: 2em;
			  cursor: pointer;
			  -webkit-user-select: none;
			     -moz-user-select: none;
			      -ms-user-select: none;
			          user-select: none;
			}
			
			.funkyradio input[type="radio"]:empty ~ label:before,
			.funkyradio input[type="checkbox"]:empty ~ label:before {
			  position: absolute;
			  display: block;
			  top: 0;
			  bottom: 0;
			  left: 0;
			  content: '';
			  width: 2.5em;
			  background: #D1D3D4;
			  border-radius: 3px 0 0 3px;
			}
			
			.funkyradio input[type="radio"]:hover:not(:checked) ~ label,
			.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label {
			  color: #888;
			}
			
			.funkyradio input[type="radio"]:hover:not(:checked) ~ label:before,
			.funkyradio input[type="checkbox"]:hover:not(:checked) ~ label:before {
			  content: '\2714';
			  text-indent: .9em;
			  color: #C2C2C2;
			}
			
			.funkyradio input[type="radio"]:checked ~ label,
			.funkyradio input[type="checkbox"]:checked ~ label {
			  color: #777;
			}
			
			.funkyradio input[type="radio"]:checked ~ label:before,
			.funkyradio input[type="checkbox"]:checked ~ label:before {
			  content: '\2714';
			  text-indent: .9em;
			  color: #333;
			  background-color: #ccc;
			}
			
			.funkyradio input[type="radio"]:focus ~ label:before,
			.funkyradio input[type="checkbox"]:focus ~ label:before {
			  box-shadow: 0 0 0 3px #999;
			}
			
			.funkyradio-default input[type="radio"]:checked ~ label:before,
			.funkyradio-default input[type="checkbox"]:checked ~ label:before {
			  color: #333;
			  background-color: #ccc;
			}
			
			.funkyradio-primary input[type="radio"]:checked ~ label:before,
			.funkyradio-primary input[type="checkbox"]:checked ~ label:before {
			  color: #fff;
			  background-color: #337ab7;
			}
			
			.funkyradio-success input[type="radio"]:checked ~ label:before,
			.funkyradio-success input[type="checkbox"]:checked ~ label:before {
			  color: #fff;
			  background-color: #5cb85c;
			}
			
			.funkyradio-danger input[type="radio"]:checked ~ label:before,
			.funkyradio-danger input[type="checkbox"]:checked ~ label:before {
			  color: #fff;
			  background-color: #d9534f;
			}
			
			.funkyradio-warning input[type="radio"]:checked ~ label:before,
			.funkyradio-warning input[type="checkbox"]:checked ~ label:before {
			  color: #fff;
			  background-color: #f0ad4e;
			  
			}
			
			.funkyradio-info input[type="radio"]:checked ~ label:before,
			.funkyradio-info input[type="checkbox"]:checked ~ label:before {
			  color: #fff;
			  background-color: #5bc0de;
			}
			
			.check_label{
				margin: 0;
				margin-top: 10px !important;
			}
			
			.check_button{
				margin-top: 10px;
			}
			
			
	    </style>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">
		
		

		</script>

		<link rel="stylesheet" type="text/css" 
				href="${pageContext.request.contextPath}/assets/css/naviStateColor/novelListCommon.css"/>
		<link rel="stylesheet" type="text/css" href="/bookstorylocal/assets/css/build.css"/>
		
		<link rel=”stylesheet” href=”//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css”>

	<body>

				<!-- 메인 헤더 -->
		<header class="main_header clearfix page-header hidden-xs">
			
			<!-- 메인 wrapper div -->
			<div class="container clearfix main_header_wrapperdiv">
				
				<!-- 메인 헤더 로그인 회원가입 화면-->
				     <ul class="nav navbar-nav navbar-right hidden-xs">
				        <li><a href="${pageContext.request.contextPath}/Login/SignUpAgree.jsp"><span class="glyphicon glyphicon-user signup_icon"></span> Sign Up</a></li>
				        <li><a href="${pageContext.request.contextPath}/Login/Login.jsp"><span class="glyphicon glyphicon-log-in login_icon"></span> Login</a></li>
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
				      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
     				<a href="${pageContext.request.contextPath}/index.jsp" class="navbar-brand bookstoryhome">BookStory</a>
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




<!-- 
    				<div class="container main_navi_sub_list">
    					<div class="" id="myNavbar_sub">
      						<ul class="nav navbar-nav">
						        <li><a href="./adminUserInfo.jsp">회원 관리</a></li>
						        <li><a href="./articlemanage.jsp">게시판 OR 댓글 관리</a></li>
						        <li><a href="./articleUpload.jsp">작품 올리기</a></li>
     						</ul>
    					</div>
    				</div>

 -->
 
 
 <!-- 
     				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table table-striped table-bordered table-hover">
    						 <thead>
    						 	<tr>
    						 		<th>회원 관리</th>
    						 		<th>회원 관리</th>
    								<th>회원 관리</th>
    						 		
    						 	</tr>
    						 </thead>
    						 
    						 </table>
    					</div>
    				</div>
 
 
  -->
		<!-- 네비게이션 바 (메뉴 영역) -->
			<nav class="navbar navbar-default main_navi main_navi_sub">
  							<div class="container main_navi_sub_list">
    					<div class="" id="myNavbar_sub">
      						<ul class="nav navbar-nav">
						        
						        <li  class="genre_active"><a href="#">로맨스</a></li>
						        <li><a href="#">SF&amp;판타지</a></li>
						        <li><a href="#">무협</a></li>
						        <li><a href="#">미스테리</a></li>
						        <li><a href="#">퓨전</a></li>
						        <li><a href="#">완결</a></li>
						        
     						</ul>
    					</div>
    				</div>
			</nav>	

<!-- 메인 화면 시작 -->
	<div class="container main_container">


		<div class="row">
									<div class="col-xs-3">
										<div class="funkyradio">
											<div class="funkyradio-warning">
									            <input type="checkbox" name="checkbox" id="checkbox5" checked/>
									            <label for="checkbox5" class="check_label">완성작 보기</label>
								        	</div>
								        	</div>
						               </div>     
						                    
						                
						                    
						                    <div class="col-xs-offset-3 col-xs-6">
						    					        <div class="btn-group pull-right check_button">
										            <button type="button" data-toggle="dropdown" class="btn btn-warning dropdown-toggle">조회순 <span class="caret"></span></button>
										            <ul class="dropdown-menu">
										                <li><a href="#">별점순</a></li>
										                <li><a href="#">제목순</a></li>
										                <li ><a href="#">관심등록 순</a> </li>
										               
										            </ul>
										        </div>
											</div>
          
                 </div>
                 
                





					
			 <!-- 장르별 추천작 리스트 -->
        <div class="row genre_row">
             <!-- 항목1 -->
             <div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	
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
					
					<div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	
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
					
					<div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	
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
					
					<div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	
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
					
					<div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	
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
					
					<div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	
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
					
					<div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="#" class="main_alist">
								<img alt="thumb" src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	
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
            
           
      
				
			</div> <!-- 장르별 추천작 리스트 끝-->
			
			<div class="page-nation text-center">
							<div class=" reply_damin_pagenation">
                                        <ul class="pagination pagination-large">
	                                        <li class="disabled"><span><</span></li>
	                                        <li class="active"><span>1</span></li>
	                                        <li><a href="#">2</a></li>
	                                        <li><a href="#">3</a></li>
	                                        <li><a href="#">4</a></li>
	                                       <li class="disabled"><span>></span></li>
                
                                     </ul>
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
					질 수 있습니다.</small> <br> <img src="${pageContext.request.contextPath}/assets/imgs/main/homebutton.jpg" alt="저작권"  width="100" />   copyright&copy; All rights reserved.
			</address>
		</div>
	</footer>

	
	<!-- Javascript -->
	    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	</body>
</html>
