<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
	
	<jsp:include page="/WEB-INF/views/template/head.jsp"/>
	
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/LoginMain.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/InfoChangeSuccess.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/mymenu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/mymenuCommon.css" />


</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"/>
	
	<!-- 메인 화면 시작 -->
	<nav class="navbar navbar-default main_navi main_navi_sub">
  				

    				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table table-striped table-bordered table-hover" id="table">
    						 <thead>
    						 	<tr>
    						 	    <th><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.do"><span>최근 본 작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/favor_novel_list.do"><span>관심작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/bookmark_list.do"><span>책갈피</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/purchase_list.do"><span>구매내역</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/my_point.do"><span>내 포인트</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/my_info.do"><span>내정보</span></a></th>

    						 		
    						 	</tr>
    						 </thead>
    						 
    						 </table>
    					
    					
    					
    					
      				
    					</div>
    				</div>
 
			</nav>
	<div id="container main_container">
		<div class="container bb">
			<h1>
				<strong>회원 정보 수정이 완료되었습니다.</strong>
			</h1>
			<br> <br>


           <div class="form-group">
			<a href="${pageContext.request.contextPath}/index.do" class="btn btn-warning btn-lg col-md-10">홈으로</a>
			</div>
<br> <br>

		</div>
	</div>


	<!-- 메인 화면 끝 -->

	  <!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
		
	<!-- Javascript -->
	    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
</body>
</html>