<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang='ko'>
<head>

<jsp:include page="/template/common.jsp"></jsp:include>
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/LoginMain.css" />


</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include page="/template/headerNavi.jsp"/>	
	


	<!-- 메인 화면 시작 -->
	<div class="container main_container">
		<div class="container bb">
			<form class="form-horizontal" role="form">
				<fieldset>
					<legend>아이디 찾기</legend>
					<p>가입이 입력한 정보를 통해 아이디를 찾으세요.</p>

					<br>

					<div class="form-group">
						<label for="name" class="col-md-3">이    름</label>
						 <input type="text" id="name" class="form-control"
							placeholder="본인 이름" />
					</div>
					<div class="form-group">
						<label for="phone" class="col-md-3">휴대폰 번호</label> 
						<input type="text" id="phone" class="form-control"
							placeholder="가입시 등록했던 휴대전화 번호를 입력하세요." />
					</div>
					<a class="btn btn-success" href="${pageContext.request.contextPath}/logIn/IdConfirm.jsp">확인</a>
				</fieldset>
			</form>
		</div>
	</div>

	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>