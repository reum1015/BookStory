<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>

  <jsp:include page="${pageContext.request.contextPath}/template/head.jsp"></jsp:include>
 		
		<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />
					
</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include page="${pageContext.request.contextPath}/template/head_nav.jsp"/>	
	

	<!-- 메인 화면 시작 -->
	<div class="container main_container">
			<form class="form-horizontal login_form" role="form">
				<fieldset>
					<legend>아이디 찾기</legend>
					<p>고객님의 정보와 일치하는 아이디 입니다.</p>

					<div class="section section_id">
						<div class="box1" style="text-align: center">

							<p class="text-center">너가 찾는 아뒤임&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								가입:2016.08.22</p>

							<input type="hidden" name="nv_id" value="너가 찾는 아뒤임">

						</div>
					</div>
					<br>
					<div class="container login_button">
					 <a class="btn btn-success" href="${pageContext.request.contextPath}/login/login.do">로그인하기</a> 
					 &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					 <a class="btn btn-primary" href="${pageContext.request.contextPath}/login/forget_pw.do">비밀번호 찾기</a>
					 </div>
				</fieldset>
			</form>
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="${pageContext.request.contextPath}/template/footer.jsp"></jsp:include>
</body>
</html>