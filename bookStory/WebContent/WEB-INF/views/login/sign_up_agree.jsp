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
	  
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />


<script type="text/javascript">
$(function() {
$("#chk_all").change(function() {
	var is_check = $(this).is(":checked");
	
	$(".input_check").prop("checked", is_check);
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
	<div class="container mid">
		<!-- 동의, 비동의 버튼 포함 클래스 -->
		<div class="container login_forms">
			<!-- 동의서 안에박스 -->
			<div class="container login_forms_su" style="width: 100%; background: #fff;">

				<!-- 첫번째 박스 -->
				<p class="terms_chk_all">

					<span class="input_chk"> <label><strong>이용약관,
								개인정보 수집 및 이용,<br> 위치정보 이용약관(선택), 프로모션 안내<br> 메일
								수신(선택)에 모두 동의합니다.
						</strong></label> <input type="checkbox" id="chk_all" onclick="">
					</span>


				</p>


				<ul id="termsDiv" class="terms_bx_list" style="display: block">
					<!-- 두번째 박스 -->
					<li class="terms_bx terms_service"><span class="input_chk">
							<input type="checkbox" id="termService" class="input_check" name="termsService">

							<label id="termsServiceLb" for="termsService"> 북스토리
								이용약관동의<span class="terms_choice">(필수)</span>
						</label>
					</span>

						<div class="terms_box">
							<div class="article">
								<h3 class="article_title">제 1조 (목적)</h3>
								<p class="article_text">이 약관은 북스토리 주식회사 ("회사" 또는 "북스토리")가
									제공하는 북스토리 및 북스토리 관련 제반 서비스의 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타
									필요한 사항을 규정함을 목적으로 합니다.</p>
							</div>
							<div class="article">
								<h3 class="article_title">제 2조 (정의)</h3>
								<p class="article_text">
									이 약관에서 사용하는 용어의 정의는 다음과 같습니다. <br> ①"서비스"라 함은 구현되는 단말기(PC,
									TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 북스토리 및 북스토리
									관련 제반 서비스를 의미합니다. <br> ②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라
									"회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다. <br>
									③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와
									숫자의 조합을 의미합니다. <br> ④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는
									"회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다. <br>
									⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타
									유료콘텐츠를 포함) 및 제반 서비스를 의미합니다. <br> ⑥"포인트"라 함은 서비스의 효율적 이용을
									위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를
									의미합니다. <br> ⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한
									부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
								</p>
							</div>


						</div></li>


					<!-- 세번째 박스 -->
					<li class="terms_bx terms_service"><span class="input_chk">
							<input type="checkbox" id="termService" class="input_check" name="termsService">

							<label id="termsServiceLb" for="termsService"> 개인정보 수집 및
								이용에 대한 안내<span class="terms_choice">(필수)</span>
						</label>
					</span>

						<div class="terms_box">
							<div class="article">
								<p class="article_text">정보통신망법 규정에 따라 북스토리에 회원가입 신청하시는 분께
									수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은
									후 동의하여 주시기 바랍니다.</p>
							</div>
							<div class="article">
								<h3 class="article_title">1. 수집하는 개인정보</h3>
								<p class="article_text">이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등
									대부분의 북스토리 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이
									개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 북스토리는 서비스 이용을 위해 필요한 최소한의
									개인정보를 수집합니다. 회원가입 시점에 북스토리가 이용자로부터 수집하는 개인정보는 아래와 같습니다. - 회원 가입
									시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가
									입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별,
									중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다. -
									단체아이디로 회원 가입 시에 단체아이디, 단체이름, 법인명(단체명), 대표자명, 대표 전화번호, 사업장소재지,
									관리자 아이디, 관리자 휴대폰번호를 필수항목으로 수집합니다. 서비스 이용 과정에서 이용자로부터 수집하는 개인정보는
									아래와 같습니다. BookStory 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의
									이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집
									시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내
									드리고 동의를 받습니다. 서비스 이용 과정에서 IP 주소, 쿠키, 방문일시·불량 이용 기록 등의 서비스 이용
									기록, 기기정보가 생성되어 수집될 수 있습니다. 구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를
									정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를
									원래의 값을 확인하지 못하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.</p>
							</div>

						</div></li>

				</ul>
				<br>

			</div>

			<div class="btn_group">

				<a  href="./sign_up.do" class="btn btn-success btn-lg col-md-6">동의</a>

				<a href="${pageContext.request.contextPath}/index.do" class="btn btn-default btn-lg col-md-6">비동의</a>

			</div>
			
			<br>
			<br>
			<br>
			<br>
		


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