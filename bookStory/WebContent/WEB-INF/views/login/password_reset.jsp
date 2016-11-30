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
		<div class="container login_form">
			<form class="form-horizontal pw_reset" role="form">
				<fieldset>
				<legend class="password_title">비밀번호 찾기</legend>
					<div class="form-group">
						<label class="col-md-3 control-label">북스토리 아이디</label>
						<div class="col-md-9">
							<p class="form-control-static">요기가 바로 아이디자리</p>
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputEmail" class="col-md-3 control-label">이메일</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="inputEmail"	
							placeholder="가입시입력한 이메일주소를 입력해주셈">
						</div>
					</div>									
					
				</fieldset>
			</form>
			<div class="container login_button_pw_rs">
						<a class="btn btn-success" href="${pageContext.request.contextPath}/index.do">확인</a>
					</div>
			
		</div>		
	</div>



	<!-- 메인 화면 끝 -->

	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>
