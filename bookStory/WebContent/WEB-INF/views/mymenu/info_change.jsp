<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang='ko'>
<head>

	<jsp:include page="/WEB-INF/views/template/head.jsp"/>
		
		
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/InfoChange.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/pickadate/themes/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/pickadate/themes/default.date.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/mymenu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/mymenuCommon.css" />



</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"/>	


	<!-- 메인 화면 시작 -->
	<nav class="navbar navbar-default main_navi main_navi_sub">
  				

    				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table table-striped table-bordered table-hover" id="table">
    						 <thead>
    						 	<tr>
    						 	   	<th><a href="${pageContext.request.contextPath}/mymenu/recentepisode_list.do"><span>최근 본 작품</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/favorite_list.do"><span>관심작품</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/bookmark_list.do"><span>책갈피</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/purchase_list.do"><span>구매내역</span></a></th>    						
    						<th><a href="${pageContext.request.contextPath}/mymenu/rent_list.do"><span>대여내역</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/my_point.do"><span>내 포인트</span></a></th>
    						 		
    						 	</tr>
    						 </thead>
    						 
    						 </table>
    					
    					
    					
    					
      				
    					</div>
    				</div>
 
			</nav>
	<div class="container main_container">
		<div class="container bb">
			<fieldset>
				<legend>회원 정보 수정</legend>
				<form id="join_form" method="post">

					<div class="form-group">
					
							<div  id="idDiv" class="join_row">
                        <input type="password" id="user_pw"
							class="form-control-box" placeholder="비밀번호수정" />
                           </div>
                           
							<div  id="idDiv" class="join_row">
							<input type="password" id="user_pw" class="form-control-box"
							placeholder="비밀번호 재확인" /> </div>
					</div>

					<div class="form-group">
								<div  id="idDiv" class="join_row">
						<input type="text" id="user_name" class="form-control-box"
							placeholder="이름" />
							</div>
						
						
								
					</div>
					
					<div class="form-group">
								<div  id="idDiv" class="join_row">
						<input type="text" id="nic_name" class="form-control-box"
							placeholder="닉네임" />
							</div>
						
						
								
					</div>
					
					<div class="form-group">
							<div  id="idDiv" class="join_row">
						<input type="text" id="user_id" class="form-control-box"
							placeholder="이메일" />
							</div>
									<div  id="idDiv" class="join_row">
							<input type="text" id="user_id" class="form-control-box" placeholder="휴대전화번호" />
							</div>
					</div>
					
	                 <div class="form-group">
					<a class="btn btn-block btn-warning" href="${pageContext.request.contextPath}/mymenu/info_change_success.do">확인</a>
					</div>
					
				</form>
			</fieldset>
		</div>
	</div>

	<!-- 메인 화면 끝 -->

  <!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
	

	
	<!-- Javascript -->
	
	<script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/picker.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/picker.date.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/translations/ko_KR.js"></script>
	

</body>
</html>