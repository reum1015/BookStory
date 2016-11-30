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

<div class="container">
  <div class="row">
    <div class="col-md-8">
      <h1 class="page-header">비밀번호 재설정</h1>
      <p>
            가입시 입력한 이메일 주소를 입력하세요.
            임시 비밀번호를 이메일로 보내드립니다.
      </p>
      
      <!-- 이메일 주소 입력 폼 시작 -->
      <form name="myform" method="post" action="${pageContext.request.contextPath}/login/forget_pw_ok.do">
        <div class="form-group">
          <input type="text" name="email" class="form-control"/>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-warning btn-block">비밀번호 재설정 하기</button>
        </div>
      </form>
      <!-- // 이메일 주소 입력폼 끝 -->
    </div>
  </div>
</div>

	<!-- 메인 화면 끝 -->

	<hr />


         <!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
	
</body>
</html>