<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>

		<jsp:include page="/WEB-INF/views/template/head.jsp"/>
		
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />



</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"/>	


	<!-- 메인 화면 시작 -->

	<div class="container main_container">
		<div class="container login_form">
			<form class="form-horizontal" role="form" action="${pageContext.request.contextPath}/login/id_confirm.do"
				method="post">
				<fieldset>
					<legend>아이디 찾기</legend>
					<p>가입이 입력한 정보를 통해 아이디를 찾으세요.</p>

					<br>

					<div class="form-group">
						<label for="name" class="col-md-2">이 름</label>
						<div class="col-md-10">
						 	<input type="text" id="name" name="name"class="form-control" placeholder="본인 이름" />
						</div>
					</div>
					<div class="form-group">
						<label for="email" class="col-md-2">이메일</label> 
						<div class="col-md-10">
							<input type="text" id="email" name="email" class="form-control" placeholder="가입시 등록했던 이메일을 입력하세요." />
						</div>					
					</div>
					
					
					<div class="form-group">
			            <div class="col-md-offset-2 col-md-10">
			                <button type="submit"class="btn btn-success" >확  인</button>
			                <button type="reset" class="btn btn-danger">다시작성</button>
			            </div>
        			</div>
				</fieldset>
			</form>
		</div>
	</div>
	
	<!-- 메인 화면 끝 -->

	<hr />

<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>