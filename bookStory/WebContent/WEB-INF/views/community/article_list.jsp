<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
		
	<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
		
		<!-- 반응형 웹을 지원하지 않을 경우 -->
		<!-- <link rel="stylesheet" type="text/css" href="assets/css/non-responsive.css"/> -->
		
		<!-- IE8 이하 버전 지원 -->
	    <!--[if lt IE 9]>
	    <script type="text/javascript" src="assets/js/html5shiv.js"></script>
	    <script type="text/javascript" src="assets/js/respond.min.js"></script>
	    <![endif]-->
	
	    <!-- IE10 반응형 웹 버그 보완 -->
	    <!--[if gt IE 9]>
	    <link rel="stylesheet" type="text/css" href="assets/css/ie10.css" />
	    <script type="text/javascript" src="assets/js/ie10.js"></script>
	    <![endif]-->
	    
	    <style type="text/css">
			
	    </style>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">

		</script>
	<!-- Article css -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/articleCommon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/article/articleList.css" />


</head>
<body>

		<!-- 메인 헤더 -->
		<header class="main_header clearfix page-header hidden-xs">
			
			<!-- 메인 wrapper div -->
			<div class="container clearfix main_header_wrapperdiv">
				
				<!-- 메인 헤더 로그인 회원가입 화면-->
				     <ul class="nav navbar-nav navbar-right hidden-xs">
				        <li><a href="${pageContext.request.contextPath}/login/sign_up_agree.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				        <li><a href="${pageContext.request.contextPath}/login/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
   					</ul>
				
				<!-- 메인 헤더 이미지 -->
				<div class="container main_header_image">
					<h1 class="main_h1">
						<a href="${pageContext.request.contextPath}/index.do" id="main_image_link"></a>
					</h1>
					<p class="sr-only">북스토리 메인 헤더영역</p>
				</div>
				
			</div>
			<div id="top_mar"></div>
			
			
					
		</header>
	
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
						        <li class="mymenu"><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.do">MyMenu</a></li>
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



	<!-- 게시판 영역 -->
	<div class="container main_container">
		<div class="center-block">
	    	<img src="${pageContext.request.contextPath}/assets/imgs/article/freearticle.png" alt="자유게시판" class="img-rounded center-block"/>
		</div> 
		<table	class="table table-spriped table table-condensed table table-hover">
			<thead>
				<tr>
					<th class="text-center">글번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
					<th class="text-center">조회수</th>
				</tr>
				<tr>
					<th class="text-center">공지</th>
					<th class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
					<th class="text-center">413</th>
				</tr>
				<tr>
					<th class="text-center">공지</th>
					<th class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성일</th>
					<th class="text-center">5434</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="text-center">8</td>
					<td class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">13</td>
				</tr>
				<tr>
					<td class="text-center">7</td>
					<td class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">312</td>
				</tr>
				<tr>
					<td class="text-center">6</td>
					<td class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">43</td>
				</tr>
				<tr>
					<td class="text-center">5</td>
					<td class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">39</td>
				</tr>
				<tr>
					<td class="text-center">4</td>
					<td class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">908</td>
				</tr>
				<tr>
					<td class="text-center">3</td>
					<td class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">908</td>
				</tr>
				<tr>
					<td class="text-center">2</td>
					<td class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">908</td>
				</tr>
				<tr>
					<td class="text-center">1</td>
					<td class="text-center"><a href="${pageContext.request.contextPath}/community/article_read.do">제목제목제목제목제목제목제목제목제목</a></td>
					<td class="text-center">작성자</td>
					<td class="text-center">작성일</td>
					<td class="text-center">908</td>
				</tr>
			</tbody>
		</table>
			<p class="navbar-right">
				<a href="./article_write.do"><button type="submit" class="btn btn-default">글쓰기</button></a>
			</p>
		<div class="jb-center">
           <ul class="pagination">
              <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
              <li><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
            </ul>
          </div>
          <div class="navbar">
          <form class="navbar-form navbar-right" role="search">
          	<select class="form-control">
          		<option>전체</option>
          		<option>제목</option>
          		<option>글번호</option>
          		<option>작성자</option>
          	</select>
			<div class="form-group">
		  		<input type="text" class="form-control" placeholder="게시글 검색">
			</div>
			<button type="submit" class="btn btn-default">검색</button>
	      </form>
	      </div>
	</div>
	
<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

</body>
</html>