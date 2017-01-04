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
<jsp:include page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>
			<!-- 메인 헤더 -->
	



<!-- 메인 화면 시작 -->
	<div class="container" id="content_all">
	  <div class="row">
	  
	 <!-- 관심등록 리스트 뿌려지는 곳 책 + 페이지번호 --> 	  		
<div class="block_bookmark container_content col-md-8" id="content">

   
		
				
		<!-- 게시물 항목 하나 -->	
	 <div class="block_bookmark_list col-md-8 col-lg-11">
		<c:choose>		
	<c:when test="${fn:length(bookitem) > 0}">
	<c:forEach var="book" items="${bookitem}">
		

	<c:url var="readUrl" value="/book/book_list.do">
		<c:param name="book_id" value="${book.id}" />
	 </c:url>
	
		<!-- 링크 + 썸네일 -->
		<!--   <a class="img_box" href="${readUrl}"> -->
       <a class="img_box" href="${pageContext.request.contextPath}/booklist/book_list.do?book_id=${book.id}" >
		<c:choose>
				<c:when test="${book.imagePath != null}">
				<c:url var="downloadUrl" value="/download.do">
			<c:param name="file" value="${book.imagePath}" />
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
            <div>${book.book_name}</div>	
			<h4> ${book.book_author}  </h4>		
												
			</div>
					
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="col-md-12">
					<p class="text-center">조회되는 책 리스트가 없습니다.</p>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	    	
	    	
	    	
	    	

	    	
	  
	
	<!-- 조회된 북마크가 있는 경우 끝 -->
	

	 
	 </div>
	 <!-- 북마크 리스트 뿌려지는 곳  끝-->
	 
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
			
			<script type="text/javascript">

			</script>
	
	
	  <!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
		
	
	</body>
</html>