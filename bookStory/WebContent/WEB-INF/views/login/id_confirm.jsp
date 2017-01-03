<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>

  <jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
 		
		<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />
					
</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>	
	

	<!-- 메인 화면 시작 -->
	<div class="container main_container">
			<form class="form-horizontal login_form" role="form">
				<fieldset>
					<legend>회원 정보</legend>

					<br>

					<div class="form-group">
						<label for="name" class="col-md-2">아이디</label>
						<div class="col-md-10">
						 	<input type="text" id="name" class="form-control" value="${member.user_id}" readonly="readonly"/>
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2">가입일</label> 
						<div class="col-md-10">
							<input type="text" id="email" class="form-control" value="${member.reg_date}" readonly="readonly"/>
						</div>					
					</div>
					
					<div class="form-group">
					<div class="login_button col-md-offset-2 col-md-10" style="text-align: center;">					
						<ol class="list-inline">
							<li><a href="${pageContext.request.contextPath}/login/forget_pw.do">비밀번호 찾기</a></li>
							<li>|</li>
							<li><a href="${pageContext.request.contextPath}/login/login.do">로그인</a></li>
							
						</ol>
					</div>
					</div>
				</fieldset>
			</form>
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
</body>
</html>