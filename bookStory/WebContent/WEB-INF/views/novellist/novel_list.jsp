<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
		
			<!-- ajax -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.js"></script>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugins/handlebars/handlebars-v4.0.5.js"></script>

    <!-- Multi-column -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/multi-column/ie-row-fix.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/multi-column/multi-columns-row.css"/>
		
	    
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">

		</script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/novelListCommon.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/novelList.css"/>
		
	
	    
	    <script type="text/javascript">
	    
	    var current_genre	//현재 장르 저장 전역 변수
	   
	    $(function() {
	    	
	    	//페이지 시작시에 로맨스 리스트 출력
	    	 $.get('${pageContext.request.contextPath}/novellist/genre_novel.do',{genre:'Romance'},function(data){
	     		
	    		 current_genre = "Romance";
	    		 
	     		$("#genreNovel").empty();
	     		$("#genretab > li").removeClass("genre_active");
	     		
	     		// 템플릿 HTML을 로드한다.
	 			var template = Handlebars.compile($("#entry-template").html());
	 			// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
	 			var html = template(data);
	 			// 결합된 결과를 목록에 추가한다.
	 			$("#genreNovel").append(html);
	 			addClassGenre('Romance');
	 			
	 			
	 		});
	    	
	    	//장르 탭 클릭시
		    	$(document).on("click","#genretab a",function(e){
		    		current_genre = $(this).data("value");
		    		
		    		console.log(current_genre);
		    		
		    		$.get('${pageContext.request.contextPath}/novellist/genre_novel.do',{genre:current_genre},function(data){
			    		var gen = current_genre
			    		
			    		$("#genreNovel").empty();
			    		$("#genretab > li").removeClass("genre_active");
			    		
			    		// 템플릿 HTML을 로드한다.
						var template = Handlebars.compile($("#entry-template").html());
						// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
						var html = template(data);
						// 결합된 결과를 목록에 추가한다.
						$("#genreNovel").append(html);
						addClassGenre(gen);
		    
		    			
		   		 }); 
	
			});
	    	
		    	 var day;	
				    //	정렬 종류 버튼 클릭
				    $(document).on("click","#orderList a",function(e){	
				    		console.log("클릭 실행");
				    		var genre = current_genre
							var order =  $(this).attr("data-order");
							var chText = orderTextChange(order);
							$("#order_button").text(chText);
				    		 console.log('current_day --> ' + genre);
				    		 
				    		$.get('${pageContext.request.contextPath}/novellist/genre_novel.do',{genre:current_genre,order:order},function(data){
					    		var genre = current_genre
					    		
					    		$("#genreNovel").empty();
					    		
					    		// 템플릿 HTML을 로드한다.
								var template = Handlebars.compile($("#entry-template").html());
								// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
								var html = template(data);
								// 결합된 결과를 목록에 추가한다.
								$("#genreNovel").append(html);
				   		 }); 
					});	
	    	})
		
			function addClassGenre(xid){
	    		$('#'+xid).addClass("genre_active");
	    		$('#'+xid+'>a').attr("href","#");
	    	}
			
			 function orderTextChange(e){
				 var order = e;
				 
				 if(order=='read'){
					 order='조회순';
				 }else if(order=='title'){
					 order='제목순';
				 }else if(order=='star'){
					 order='별점순';
				 }else if(order=='like'){
					 order='관심등록순';
				 }
				 return order;
			 }
	    
	    </script>
		
	</head>
	<body>

		<!-- 메인 헤더 -->
		<jsp:include page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>

<!-- 
    				<div class="container main_navi_sub_list">
    					<div class="" id="myNavbar_sub">
      						<ul class="nav navbar-nav">
						        <li><a href="./adminUserInfo.do">회원 관리</a></li>
						        <li><a href="./articlemanage.do">게시판 OR 댓글 관리</a></li>
						        <li><a href="./articleUpload.do">작품 올리기</a></li>
     						</ul>
    					</div>
    				</div>

 -->
 
 

 				<!-- 네비게이션 바 (메뉴 영역)
     			<nav class="navbar navbar-default main_navi main_navi_sub" id="byday">
     				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table" id=" by_day_table">
    						 
    						 <thead>
    						 	<tr class="by_day_table_tr">
    						 		<th><a href="#">월요일</a></th>
    						 		<th><a href="#">화요일</a></th>
    								<th><a href="#">수요일</a></th>
    								<th><a href="#">목요일</a></th>
    								<th><a href="#">금요일</a></th>
    								<th><a href="#">토요일</a></th>
    								<th><a href="#">일요일</a></th>
    								
    						 		
    						 	</tr>
    						 </thead>
    						 
    						 </table>
    					</div>
    				</div>
 	</nav>
  -->
 
			<!--  네비게이션 바 (메뉴 영역)  -->
			<nav class="navbar navbar-default main_navi main_navi_sub">
  					<div class="container main_navi_sub_list" id="nav">
    					<div class="" id="myNavbar_sub">
      						<ul class="nav navbar-nav" style="border-bottom: 0" id="genretab">
						        <li id="Romance"><a href="#genreNovel" data-toggle="tab" data-value="Romance">로맨스</a></li>
						        <li id="SFFantasy"><a href="#genreNovel" data-toggle="tab" data-value="SFFantasy">SF&amp;판타지</a></li>
						        <li id="Heroism"><a href="#genreNovel" data-toggle="tab" data-value="Heroism">무협</a></li>
						        <li id="Mystery"><a href="#genreNovel" data-toggle="tab" data-value="Mystery">미스터리</a></li>
						        <li id="Fusion"><a href="#genreNovel" data-toggle="tab" data-value="Fusion">퓨전</a></li>
     						</ul>
     					
     					
     					<!-- 버튼 그룹 -->
						<div class="pull-right">
							
							<!-- 조회순 버튼 -->
    					  <div class="btn-group check_button" style="margin-top: 6.5px;">
								<button type="button" data-toggle="dropdown" class="btn btn-warning dropdown-toggle" id="order_button">
									조회순 <span class="caret"></span></button>
									<ul class="dropdown-menu" id="orderList">
											<li><a href="#" data-order="read">조회순</a></li>
											<li><a href="#" data-order="title">제목순</a></li>
											<li><a href="#" data-order="star">별점순</a></li>
										    <li><a href="#" data-order="like">관심등록순</a></li>
									</ul>
							</div>
							<!--// 조회순 버튼 -->	
							
							</div>
							<!-- //버튼 그룹 -->
							
							
    					</div>
    				</div>
			</nav>	

<!-- 메인 화면 시작 -->
	<div class="container main_container">


	<script id="entry-template" type="text/x-handlebars-template">	
	{{#ggenreList}}
		<div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="${pageContext.request.contextPath}/booklist/book_list.do?book_id={{id}}" class="main_list">
								<img alt="thumb" src="${pageContext.request.contextPath}/download.do?file={{imagePath}}" class="main_list_img">
								
				                    <span class="caption list_info">
				                    	<span class="genre">{{genre}}</span>
				                    	<span class="subj v2">{{book_name}}</span>
				                    	
				                    	<span>
				                    		<span class="author v2">{{book_author}}</span> 
				                    
				                    	</span>
				                    	<span class="score_area">
											<span class="icon_star"></span>
											<em class="score">{{total_star}}</em>
										</span>
				                    	<span class="favorite">
											<span>관심</span>
											<span>{{total_favorite}}</span>
										</span>
										<span class="emptybox">
										
										</span>
									</span>
							</a>
						</div>
					</div>
		{{/ggenreList}}
	</script>


			 <!-- 장르별 추천작 리스트 -->
        <div class="row genre_row" id="genreNovel">
             <!-- 항목1 -->
           

			</div> <!-- 장르별 추천작 리스트 끝-->
	
	
				<!-- 페이지 네이션 -->

						<!-- 페이지 네이션  끝-->
	</div>
	
			<!-- 메인 화면 끝 -->
	
	<!-- footer -->
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

	</body>
</html>