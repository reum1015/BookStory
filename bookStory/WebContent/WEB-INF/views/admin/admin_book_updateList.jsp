<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	    <style type="text/css">
			
	    </style>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">

		</script>
		
		<!-- admin css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/dataTables.bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/adminCommon.css"/>
	
		<script type="text/javascript">
			$(document).ready(function() {
			    $('#example').DataTable();
			} );
		
		</script>
	</head>
	<body>
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>

			
			
					

	
		<!-- 네비게이션 바 (메뉴 영역) -->
			<nav class="navbar navbar-default main_navi">
  				<div class="container">
    				<div class="navbar-header clearfix">   
				      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
     				<a href="${pageContext.request.contextPath}/index.do" class="navbar-brand bookstoryhome">BookStory</a>
    			</div>
    				<div class="container">
    					<div class="collapse navbar-collapse" id="myNavbar">
      						<ul class="nav navbar-nav">
						        <li class="todayNovel"><a href="${pageContext.request.contextPath}/todaynovel/today_novel.do">TodayNovel</a></li>
						        <li class="novelList"><a href="${pageContext.request.contextPath}/novellist/novel_list.do">NoveList</a></li>
						        <li class="community"><a href="${pageContext.request.contextPath}/community/article_list.do">Community</a></li>
						        <li class="mymenu"><a href="${pageContext.request.contextPath}/mymenu/recentepisode_list.do">MyMenu</a></li>
       							<li class="main_admin"><a href="${pageContext.request.contextPath}/admin/admin_main.do" class="main_navi_admin active">administrator</a></li>
        						<li><a href="#" class="visible-xs signup_icon"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        						<li><a href="#" class="visible-xs login_icon"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       							<li>
				        			<form class="navbar-form navbar-left pull-left search_form visible-xs" role="search">
							        	<fieldset>
							        	<div class="input-group form-group">
							        		
								        		<label class="sr-only" for="total_search">통합검색</label>
								          		<input type="text" class="form-control" placeholder="통합검색" id="total_search">
								        	
								          		<span class="input-group-btn">
								          			<button type="submit" class="btn btn-default">검색</button>
												</span>		          	
							          		
							          	</div>
							        	</fieldset>
							      	</form>
        
        
        						</li>
     					</ul>
 
	    	  		<div class="main_login">
						<form class="navbar-form navbar-left pull-right hidden-xs form-inline" role="search">
				        	<fieldset>
				        	<div class="input-group input-group-sm">
				          		<input type="text" class="form-control" placeholder="통합검색">
				        		<span class="input-group-btn"> <button type="submit" class="btn btn-default">검색</button></span>
				        	</div>
				        	</fieldset>
				      	</form>
					</div>
      
    </div>
    </div>
  </div>
</nav>	
		<nav class="navbar navbar-default main_navi main_navi_sub visible-xs">
  							<div class="container main_navi_sub_list">
  							<div class="table-responsive">
    							<table class="table">
    								<tr>
    									<td>업로드</td>
    									<td>업로드</td>
    									<td>업로드</td>
    								<tr>
    							</table>
    							</div>
    						</div>
					</nav>	



<!-- 메인 화면 시작 -->
	<div class="container-fluid admin_main_container hidden-xs">
		<div class="row admin_main_row">
			<!-- 어드민 슬라이드 메뉴 영역 -->
			<div class="col-md-2 amdin_main_slider">
	    		<ul class="nav main_slider_nav" id="admin_main_menu">
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/admin_userInfo.do">
	    				<span class="glyphicon glyphicon-user pull-left icon_color" aria-hidden="true"></span>회원 정보</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/notice_upload.do">
	    				<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>공지 사항 업로드</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/novel_upload.do">
	    				<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>신규 작품 업로드</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/episode_upload.do">
	    				<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>에피소드 업로드</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/book_manage.do">
	    				<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>작품 관리</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/article_manage.do">
	    				<span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>게시물 관리</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/comment_manage.do">
	    				<span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>댓글 관리</a>
	    			</li>
	    		</ul>
    		</div>
    	<!-- //어드민 슬라이드 메뉴 영역 -->
    		
	    	<!-- 어드민 컨텐트 영역 -->
			<div class="col-xs-10 admin_content admin_userInfo_container">
				<h1 class="page-header">작품 정보</h1>

				    <div class="media">
				    
				    	<c:url var="downloadUrl" value="/download.do">
				 			<c:param name="file" value="${bookItem.imagePath}" />
						</c:url>
						  <a class="pull-left" href="#">
						    <img class="media-object" style="width: 150px; height: 120px;" src="${downloadUrl }" alt="...">
						  </a>
						  <div class="media-body">
						    <h4 class="media-heading">${bookItem.book_name}</h4>
						    ${bookItem.intro}	
						  
						  <div class="bookUpdateButton" style="margin-top: 10px;">
						  <a href="${pageContext.request.contextPath}/admin/admin_bookAndEpisodeUpdate.do?book_id=${bookItem.id}" 
									class="btn btn-danger btn-sm">작품 수정</a></div>
						  </div>
						</div>
				
				<hr/>
				
				<h1 class="page-header">에피소드 목록</h1>
				<table id="example"class="table table-hover table-bordered table-responsive user_info_table"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							
							<th>회차</th>
							<th>제목</th>
							<th>구매가격</th>
							<th>대여가격</th>
							<th>별점</th>
							<th>등록일</th>
							<th>수정일</th>
							<th>수정</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							
							<th>회차</th>
							<th>제목</th>
							<th>구매가격</th>
							<th>대여가격</th>
							<th>별점</th>
							<th>등록일</th>
							<th>수정일</th>
							<th>수정</th>
						</tr>
					</tfoot>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(episodeList) > 0}">
								<c:forEach var="episodeList" items="${episodeList}">
										<tr>
											
											<td>${episodeList.episode_order}</td>
											<td>${episodeList.episode_name}</td>
											<td>${episodeList.episode_buy}</td>
											<td>${episodeList.episode_rent}</td>
											<td>${episodeList.total_star}</td>
											<td>${fn:substring(episodeList.reg_date, 0, 11)}</td>
											<td>${fn:substring(episodeList.edit_date, 0, 11)}</td>
											<td><a href="${pageContext.request.contextPath}/admin/admin_bookAndEpisodeUpdate.do?episode_id=${episodeList.id}&book_id=${bookItem.id}" 
													class="btn btn-danger btn-xs">작품 수정</a></td>
										</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>

				<!-- 유저 인포 메인 컨테이너 끝 -->


				<!-- 메인 화면 끝 -->

				<!-- //어드민 컨텐트 영역 -->

			</div>
			<!-- end row -->

    		
		</div> <!-- end row -->
		
	</div>
	<!-- 메인 화면 끝 -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

	
	<!-- Javascript -->

	<script src="${pageContext.request.contextPath}/assets/js/admin/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/admin/dataTables.bootstrap.min.js"></script>

	</body>
</html>