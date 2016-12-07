<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>

<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
		
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/login_main.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/pickadate/themes/default.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/pickadate/themes/default.date.css" />



<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
		 $(function() {
		 $("#sample1").pickadate({
			 
			 /** 월 이름 표시 옵션 */
			 weekdaysShort: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],				 
			 today: '오늘',
			 clear: '지우기',
			 close: '닫기',		 
			 /** 년, 월 선택 버튼 표시 텍스트 */
			 labelMonthNext: '다음달로 이동',
			 labelMonthPrev: '이전달로 이동',
			 labelMonthSelect: '월 선택',
			 labelYearSelect: '년도 선택',
			 selectMonths: true,
			 selectYears: true,			 			 
		 });
	 });	  
</script>
<!-- pickadate plugin -->

</head>
<body>
	<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>	


	<!-- 메인 화면 시작 -->
	<div class="container">
  <div class="row">
    <div class="col-md-6 col-md-offset-3">
      <h1 class="page-header">비밀번호 확인</h1>
      <p>탈퇴를 위해서는 비밀번호를 입력해 주세요.</p>
      
      <!-- 비밀번호 입력 폼 시작 -->
      <form name="myform" method="post" action="${pageContext.request.contextPath}/member/out_ok.do">
        <div class="form-group">
          <input type="password" name="user_pw" class="form-control"/>
        </div>
        <div class="form-group">
          <button type="submit" class="btn btn-danger btn-block">회원탈퇴</button>
          <button type="reset" class="btn btn-warning btn-block">탈퇴취소</button>
        </div>
      </form>
      <!-- // 비밀번호 입력 폼 끝 -->
    </div>
  </div>
</div>
	<!-- 메인 화면 끝 -->

	<!-- footer -->
	

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	<!-- Javascript -->
	    <script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/picker.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/picker.date.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/pickadate/translations/ko_KR.js"></script>
	

</body>
</html>