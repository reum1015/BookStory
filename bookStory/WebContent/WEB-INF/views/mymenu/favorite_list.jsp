<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang='ko'>
	<head>
			<jsp:include page="/WEB-INF/views/template/head.jsp"/>
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"/>
		
		<!-- 스타일 sheet -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/mymenu.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/mymenuCommon.css" />
	
	</head>
	<body>

		
	<!-- 메인 헤더 -->
	



<!-- 메인 화면 시작 -->
<nav class="navbar navbar-default main_navi main_navi_sub">
  				

    				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table table-striped table-bordered table-hover" id="table">
    						 <thead id="thead">
    						 	<tr id="tr">
    						 	  	<th><a href="${pageContext.request.contextPath}/mymenu/recentepisode_list.do"><span>최근 본 작품</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/favorite_list.do"><span>관심작품</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/bookmark_list.do"><span>책갈피</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/purchase_list.do"><span>구매내역</span></a></th>    						
    						<th><a href="${pageContext.request.contextPath}/mymenu/rent_list.do"><span>대여내역</span></a></th>
    						<th><a href="${pageContext.request.contextPath}/mymenu/my_point.do"><span>내 포인트</span></a></th>
    						 		
    						 	</tr>
    						 </thead>
    						 
    						 </table>
    					
    					
    					
    					
      				
    					</div>
    				</div>
 
			</nav>
			
			
			
	<div class="container" id="content_all">
	  <div class="row">
	  
	  <!-- 관심등록 리스트 뿌려지는 곳 책 + 페이지번호 --> 	  		
<div class="block_bookmark container_content col-md-8" id="content">
		
		<!-- 조회된 관심등록이 있는 경우 시작 -->
		
		<a href="${pageContext.request.contextPath}/booklist/book_list.do?book_id=${carousel.id}">
						<c:choose>
							<c:when test="${carousel.imagePath != null}">
								<c:url var="downloadUrl" value="/download.do">
									<c:param name="file" value="${carousel.imagePath}" />
								</c:url>
								<img src="${downloadUrl}" alt="${carousel.book_name}" style="width: 1159px; height: 367px;"/>
							</c:when>
							
						</c:choose>
						
					</a>
		
		
		
		<!-- 게시물 항목 하나 -->	
	 <div class="block_bookmark_list col-md-8 col-lg-11">
		<c:choose>		
	<c:when test="${fn:length(favorite_list) > 0}">
	<c:forEach var="favorite" items="${favorite_list}">
		

	<c:url var="readUrl" value="/mymenu/favorite_list.do">
		<c:param name="favorite_id" value="${book.id}" />
	 </c:url>
	
		<!-- 링크 + 썸네일 -->
		<!--   <a class="img_box" href="${readUrl}"> -->
       <a class="img_box" href="${pageContext.request.contextPath}/booklist/book_list.do?book_id=${favorite.book_id}" >
		<c:choose>
				<c:when test="${favorite.imagePath != null}">
				<c:url var="downloadUrl" value="/download.do">
			<c:param name="file" value="${favorite.imagePath}" />
			</c:url>
			
			
			<img src="${downloadUrl}" class="img-responsive pull-left" />
			
			</c:when>
				<c:otherwise>
			<img src="${pageContext.request.contextPath}/assets/imgs/mymenu/no_image.jpg"  />
				</c:otherwise>
		</c:choose>
			</a>
	
		
		<!-- 회차 + 제목  -->		
     <div class="episode-content col-md-8 col-lg-9">
     
          </br>   
            <div>${favorite.book_name}</div>	
			<h4> ${favorite.book_author}  </h4>		
												
			</div>
					
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="col-md-12">
					<p class="text-center">조회되는 북마크가 없습니다.</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	    	
	  
	
	<!-- 조회된 북마크가 있는 경우 끝 -->
	
	 <!-- 페이지 번호 시작 -->
	 <div id="pagination" class="paginations">
	   <ul class="pagination"> 	 	 
	 <!-- 이전 그룹으로 이동 -->
	 <c:choose>
	  <c:when test="${pageHelper.prevPage > 0}">
           <!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
           <!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
          <c:url var="prevUrl" value="/mymenu/favorite_list.do">
              <c:param name="member_id" value="${member_id}"></c:param>
              <c:param name="page" value="${pageHelper.prevPage}"></c:param>
          </c:url>	  
          
          <li><a href="${prevUrl}">&laquo;</a></li>	  
	  </c:when>
	  <c:otherwise>
	     <!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
	     <li class='disabled'><a href="#">&laquo;</a></li> 
	  </c:otherwise>	  
	 </c:choose>
	 
	 <!--  페이지 번호 -->
	   <!-- 현재 그룹의 시작 페이지 ~끝페이지 사이를 1씩 증가하면서 반복 -->	   
	   <c:forEach var="i" begin="${pageHelper.startPage}" end="${pageHelper.endPage}" step="1">
	   
	    <!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하 page_url에 저장 -->
	    <c:url var="pageUrl" value="/mymenu/favorite_list.do">
              <c:param name="id" value="${id}"></c:param>
              <c:param name="page" value="${i}"></c:param>
	   </c:url>
	   
	   <!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
	   <c:choose>
	     <c:when test="${pageHelper.page == i}">
	        <li class='active'><a href="#">${i}</a></li>
	     </c:when>
	     <c:otherwise>
	         <li><a href="${pageUrl}"></a></li>
	     </c:otherwise>
	   </c:choose>
	   
	   </c:forEach>
	   
	   <!--  다름 그룹으로 이동 -->
	    <c:choose>
	  <c:when test="${pageHelper.nextPage > 0}">
           <!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
           <!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
          <c:url var="nextUrl" value="/mymenu/favorite_list.do">
              <c:param name="member_id" value="${member_id}"></c:param>
              <c:param name="page" value="${pageHelper.nextPage}"></c:param>
          </c:url>	  
          
          <li><a href="${nextUrl}">&raquo;</a></li>	  
	  </c:when>
	  
	  <c:otherwise>
	     <!-- 다음 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
	     <li class='disabled'><a href="#">&raquo;</a></li> 
	  </c:otherwise>	  
	 </c:choose>	   
	   </ul>
	 </div>
	 <!-- 페이지 번호 끝 -->
	 
	 </div>
	 <!-- 관심작품 리스트 뿌려지는 곳  끝-->
	 
	 
			<!-------- 연령별 선호작  ---------->
			<div class="hidden-xs hidden-sm col-xs-12 col-sm-4 text-center section_area list_rank box">
  						<h4 class="text-left">연령별 선호작품</h4>
						<div class="btn-group btn-group-justified" role="group" aria-label="...">
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default">남자</button>
							  </div>
							  <div class="btn-group" role="group">
							    <button type="button" class="btn btn-default">여자</button>
							  </div>

						</div>
						<div class="row empty_box_rank"></div>

						<!-- tab-x -->
						<div id="btn-group-justified">
						   <ul class="nav nav-tabs nav-justified">
						    <li class="active"><a data-toggle="tab" href="#home">10대</a></li>
						    <li><a data-toggle="tab" href="#menu1">20대</a></li>
						    <li><a data-toggle="tab" href="#menu2">30대</a></li>
						    <li><a data-toggle="tab" href="#menu3">40대</a></li>
						  </ul>
						
						  <div class="tab-content total_ranking_tab">
						    <div id="home" class="tab-pane fade in active">
						      <ul class="list-group listgroup_rank">
							      	<li  class="list-group-item text-"><a href="#">[판타지]마왕군 네크로맨서</a></li>
							      	<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
	     							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
	      							<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>	
	      							<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>	
	      							<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>	
	      							<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>	
	      							<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은 장미 아가씨</a></li>
	      							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
     				 			</ul>
     				 		</div>	
				    <div id="menu1" class="tab-pane fade">
				       <ul class="list-group listgroup_rank">
							      	<li  class="list-group-item text-"><a href="#">[판타지]마왕군 네크로맨서</a></li>
							      	<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
	     							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
	      							<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>	
	      							<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>	
	      							<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>	
	      							<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>	
	      							<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은 장미 아가씨</a></li>
	      							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>	
     				 			</ul>
				    </div>
				    <div id="menu2" class="tab-pane fade">
				    <ul class="list-group listgroup_rank">
							      	<li  class="list-group-item text-"><a href="#">[판타지]마왕군 네크로맨서</a></li>
							      	<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
	     							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
	      							<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>	
	      							<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>	
	      							<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>	
	      							<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>	
	      							<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은 장미 아가씨</a></li>
	      							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>	
     				 			</ul>
				    </div>
				    <div id="menu3" class="tab-pane fade">
				      <ul class="list-group listgroup_rank">
							      	<li  class="list-group-item text-"><a href="#">[판타지]마왕군 네크로맨서</a></li>
							      	<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
	     							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>
	      							<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>	
	      							<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>	
	      							<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>	
	      							<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>	
	      							<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은 장미 아가씨</a></li>
	      							<li class="list-group-item"><a href="#">[미스테리]그리고 아무도 없었다</a></li>	
     				 			</ul>
				    </div>
				  </div>
				</div>
			
		
							<!-- //tab-x end -->
							
					</div>
					<!-- 연령별 선호작 끝 -->
	 </div>
	

	</div>
			<!-- 메인 화면 끝 -->
	
	  <!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
	

	
	

	</body>
</html>