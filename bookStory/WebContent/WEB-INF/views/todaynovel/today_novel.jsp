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
		
	    
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">

		</script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/todayNovelCommon.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/todaynovel.css"/>
		
		<style type="text/css">
	    

	    /*장르선택 버튼*/
	    .check_button{
				margin-top: 3px;
		}
		
		.nav-tabs > li:HOVER {
				 border: none;
    background: none;
    color: #00adee;
    margin: 0 !important;
		}
			
	    </style>
	    
	    <script type="text/javascript">
	    	$(function() {
	    		/* 오늘 요일 구하기 */
		    	var d = new Date();
		    	
		    	var week = new Array('SUN','MON','THE','WEN','THU','FRI','SAT');
		    	
		    	var today = week[d.getDay()];
		    
		    			var current_day = $(this).data("today")
		    	
				    	$.get('${pageContext.request.contextPath}/todaynovel/todayList.do',{today:today},function(data){
				    		var day = today
				    		
				    		$("#todayNovel").empty();
				    		
				    		$("todaytab > li").removeClass('day_active');
				    		
				    		 // 템플릿 HTML을 로드한다.
							var template = Handlebars.compile($("#entry-template").html());
							// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
							var html = template(data);
							// 결합된 결과를 목록에 추가한다.
							$("#todayNovel").append(html);
							
							//메뉴의 오늘 요일에 클래스 On
							addClassToday(day);
							
						
							
		    			});
		    	
		    		
		    	$(document).on("click","#todaytab a",function(e){
		    		var selected_day = $(this).data("today");
		    		
		    		$.get('${pageContext.request.contextPath}/todaynovel/todayList.do',{today:selected_day},function(data){
			    		var day = selected_day
			    		
			    		$("#todayNovel").empty();
			    		$("#todaytab > li").removeClass("day_active");
			    		
			    		// 템플릿 HTML을 로드한다.
						var template = Handlebars.compile($("#entry-template").html());
						// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
						var html = template(data);
						// 결합된 결과를 목록에 추가한다.
						$("#todayNovel").append(html);
						
						//메뉴의 오늘 요일에 클래스 On
						addClassToday(day);
		    
		    			
		   		 }); 
	
			});
	    	
	    	})
			function addClassToday(xid){
	    		
	    		$('#'+xid).addClass("day_active");
	    		$('#'+xid+'>a').attr("href","#");
	    		
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
  					<div class="container main_navi_sub_list">
    					<div class="" id="myNavbar_sub">
      						<ul class="nav navbar-nav" style="border-bottom: 0" id="todaytab">
						        <li id="MON"><a href="#todayNovel" data-toggle="tab" data-today="MON">월요일</a></li>
						        <li id="THE"><a href="#todayNovel" data-toggle="tab" data-today="THE">화요일</a></li>
						        <li id="WEN"><a href="#todayNovel" data-toggle="tab" data-today="WEN">수요일</a></li>
						        <li id="THU"><a href="#todayNovel" data-toggle="tab" data-today="THU">목요일</a></li>
						        <li id="FRI"><a href="#todayNovel" data-toggle="tab" data-today="FRI">금요일</a></li>
						        <li id="SAT"><a href="#todayNovel" data-toggle="tab" data-today="SAT">토요일</a></li>
						        <li id="SUN"><a href="#todayNovel" data-toggle="tab" data-today="SUN">일요일</a></li>
     						</ul>
     					
     					
     					<!-- 버튼 그룹 -->
						<div class="pull-right">
							<!-- 장르선택 버튼 -->
    					  <div class="btn-group check_button">
								<button type="button" data-toggle="dropdown" class="btn btn-warning dropdown-toggle" id="genre_button">전체 <span class="caret"></span></button>
									<ul class="dropdown-menu">
											<li><a href="#">전체</a></li>
										   <li><a href="#">로맨스</a></li>
										     <li><a href="#">SF&amp;판타지</a></li>
										     <li ><a href="#">무협</a> </li>
										     <li ><a href="#">미스터리</a> </li>
										     <li ><a href="#">퓨전</a> </li>
									</ul>
							</div>
							<!--// 장르선택 버튼 -->	
							<!-- 조회순 버튼 -->
    					  <div class="btn-group check_button">
								<button type="button" data-toggle="dropdown" class="btn btn-warning dropdown-toggle" id="genre_button">조회순 <span class="caret"></span></button>
									<ul class="dropdown-menu">
											<li ><a href="#">조회순</a> </li>
											<li><a href="#">별점순</a></li>
										   <li><a href="#">제목순</a></li>
										     <li><a href="#">관심등록순</a></li>
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
	{{#todayList}}
		<div class="col-xs-6 col-sm-3 main_list_genre">
						<div class="thumbnail main_thumbbox">
							<a href="${pageContext.request.contextPath}/booklist/book_list.do?book_id={{id}}" class="main_alist">
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
		{{/todayList}}
	</script>


			 <!-- 장르별 추천작 리스트 -->
        <div class="row genre_row" id="todayNovel">
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