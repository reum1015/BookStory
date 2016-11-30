<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>

		<jsp:include page="${pageContext.request.contextPath}/template/head.jsp"></jsp:include>

<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/pickadate/themes/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/pickadate/themes/default.date.css" />



<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	/*
	 $(function(){ 
	 var menupos = $(".main_header").offset().top; 
	 $(window).scroll(function(){ 
	 if($(window).scrollTop() >= menupos) { 
	 $(".main_header").css("position","fixed"); 
	 $(".main_header").css("top","0");
	 $('#top_mar').show();
	 } 
	 }); 
	 }); 
	 */
	 $(function() {
		 $("#sample1").pickadate({
			 
			 /** 월 이름 표시 옵션 */
			 weekdaysShort: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],	
			 
			 today: '오늘',
			 clear: '지우기',
			 close: '닫기',
		 
			 /** 년, 월 선택 버튼 표시 텍스트 */
			 labelMonthNext: '다음달로 이동',
			 labelMonthPrev: '이전달로 이동',
			 labelMonthSelect: '월 선택',
			 labelYearSelect: '년도 선택',
			 selectMonths: true,
			 selectYears: true,
			 
			 
		 });
	 });
	 
	  
</script>
<!-- pickadate plugin -->

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
	<div class="container main_containers">
		<div class="container login_forms">
		
			<fieldset>
				<legend class="sign_up_title" >회원가입</legend>
				<form id="join_form" method="post" action="${pageContext.request.contextPath}/login/sign_up_success.do">

					<div class="form-group">
					<div  id="idDiv" class="join_row">
						<input type="text" id="user_id" name="user_id" class="form-control-box"
							placeholder="아이디" />
							</div>
							
					<div  id="idDiv" class="join_row">
                        <input type="text" id="nick_name" name="nick_name" class="form-control-box" placeholder="닉네임" />
                           </div>
							
							<div  id="idDiv" class="join_row">
                        <input type="password" id="user_pw" name="user_pw" class="form-control-box" placeholder="비밀번호" />
                           </div>
                           
							<div  id="idDiv" class="join_row">
							<input type="password" id="user_pw_re" name="user_pw_re" class="form-control-box"
							placeholder="비밀번호 재확인" /> </div>
					</div>

					<div class="form-group">
								<div  id="idDiv" class="join_row">
						<input type="text" id="name" name="name" class="form-control-box"
							placeholder="이름" />
							</div>
						
						<div  id="idDiv" class="join_row">
						
					
							<div class="btn-group btn-group-justified" role="group">
							  <div class="btn-group" role="group">
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="M" /><span>남자</span></label>							  
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="F" /><span>여자</span></label>		
							  </div>
							</div>										
						
						</div>													
						
						<div  id="idDiv" class="join_row">	
						<input type="date" id="birthdate" name="birthdate" class="form-control-box" placeholder="생년월일" />
                       </div>
													
								
					</div>
					
					<div class="form-group">
					  <div  id="idDiv" class="join_row">
						<input type="email" id="email" name="email" class="form-control-box"
							placeholder="이메일" />
					  </div>
					  <div  id="idDiv" class="join_row">
						<input type="tel" id="tel" name="tel" class="form-control-box" placeholder="휴대전화번호" />
				      </div>
					</div>
					
	                <div class="form-group">
					  <button type="submit" class="btn btn-warning">가입하기</button>
                      <button type="reset" class="btn btn-danger">다시작성</button>
					</div>
					
				</form>
			</fieldset>
			
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
		<script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/picker.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/picker.date.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/translations/ko_KR.js"></script>
	

</body>
</html>