<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
			
				<form id="join_form" method="post" action="${pageContext.request.contextPath}/member/edit_ok.do">
					<fieldset>
				<legend class="sign_up_title" >회원정보 수정</legend>
				
					<div class="form-group">
					<div  id="idDiv" class="join_row">
					    <!-- 아이디는 변경할 수 없기 때문에 출력만 한다. -->
						<p class="form-control-static">${loginInfo.user_id}</p>
							</div>
							
					<div  id="idDiv" class="join_row">
                        <input type="text" id="nick_name" name="nick_name"
							class="form-control-box" placeholder="닉네임" value="${loginInfo.nick_name}" />
                           </div>
							
							<div  id="idDiv" class="join_row">
                        <input type="password" id="user_pw" name="user_pw"
							class="form-control-box" placeholder="현재 비밀번호" />
                           </div>
                           
							<div  id="idDiv" class="join_row">
                        <input type="password" id="new_user_pw" name="new_user_pw"
							class="form-control-box" placeholder="변경할 비밀번호" />
                           </div>
                           
							<div  id="idDiv" class="join_row">
							<input type="password" id="new_user_pw_re" name="new_user_pw_re" class="form-control-box"
							placeholder="변경할 비밀번호 재확인" /> </div>
					</div>

					<div class="form-group">
								<div  id="idDiv" class="join_row">
						<input type="text" id="name" name="name" class="form-control-box"
							placeholder="이름" value="${loginInfo.name}"/>
							</div>
						
						<div  id="idDiv" class="join_row">
						
					
							<div class="btn-group btn-group-justified" role="group" aria-label="${pageContext.request.contextPath}.">
							  <div class="btn-group" role="group">
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="M" <c:if test="${loginInfo.gender == 'M'}">checked</c:if>/><span>남자</span></label>							  
							  </div>
							  <div class="btn-group" role="group">
							  <label class="btn btn-default gender">
							  <input type="radio" name="gender" value="F" <c:if test="${loginInfo.gender == 'F'}">checked</c:if>/><span>여자</span></label>		
							  </div>
							</div>										
						
						</div>													
						
						<div  id="idDiv" class="join_row">	
						<input type="date" id="birthdate" name="birthdate" class="form-control-box" placeholder="생년월일" value="${loginInfo.birthdate}"/>
                       </div>
													
								
					</div>
					
					<div class="form-group">
							<div  id="idDiv" class="join_row">
						<input type="email" id="email" name="email" class="form-control-box"
							placeholder="이메일" value="${loginInfo.email}"/>
							</div>
									<div  id="idDiv" class="join_row">
							<input type="tel" id="tel" name="tel" class="form-control-box" placeholder="휴대전화번호" value="${loginInfo.tel}"/>
							</div>
					</div>
					
	                 <div class="form-group">
                   
                           <button type="submit" class="btn btn-warning col-xs-6">수정하기</button>
                      
                           <button type="reset" class="btn btn-danger col-xs-6">다시작성</button>
                        
                     </div>   
					</fieldset>
				</form>
			
			
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