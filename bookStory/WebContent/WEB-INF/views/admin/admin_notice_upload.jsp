<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
		<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	    <style type="text/css">
			
	    </style>
		
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script type="text/javascript">

		</script>
		
		<!-- admin css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin.css"/>
    
</head>
<body>
		
		<!-- 메인 헤더 -->
		<jsp:include page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>	

		<!-- 메인 시작 -->
	<div class="container-fluid admin_main_container hidden-xs">
		<div class="row admin_main_row">
			<!-- 어드민 슬라이드 메뉴 영역 -->
			<div class="col-md-2 amdin_main_slider">
	    		<ul class="nav main_slider_nav" id="admin_main_menu">
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/admin_userInfo.do">
	    			<span class="glyphicon glyphicon-user pull-left icon_color" aria-hidden="true"></span>회원 정보</a></li>
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/notice_upload.do">
	    			<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>공지 사항 업로드</a></li>
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/novel_upload.do">
	    			<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>신규 작품 업로드</a></li>
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/episode_upload.do">
	    			<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>에피소드 업로드</a></li>
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/article_manage.do"><span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>게시물 관리</a></li>
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/comment_manage.do"><span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>댓글 관리</a></li>
	    		</ul>
    		</div>
    	<!-- //어드민 슬라이드 메뉴 영역 -->
    		
	    	<!-- 어드민 컨텐트 영역 -->
			<div class="col-md-10 admin_content">
	    		
			
				<h1 class="page-header" id="upload_title">공지항 업로드</h1>
			
			
			<!-- 신규작품 Article Upload 폼 시작 -->
			<form class="form-horizontal new_upload" enctype="multipart/form-data" 
			action="${pageContext.request.contextPath}/admin/novel_upload_ok.do" id="novel_upload" method="post">
				<fieldset>
					<legend>공지 사항</legend>
				<div class="form-group">
					<label class="control-label col-xs-2" for="book_author">작가명 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="book_author" name="book_author" placeholder="작가명을 입력해 주세요">
					</div>
				</div>
							
				
				
				<!-- 작품 내용 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="book_name">작품 제목 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="book_name" name="book_name" placeholder="작품 제목을 입렵해 주세요 ">
					</div>
				</div>
				
				<!-- 작가 코멘트 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="intro">시놉시스</label>
					<div class="col-xs-10">
						<textarea class="ckeditor form-control" rows="3" id="intro" name="intro"></textarea>
					</div>
				</div>
				
			
			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">파일첨부(캐러셀)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="carousel" id="carousel" multiple/>
				</div>
			</div>
			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">파일첨부(메인)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="main" id="main" multiple/>
				</div>
			</div>
			
				<!-- 작가 코멘트 -->

				
				    <div class="form-group">
			      <div class="col-xs-offset-2 col-xs-10">
			        <button type="submit" class="btn btn-success">작품 등록</button>
			        <button type="button" class="btn btn-danger" onclick="history.back();">
					작성취소</button> 
			      </div>
			      </div>
			
				
			
				</fieldset>
			</form><!-- 신규 Article Upload 폼 시작 -->
					
	    	
	    	</div>
			<!-- //어드민 컨텐트 영역 -->
    		
		</div> <!-- end row -->


	</div>
			<!-- 메인 화면 끝 -->
	
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	
	<script src="${pageContext.request.contextPath}/assets/js/admin/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/admin/dataTables.bootstrap.min.js"></script>
	
</body>
</html>