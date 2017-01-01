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
		<h3>책임의 한계</h3>
<ol>
<li>북스토리㈜ 는 링크, 다운로드, 광고 등을 포함하여 본 웹 사이트에 포함되어 있거나, 본 웹 사이트를 통해 배포, 전송되거나, 본 웹 사이트에 포함되어 있는 서비스로부터 접근되는 정보(이하 "자료")의 </li>
<li>정확성이나 신뢰성에 대해 어떠한 보증도 하지 않으며, 서비스상의, 또는 서비스와 관련된 광고, 기타 정보 또는 제안의 결과로서 디스플레이, 구매 또는 취득하게 되는 제품 또는 기타 정보(이하 "제품")의 질에 대해서도 어떠한 보증도 하지 않습니다.</li> 
<li>귀하는, 자료에 대한 신뢰 여부가 전적으로 귀하의 책임임을 인정합니다. </li>
<li>북스토리㈜는 자료 및 서비스의 내용을 수정할 의무를 지지 않으나, 필요에 따라 개선할 수는 있습니다.</li> 
<li>북스토리㈜는 자료와 서비스를 "있는 그대로" 제공하며, 서비스 또는 기타 자료 및 제품과 관련하여 상품성, 특정 목적에의 적합성에 대한 보증을 포함하되 이에 제한되지 않고 모든 명시적 또는 묵시적인 보증을 명시적으로 부인합니다.</li> 
<li>어떠한 경우에도 북스토리㈜는 서비스, 자료 및 제품과 관련하여 직접, 간접, 부수적, 징벌적, 파생적인 손해에 대해서 책임을 지지 않습니다.</li> 
<li>북스토리㈜는 본 웹사이트를 통하여 인터넷을 접속함에 있어 사용자의 개인적인 판단에 따라 하시기를 바랍니다.</li> 
<li>본 웹사이트를 통해 일부 사람들이 불쾌하거나 부적절 하다고 여기는 정보가 포함되어 있는 사이트로 연결될 수 있습니다.</li> 
<li>북스토리㈜는 본 웹사이트 또는 자료에 열거되어 있는 사이트의 내용을 검토하려는 노력과 관련하여 어떠한 보증도 하지 않습니다.</li> 
<li>또한 북스토리㈜는 본 웹사이트 또는 자료에 열거되어 있는 사이트상의 자료의 정확성, 저작권 준수, 적법성 또는 도덕성에 대해 아무런 책임을 지지 않습니다.</li>		
</ol>


<br>
<h3>상표사용허락에 대한 안내</h3>
		<ol>
	<li>북스토리㈜의 모든 상표, 로고는 상표법 및 기타 관련법의 보호를 받는 지식 재산으로서, 북스토리㈜는 브랜드 가치의 유지를 위하여 최선을 다하고 있습니다. 따라서 북스토리㈜의 상표를 사용하고자 하는 분은 반드시 사전에 허락을 받아야 하며, 북스토리㈜의 허락 없이 사용하는 경우 북스토리㈜의 권리를 침해하는 것으로서 법적 제재를 받을 수 있습니다. 단, 북스토리 오픈API를 이용하여 상품 또는 서비스를 제작ㆍ배포하는 경우, 상표사용 가이드(기본 가이드 및 오픈API 특례)의 모든 조항을 준수하여 북스토리㈜의 상표를 사용하면 별도의 상표사용 허락을 받지 않아도 됩니다.</li>
<li>광고 제휴 등의 목적 외에 비상업적 용도로 북스토리㈜의 상표를 사용하고자 하는 경우, 아래 상표사용 가이드를 신중히 검토하시고, 동의하는 경우 아래 상표사용허락 요청서를 다운받아 작성하여 본 페이지 하단의 "제휴제안" 메뉴를 이용하여 등록하여 주시기 바랍니다. 상표사용허락을 요청한 사용자는 최종 상표사용허락을 받기 전까지는 상표를 사용해서는 안되며, 사용허락 이후에도 반드시 상표사용 가이드에 따라 상표를 사용해야 합니다. 이를 따르지 않는 경우, 북스토리㈜는 상표사용을 중지시키거나 법적 조치를 취할 수 있습니다.</li>
<li>북스토리㈜의 상표를 사용하고자 하는 분은 아래 상표사용 가이드를 신중히 검토하시고, 동의하는 경우 아래 상표사용허락 요청서를 다운받아 작성하여 담당자에게 메일에 첨부하여 보내주시기 바랍니다.</li> 
<li>또한 상표사용허락을 요청한 사용자는 최종 상표사용허락을 득하기 전까지는 상표를 사용해서는 안되며, 사용허락 이후에도 반드시 상표사용가이드에 따라 상표를 사용해야 합니다. 북스토리㈜는 이를 따르지 않는 사용자에 대해서 상표사용을 중지시키거나 법적 조치를 취할 수 있습니다.</li>
				</ol>
		<br>		
		
	</div>
	<!-- 메인 화면 끝 -->

	<hr />

<!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
</body>
</html>