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

	<div class="container mid">
		<h3>1. 개인정보처리방침의 의의</h3>
		<small>북스토리는 본 개인정보처리방침을 정보통신망법을 기준으로 작성하되, 북스토리 내에서의 이용자 개인정보 처리 현황을 최대한 알기 쉽고 상세하게 설명하기 위해 노력하였습니다.
이는 쉬운 용어를 사용한 개인정보처리방침 작성 원칙인 ‘Plain Language Privacy Policy(쉬운 용어를 사용한 개인정보처리방침)’를 도입한 것입니다 </small> <br>
  
  
 
  <ol>
  <li>개인정보처리방침은 다음과 같은 중요한 의미를 가지고 있습니다.</li>
<li>북스토리가 어떤 정보를 수집하고, 수집한 정보를 어떻게 사용하며, 필요에 따라 누구와 이를 공유(‘위탁 또는 제공’)하며, 이용목적을 달성한 정보를 언제·어떻게 파기하는지 등 ‘개인정보의 한살이’와 관련한 정보를 투명하게 제공합니다.</li>
<li>정보주체로서 이용자는 자신의 개인정보에 대해 어떤 권리를 가지고 있으며, 이를 어떤 방법과 절차로 행사할 수 있는지를 알려드립니다. </li>
<li>또한, 법정대리인(부모 등)이 만14세 미만 아동의 개인정보 보호를 위해 어떤 권리를 행사할 수 있는지도 함께 안내합니다.</li>
<li>개인정보 침해사고가 발생하는 경우, 추가적인 피해를 예방하고 이미 발생한 피해를 복구하기 위해 누구에게 연락하여 어떤 도움을 받을 수 있는지 알려드립니다.</li>
<li>그 무엇보다도, 개인정보와 관련하여 북스토리와 이용자간의 권리 및 의무 관계를 규정하여 이용자의 ‘개인정보자기결정권’을 보장하는 수단이 됩니다</li>
  </ol>

<h3>2. 수집하는 개인정보</h3>
<ol>
<li>이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 북스토리 서비스를 회원과 동일하게 이용할 수 있습니다. </li>
<li>이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 북스토리는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.</li>

<li>회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. </li>
<li>만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년원일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.</li>
<li>단체아이디로 회원가입 시 단체아이디, 비밀번호, 단체이름, 이메일주소, 가입인증 휴대폰번호를 필수항목으로 수집합니다. </li>
<li>그리고 단체 대표자명, 비밀번호 발급용 멤버 이름 및 이메일주소를 선택항목으로 수집합니다.</li>
</ol>
		
	</div>
	<!-- 메인 화면 끝 -->

	<hr />

<!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
</body>
</html>