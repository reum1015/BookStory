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
	<div class="container main_containers">
		<div class="container login_forms">
		
			<fieldset>
				<legend class="sign_up_title" >회원가입</legend>
				<form id="join_form" method="post" action="${pageContext.request.contextPath}/login/sign_up_success.do">

					<div class="form-group">
					<div  id="idDiv" class="join_row">
						<input type="text" id="user_id" name="user_id" class="form-control-box"
							placeholder="아이디" />
							</div>
							
					<div  id="idDiv" class="join_row">
                        <input type="text" id="nick_name" name="nick_name"
							class="form-control-box" placeholder="닉네임" />
                           </div>
							
							<div  id="idDiv" class="join_row">
                        <input type="password" id="user_pw" name="user_pw"
							class="form-control-box" placeholder="비밀번호" />
                           </div>
                           
							<div  id="idDiv" class="join_row">
							<input type="password" id="user_pw" name="user_pw_re" class="form-control-box"
							placeholder="비밀번호 재확인" /> </div>
					</div>

					<div class="form-group">
								<div  id="idDiv" class="join_row">
						<input type="text" id="name" name="name" class="form-control-box"
							placeholder="이름" />
							</div>
						
						<div  id="idDiv" class="join_row">
						
					
							<div class="btn-group btn-group-justified" role="group" aria-label="${pageContext.request.contextPath}.">
							  <div class="btn-group" role="group">
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="M" /><span>남자</span></label>							  
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="F" /><span>여자</span></label>		
							  </div>
							</div>										
						
						</div>													
						
						<div  id="idDiv" class="join_row">	
						<input type="date" id="birthdate" name="birthdate" class="form-control-box" placeholder="생년월일" />
                       </div>
													
								
					</div>
					
					<div class="form-group">
							<div  id="idDiv" class="join_row">
						<input type="email" id="email" name="email" class="form-control-box"
							placeholder="이메일" />
							</div>
									<div  id="idDiv" class="join_row">
							<input type="tel" id="tel" name="tel" class="form-control-box" placeholder="휴대전화번호" />
							</div>
					</div>
					
	                 <div class="form-group">
                        <div>
                           <button type="submit" class="btn btn-warning col-md-6">가입하기</button>
                           <button type="reset" class="btn btn-danger col-md-6">다시작성</button>
                        </div>
                     </div>
					
				</form>
			</fieldset>
			
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