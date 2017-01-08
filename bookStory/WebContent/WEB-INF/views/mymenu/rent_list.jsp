<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>

<jsp:include page="/WEB-INF/views/template/head.jsp"/>

<!-- 스타일 sheet -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/mymenu.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/mymenuCommon.css" />


</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"/>
		


	<!-- 메인 화면 시작 -->
	<nav class="navbar navbar-default main_navi main_navi_sub">


		<div class="container main_navi_sub_list">
			<div class="table-responsive" id="myNavbar_sub">
				<table class="table table-striped table-bordered table-hover"
					id="table">
					<thead>
						<tr>
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

	<div class="rent_totallist">
	<div class="container" id="content">
	
		<!-- 구매내역 리스트 뿌려지는 곳 책 + 페이지번호 --> 	  
		
			<table class="table">
		
			
					<thead>
						<tr>
							<th class="list-menu col-lg-3 col-md-3">구매일자</th>
							<th class="list-menu col-lg-5 col-md-5">책 제목</th>
							<th class="list-menu col-lg-2 col-md-2">대여 금액</th>
							<th class="list-menu col-lg-2 col-md-2">대여 종료일자</th>
						</tr>
					</thead>
					<c:choose>
					 <c:when test="${fn:length(rent_list) > 0}">
			 <c:forEach var="rent" items="${rent_list}">
					<c:url var="readUrl" value="/mymenu/rent_list.do">
		<c:param name="rent_id" value="${rent.id}" />
	        </c:url> 
					<tbody>
						<tr>
							<td class="content-menu">${rent.rent_day}</td>
							<td class="content-menu"><a href="${pageContext.request.contextPath}/novelview/view_page.do?episode_id=${rent.episode_id}&book_id=${rent.book_id}" >${rent.episode_name}</a></td>														
							<td class="content-menu">${rent.rent_point}</td>
							<td class="content-menu">${rent.rent_outday}</td>
		<!-- <td><a href="${pageContext.request.contextPath}/novelview/view_page.do?episode_id=${rent.episode_id}">{rent.episode_name}</a></td> -->
						</tr>						
					</tbody>
					</c:forEach>
					</c:when>
					</c:choose>
				</table>
					
			<!-- 페이지 번호 시작 -->
	 <div id="pagination" class="paginations">
	   <ul class="pagination"> 	 	 
	 <!-- 이전 그룹으로 이동 -->
	 <c:choose>
	  <c:when test="${pageHelper.prevPage > 0}">
           <!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
           <!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
          <c:url var="prevUrl" value="/mymenu/rent_list.do">
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
	    <c:url var="pageUrl" value="/mymenu/rent_list.do">
              <c:param name="id" value="${id}"></c:param>
              <c:param name="page" value="${i}"></c:param>
	   </c:url>
	   
	   <!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
	   <c:choose>
	     <c:when test="${pageHelper.page == i}">
	        <li class='active'><a href="#">${i}</a></li>
	     </c:when>
	     <c:otherwise>
	         <li><a href="${pageUrl}">${i}</a></li>
	     </c:otherwise>
	   </c:choose>
	   
	   </c:forEach>
	   
	   <!--  다름 그룹으로 이동 -->
	    <c:choose>
	  <c:when test="${pageHelper.nextPage > 0}">
           <!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
           <!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
          <c:url var="nextUrl" value="/mymenu/rent_list.do">
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
			<!-- 구매내역 리스트 뿌려지는 곳 책 + 페이지번호끝  -->
		</div>
	
	<!-- 메인 화면 끝 -->


<!-- footer -->
			<jsp:include page="/WEB-INF/views/template/footer.jsp"/>



</body>
</html>
