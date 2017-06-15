<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<!-- 깃허브 테스트 -->
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>

<style type="text/css">
</style>
	<!-- ajax -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.js"></script>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/handlebars/handlebars-v4.0.5.js"></script>
<script type="text/javascript">
			$(function(){
				
				$(".male_button").click(function(){
					$(".main_gender_list_female").css('display','none');
					$(".main_gender_list_male").css('display', 'block');
					$(".male_button").css('background-color','#FFEBCD');
					$(".female_button").css('background-color','#FFF');
				});
				
				$(".female_button").click(function(){
					$(".main_gender_list_female").css('display','block');
					$(".main_gender_list_male").css('display', 'none');
					$(".male_button").css('background-color','#FFF');
					$(".female_button").css('background-color','#FFEBCD');
				});
				
				//장르선택 드롭다운 버튼
				//페이지가 시작되면서 장르로 선택되어짐
				var genre = $("#genreForDrop").val();
				 $("#genre_button").text(jenreTextChange(genre));
				
				 //장르별 드롭다운 선택시 ajax
				 $(document).on("click","#genreList a",function(e){
					 e.preventDefault();
					 var genre = $(this).attr("data-value");
					 var aa = jenreTextChange(genre);
					 $("#genre_button").text(aa);
					 
					 $.get("${pageContext.request.contextPath}/main/genreList.do",{genre:genre},function(data){
								
						// json은 API에서 표시하는 전체 데이터
							if (data.rt != "OK") {
								alert(json.rt);
								return false;
							}
						 //통신 성공시에 원래 있던 작품 리스트 삭제
						 	$(".genre_row").empty();
						
						 // 템플릿 HTML을 로드한다.
							var template = Handlebars.compile($("#entry-template").html());
							// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
							var html = template(data);
							// 결합된 결과를 덧글 목록에 추가한다.
							$(".genre_row").append(html);
					 });
					 
				
				 }); 
				 
				 /* 메인 연령대 랭킹 탭 */
				 
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
				 
				 function jenreTextChange(e){
					 var genre = e;
					 
					 if(genre=='Romance'){
						 genre='로맨스';
					 }else if(genre=='SF&Fantasy'){
						 genre='SF&판타지';
					 }else if(genre=='Heroism'){
						 genre='무협';
					 }else if(genre=='Mystery'){
						 genre='미스테리';
					 }else if(genre=='Fusion'){
						 genre='퓨전';
					 }
					 return genre;
				 }
				
			});
		</script>
</head>
<body>
	<!-- 메인 섹션 시작 -->
	<div class="container main_container">

		<!-- 캐러셀 시작 -->
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<c:forEach var="carousel" items="${carouselList}" varStatus="status">
					<c:set var="cls" value="" />
					<c:if test="${status.index == 0}">
						<c:set var="cls" value="active" />
					</c:if>
				<li data-target="#carousel" data-slide-to="${status.index}" class="${cls}"></li>
				</c:forEach>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<c:forEach var="carousel" items="${carouselList}"  varStatus="status">
					<c:set var="cls" value="" />
					<c:if test="${status.index == 0}">
						<c:set var="cls" value="active" />
					</c:if>
			
				<c:url var="image_url" value="/download.do">
				<c:param name="file" value="${carousel.imagePath}" />
				</c:url>
			
				<div class="item ${cls}">
					<a href="${pageContext.request.contextPath}/booklist/book_list.do?book_id=${carousel.id}">
						<c:choose>
							<c:when test="${carousel.imagePath != null}">
								<c:url var="downloadUrl" value="/download.do">
									<c:param name="file" value="${carousel.imagePath}" />
								</c:url>
								<img src="${downloadUrl}" alt="${carousel.book_name}" style="width: 1159px; height: 367px;"/>
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/assets/imgs/no_image.jpg" style="width: 1159px; height: 367px;"/>
							</c:otherwise>
						</c:choose>
						<div class="carousel-caption">
							<h3>${carousel.genre}</h3>
							<h1>${carousel.book_name}</h1>
							<h3>${carousel.book_author}</h3>
						</div>
					</a>
					
				</div>
			</c:forEach>

			</div>
			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- 캐러셀 끝 -->

		<input type="hidden" id="genreForDrop" value="${selectGenre}">
		<!-- 장르별 추천작 시작-->
		<!-- 장르별 추천작 & 드롭다운 메뉴(장르 선택) -->
		<div class="dropdown genre_choice">
			<h4 id="genre_title">장르별 추천작</h4>
			<div class="btn-group pull-right check_button">
				<button type="button" data-toggle="dropdown"class="btn btn-warning dropdown-toggle" id="genre_button">
					장르선택 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu" id="genreList">
					<li><a href="#" id="Romance" data-value="Romance">로맨스</a></li>
					<li><a href="#" id="SF&Fantasy" data-value="SF&Fantasy">SF&amp;판타지</a></li>
					<li><a href="#" id="Heroism" data-value="Heroism">무협</a></li>
					<li><a href="#" id="Mystery" data-value="Mystery">미스터리</a></li>
					<li><a href="#" id="Fusion" data-value="Fusion">퓨전</a></li>
				</ul>
			</div>
		</div>
		<!-- 장르별 추천작 & 드롭다운 메뉴(장르 선택) 끝 -->


		<!-- 장르별 추천작 리스트 -->
		<div class="row genre_row">
	<c:choose>
		<c:when test="${fn:length(mainGenrelList) > 0}">
			<c:forEach var="mainGenrelList" items="${mainGenrelList}">
				<div class="col-xs-6 col-sm-3 main_list_genre" id="main_genre_section">
					<div class="thumbnail main_thumbbox">
						<c:url var="bookListURL" value="/booklist/book_list.do">
				 			<c:param name="book_id" value="${mainGenrelList.id}" />
						</c:url>
						<a href="${bookListURL}" class="main_alist"> 
						<span class="icon_new"></span>
						<c:url var="downloadUrl" value="/download.do">
			 			<c:param name="file" value="${mainGenrelList.imagePath}" />
					</c:url>
						 <img alt="thumb"src="${downloadUrl}" class="main_list_img"> 
						 <span class="caption list_info">
							
							 <span class="subj v2">${mainGenrelList.book_name}</span>
						
						<span class="author_info"> 
							 <span class="author v2">${mainGenrelList.book_author}</span>
						  <span class="num_total">총 ${mainGenrelList.totalEpisodeCount} 회</span>
						</span>
						<span class="text ellipsis">							
								<span class="summary">
								${mainGenrelList.intro}
								</span>
						</span>
						<span class="score_area"> 
						<span class="icon_star">
						</span>
								<em class="score">${mainGenrelList.total_star}</em>
						</span> 
						<span class="favorite favorite_count"> 
						<span>관심</span> 
						<span>${mainGenrelList.total_favorite}</span>
					</span>
					</span>
					</a>
				</div>
		</div>
		
		
				</c:forEach>
			</c:when>
		</c:choose>
			</div>
		<c:choose>
		<c:when test="${fn:length(mainGenrelList) == 0}">
			<h1>장르별 작품</h1>
		
		</c:when>
		</c:choose>
		<!-- 드롭다운 장르선택에 동적으로 생성될 화면 -->	
		<script id="entry-template" type="text/x-handlebars-template">
					{{#mainGenrelListForDrop}}
					<div class="col-xs-6 col-sm-3 main_list_genre" id="main_genre_section">
						<div class="thumbnail main_thumbbox" id="genre_drop">
						<a href="${pageContext.request.contextPath}/booklist/book_list.do?book_id={{id}}" class="main_alist"> 
						<span class="icon_new"></span>

						 <img alt="thumb"src="${pageContext.request.contextPath}/download.do?file={{imagePath}}" class="main_list_img"> 
						 <span class="caption list_info">
							
							 <span class="subj v2">{{book_name}}</span>
						
						<span class="author_info"> 
							 <span class="author v2">{{book_author}}</span>
						  <span class="num_total">총 {{totalEpisodeCount}} 회</span>
						</span>
						<span class="text ellipsis">							
								<span class="summary">
								{{{intro}}}
								</span>
						</span>
						<span class="score_area"> 
						<span class="icon_star">
						</span>
								<em class="score">{{total_star}}</em>
						</span> 
						<span class="favorite favorite_count"> 
						<span>관심</span> 
						<span>{{total_favorite}}</span>
					</span>
					</span>
					</a>
				</div>
</div>
	{{/mainGenrelListForDrop}}
		</script>
		
		
		
		
		
			<!-- 항목1
 -->
		<!-- 장르별 추천작 리스트 끝-->



		<!-- 남여별 인기작 & 통합 랭킹 -->

		<div class="row gender_row">

			<!-- 남녀별 인기작 -->
			<div
				class="col-xs-12 col-sm-8 text-left section_area list_gender box">


				<div class="list_gender_titleButton_div">
					<h4 class="list_gender_title">남여별 인기작</h4>

					<div class="btn-group list_gender_button" data-toggle="buttons">

						<a href="#" class="btn btn-default female_button" role="button">여성</a>
						<a href="#" class="btn btn-default male_button" role="button">남성</a>

					</div>
				</div>


	<div class="main_gender_list_female">
	<c:choose>
		<c:when test="${fn:length(femaleList) > 0}">
			<c:forEach var="femaleList" items="${femaleList}">
					<div class="col-xs-6 col-md-4 list_gender_li">
						<div class="thumbnail main_gender_list">
						<c:url var="bookListURL" value="/booklist/book_list.do">
				 			<c:param name="book_id" value="${femaleList.id}" />
						</c:url>
						
							<a href="${bookListURL}"> <span class="gender_list_skin"></span> <span
								class="icon_new"></span> 
								
								<c:url var="downloadUrl" value="/download.do">
			 						<c:param name="file" value="${femaleList.imagePath}" />
								</c:url>
								
								<img class="gender_list_img img-response" src="${downloadUrl}"
								alt="Pulpit Rock"> 
								<span class="main_gender_info">
									 <span class="gender_title">${femaleList.book_name}</span> 
									 <span class="gender_author">${femaleList.book_author}</span>
								</span>
							</a>
						</div>
					</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
				
				
				<!-- 남여별 인기작 숨김영역 남자 -->
	<div class="main_gender_list_male">
	<c:choose>
		<c:when test="${fn:length(maleList) > 0}">
			<c:forEach var="maleList" items="${maleList}">
					<div class="col-xs-6 col-md-4 list_gender_li">
						<div class="thumbnail main_gender_list">
						<c:url var="bookListURL" value="/booklist/book_list.do">
				 			<c:param name="book_id" value="${maleList.id}" />
						</c:url>
						
							<a href="${bookListURL}"> <span class="gender_list_skin"></span> <span
								class="icon_new"></span> 
								
								<c:url var="downloadUrl" value="/download.do">
			 						<c:param name="file" value="${maleList.imagePath}" />
								</c:url>
								
								<img class="gender_list_img img-response" src="${downloadUrl}"
								alt="Pulpit Rock"> 
								<span class="main_gender_info">
									 <span class="gender_title">${maleList.book_name}</span> 
									 <span class="gender_author">${maleList.book_author}</span>
								</span>
							</a>
						</div>
					</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
				
				
				
			</div>
			<!-------- 연령별 선호작  ---------->
			<div class="col-xs-12 col-sm-4 text-center section_area list_rank box">
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
	
			</div>
			<!-- 연령별 선호작 끝 -->

		</div>
		<!-- 남여별 인기작 & 통합 랭킹 끝 -->

	</div>
	<!-- 메인 섹션 끝 -->





	<!-- footer include -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

</body>
</html>