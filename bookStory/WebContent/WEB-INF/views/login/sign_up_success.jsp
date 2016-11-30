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
		<div class="login_form_su">
			<h1>
				<strong>환영합니다!</strong>
			</h1>
			<br> <br>



         
			<p>
				<em class="text-primary">뚬땜이</em>님, 회원가입을 축하합니다.
			</p>
			<p>
				북스토리의 새로운 아이디는 <em class="text-success">nannada</em>입니다.
			</p>

			<h5>소중한 북스토리 아이디 안전하게 지켜드립니다.</h5>
			
			</div>

			<br>  

           <div class="form-group">
			<a href="${pageContext.request.contextPath}/index.do" class="btn btn-success btn-lg col-md-10">시작하기</a>
			</div>
<br> <br>

		</div>
	</div>


	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
</body>
</html>