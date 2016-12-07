<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<jsp:include page="/WEB-INF/views/template/head.jsp"/>
						
		
		<!-- 스타일 sheet -->
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
    						 	    <th><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.do"><span>최근 본 작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/favor_novel_list.do"><span>관심작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/bookmark_list.do"><span>책갈피</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/purchase_list.do"><span>구매내역</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/my_point.do"><span>내 포인트</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/my_info.do"><span>내정보</span></a></th>

    						 		
    						 	</tr>
    						 </thead>
    						 
    						 </table>
    					
    					
    					
    					
      				
    					</div>
    				</div>
 
			</nav>
	<div class="container" id="content">
	 
		<div class="container bb">
			<form class="form-horizontal" role="form">
				<fieldset>
					<legend>내 정보 수정</legend>
					<p>가입시 등록한 정보를 입력해주세요.</p>

					<div class="section section_id">
						<div class="box1" style="text-align: center">

							
							
							<div class="form-group">
								<label for="user_pw" class="col-md-3">비밀번호</label> <input type="password"
									id="user_pw" class="col-md-9" placeholder="비밀번호를 입력하세요." />
							</div>

						</div>
					</div>
					<br>
					<div class="container cc">
						<a class="btn btn-warning" href="${pageContext.request.contextPath}/mymenu/info_change.do">정보수정</a>
						<a class="btn btn-danger" href="${pageContext.request.contextPath}/mymenu/out.do">회원탈퇴</a>
						
					</div>
				</fieldset>
			</form>
		</div>
	 
	 
	 
	</div>
			<!-- 메인 화면 끝 -->
	
	
	<!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>

	
	<!-- Javascript -->
	    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	</body>
</html>