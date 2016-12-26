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
	  
	 <!-- 관심등록 리스트 뿌려지는 곳 책 + 페이지번호 --> 	  		
<div class="block_bookmark container_content col-md-8" id="content">

   
		
				
		<!-- 게시물 항목 하나 -->	
	 <div class="block_bookmark_list col-md-8 col-lg-11">
		<c:choose>		
	<c:when test="${fn:length(bookitem) > 0}">
	<c:forEach var="search" items="${bookitem}">
		

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
			<div class="hidden-xs hidden-sm col-xs-12 col-sm-4 col-md-4 text-center section_area list_rank box">
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
			
			<script type="text/javascript">
			$(function() {
				
				 //업로드 유효성 검사(이미지)
				 $("#episode_upload").submit(function() {
						var episode_imgValue = document.getElementById('episode_img').value

						if(episode_imgValue == null || episode_imgValue ==""){
							alert("이미지를 등록해 주세요");
							return false;
						}
				});
	
				$("#search-form").ajaxForm(function(json) {
					
					$("#search_resultBox").empty();
					
					//keyword 받아오기
					var keyword = $("#keyword").val();
					
					// json은 API에서 표시하는 전체 데이터
					if (json.rt != "OK") {
						alert(json.rt);
						return false;
					}

					// 템플릿 HTML을 로드한다.
					var template = Handlebars.compile($("#List-item-templ").html());
					// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
					var html = template(json);
					// 결합된 결과를 덧글 목록에 추가한다.
					$("#search_resultBox").append(html);
					
					//검색결과에 있는 값 ---> 폼으로 이동
					$("div#search_resultBox a").click(function(e) {
						
						var bookName = $(this).find("h3").text();
						var bookAuthor = $(this).find("i").text();
						var dailyDate = $(this).find("#daily_date").val();
						var id = $(this).find("#id").val();
						var genre = $(this).find("#genre").val();
						
						
						
						$("#form_book_title").attr("value",bookName);
						$("#form_genre").attr("value",genre);
						$("#form_daily_date").attr("value",dailyDate);
						$("#book_id").attr("value",id);
							
						$("#episode_name").focus();
						
					});				
				});
				
				
				//이미지 미리 보기
				 $("#episode_img").change(function(){
				        readURL(this);
				        var carousel_value = document.getElementById('episode_img').value
				        if(carousel_value == null || carousel_value==""){
				        	$('#img_box').css('display','none')
							return false;
				        }
				    });
				
				 function readURL(input) {
				        if (input.files && input.files[0]) {
				            var reader = new FileReader();
				            
				            reader.onload = function (e) {
				            	$('#img_box').css('display','block');
				            	$('#episode_imgBox').css('display','block');
				                $('#episode_imgBox').attr('src', e.target.result);
				            }
				            
				            reader.readAsDataURL(input.files[0]);
				        }
				    }
			})
			</script>
	
	
	  <!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>
		
	
	</body>
</html>