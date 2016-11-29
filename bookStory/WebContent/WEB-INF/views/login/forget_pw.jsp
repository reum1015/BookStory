<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>

  <jsp:include page="${pageContext.request.contextPath}/template/common.jsp"></jsp:include>
			
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />

</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include page="${pageContext.request.contextPath}/template/headerNavi.jsp"/>	
	

	<!-- 메인 화면 시작 -->

	<div class="container main_container">
		<div class="container login_form">
			<form class="form-horizontal" role="form">
				<fieldset>
					<legend>비밀번호 찾기</legend>
					<p>가입시 등록한 정보를 입력해주세요.</p>

					<div class="section section_id">
						<div class="box1" style="text-align: center">

							<div class="form-group">
								<label for="user_id" class="col-md-3">아이디</label> <input type="text"
									id="user_id" class="col-md-9" placeholder="아이디" />
							</div>
							
							<div class="form-group">
								<label for="user_name" class="col-md-3">이름</label> <input type="text"
									id="user_name" class="col-md-9" placeholder="본인 이름" />
							</div>
							
							<div class="form-group">
								<label for="user_number" class="col-md-3">휴대전화</label> <input type="text"
									id="user_number" class="col-md-9" placeholder="가입시 등록했던 전화번호" />
							</div>

						</div>
					</div>
					<br>
					<div class="container login_button ">
						<a class="btn btn-default" href="${pageContext.request.contextPath}/login/password_reset.do">다음</a>
					</div>
				</fieldset>
			</form>
		</div>
	</div>

	<!-- 메인 화면 끝 -->

	<hr />

         <!-- footer -->
	<jsp:include page="${pageContext.request.contextPath}/template/footer.jsp"></jsp:include>
	
</body>
</html>