<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
		
	<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>
		
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