<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html lang='ko'>
	<head>
		<jsp:include page="/template/common.jsp"></jsp:include>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/myMenu.css" />
	</head>
	<body>

		<!-- 메인 헤더 -->
		<jsp:include page="/template/headerNavi.jsp"/>	


<!-- 메인 화면 시작 -->
<nav class="navbar navbar-default main_navi main_navi_sub">
  				

    				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table table-striped table-bordered table-hover" id="table">
    						 <thead>
    						 	<tr>
    						 	    <th><a href="${pageContext.request.contextPath}/myMenu/recentNovelList.jsp"><span>최근 본 작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/myMenu/favorNovelList.jsp"><span>관심작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/myMenu/bookmarkList.jsp"><span>책갈피</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/myMenu/purchaseList.jsp"><span>구매내역</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/myMenu/myPoint.jsp"><span>내 포인트</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/myMenu/myInfo.jsp"><span>내정보</span></a></th>
    						 		
    						 	</tr>
    						 </thead>
    						 
    						 </table>
    					
    					
    					
    					
      				
    					</div>
    				</div>
 
			</nav>
	<div class="container" id="content">
	  <div class="table-responsive">
	  <div class="table_container">
	  <table class="table">
	    <thead>
	      <tr>
		<th>구매일자</th>
		<th>구분</th>
		<th>제목</th>
		<th>        </th>
		<th>금액</th>
		<th>구매취소</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td id="tr">2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	      <tr>
		<td>2016.10.03</td>
		<td>대여</td>
		<td><a href="#"><img alt="이드(개정판)" src="/bookstorylocal/assets/imgs/mymenu/ied.jpg" width="39" height="55"></a></td>
		<td><a href="#">[연재판타지] 이드(개정판) 579화</a></td>
		<td>낱권 100원</td>
		<td>-</td>
	      </tr>
	    </tbody>
	  </table>
	  <div id="pagination"> 
	 <ul class="pagination">
	   <li class="disabled"><a href="#">&laquo;</a></li>
	   <li class="active"><a href="#">1</a></li>
	   <li><a href="#">2</a></li>
	   <li><a href="#">&raquo;</a></li>
	 </ul>
	 </div>
	</div>
	</div>
	</div>
			<!-- 메인 화면 끝 -->
	
	
	
	<!-- footer -->
	<jsp:include page="/template/footer.jsp"></jsp:include>

	</body>
</html>
