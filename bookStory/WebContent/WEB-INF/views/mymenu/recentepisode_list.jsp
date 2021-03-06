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
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/handlebars/handlebars-v4.0.5.js"></script>
		
		<script type="text/javascript">
		/* 메인 연령대 랭킹 탭 */
		 $(function(){
			 $('#age_tab a').on('shown.bs.tab',function(e){
				 //data - age 속성값 취득
				 var current_age = $(this).data("age");
				 
				 console.log(current_age);
				 
				 //Ajax요청을 통한 나이대별 순위(관심 등록순)
				 $.get('${pageContext.request.contextPath}/main/ageRankList.do',{age:current_age},
						 function (data) {
							var aa = data.age;
							
							var template = Handlebars.compile($("#age-rank-template").html());
							var html = template(data);
							$("#age_rank").empty().append(html);
						});
				 
			 });
			 
			 $('#age_tab a:eq(0)').tab('show');
		 })
		
		
		</script>
	</head>
	<body>

	<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"/>
		

<!-- 메인 화면 시작 -->
<nav class="navbar navbar-default main_navi main_navi_sub">
  				

    				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table table-striped table-bordered table-hover" id="table">
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
			
	<div class="container" id="content_all">
	  <div class="row">
	  
	  <!-- 북마크 리스트 뿌려지는 곳 에피소드 + 페이지번호 --> 	  		
<div class="block_bookmark container_content col-md-8" id="content">
		
		<!-- 조회된 북마크가 있는 경우 시작 -->
		<!-- 게시물 항목 하나 -->	
	 <div class="block_bookmark_list col-md-8 col-lg-11">
		<c:choose>		
	<c:when test="${fn:length(recentepisode_list) > 0}">
	<c:forEach var="recentepisode" items="${recentepisode_list}">
		

	<c:url var="readUrl" value="/mymenu/recentepisode_list.do">
		<c:param name="bookmark_id" value="${episode.id}" />
	 </c:url>
	
		<!-- 링크 + 썸네일 -->
		<a class="img_box" href="${pageContext.request.contextPath}/novelview/view_page.do?episode_id=${recentepisode.episode_id}&book_id=${recentepisode.book_id}" >
		<c:choose>
				<c:when test="${recentepisode.imagePath != null}">
				<c:url var="downloadUrl" value="/download.do">
			<c:param name="file" value="${recentepisode.imagePath}" />
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
            <h4>  ${recentepisode.book_name}  </h4> 
			<h4>제  ${recentepisode.episode_order} 화 ${recentepisode.episode_name}</h4>										
			</div>
					
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="col-md-12">
					<p class="text-center">최근 본 작품이 없습니다.</p>
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
          <c:url var="prevUrl" value="/mymenu/recentepisode_list.do">
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
	    <c:url var="pageUrl" value="/mymenu/recentepisode_list.do">
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
          <c:url var="nextUrl" value="/mymenu/recentepisode_list.do">
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
	 <!-- 북마크 리스트 뿌려지는 곳  끝-->
	 
	 
	 <!-------- 통합 랭킹 ---------->
			<!-------- 연령별 선호작  ---------->
			<div class="hidden-xs hidden-sm col-xs-12 col-sm-4 text-center section_area list_rank box">
  							<h4 class="text-left">연령별 선호작품</h4>
				<div class="row empty_box_rank"></div>

				<!-- tab-x -->
				<div id="btn-group-justified">
					<ul class="nav nav-tabs nav-justified" id="age_tab">
						<li><a data-toggle="tab" href="#age_rank" data-age="10">10대</a></li>
						<li><a data-toggle="tab" href="#age_rank" data-age="20">20대</a></li>
						<li><a data-toggle="tab" href="#age_rank" data-age="30">30대</a></li>
						<li><a data-toggle="tab" href="#age_rank" data-age="40">40대</a></li>
					</ul>

					<div class="tab-content total_ranking_tab">
						
						<div class="tab-pane fade in active" role="tabpanel" >
							<ul class="list-group listgroup_rank" id="age_rank">
							
							</ul>
						</div>
						
						
					</div>
					
					
				</div>
					<!-- 메인 연령대 순위 리스트 동적으로 생성될 화면 -->	
					<script id="age-rank-template" type="text/x-handlebars-template">
						{{#mainAgeList}}
							<li class="list-group-item"><a href="${pageContext.request.contextPath}/booklist/book_list.do?book_id={{id}}">
							[{{genre}}] {{book_name}}</a>
							</li>
						{{/mainAgeList}}
					</script>
							
			</div><!-- 연령별 선호작 끝 -->
	 </div>
	

	</div>
			<!-- 메인 화면 끝 -->
	
<!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>

	
	</body>
</html>

