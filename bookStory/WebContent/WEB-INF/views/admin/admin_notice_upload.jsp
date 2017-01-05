<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	<script src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script>
<style type="text/css">
.admin_main_container{
	
}
#wrapper {
	min-height:100%;
	position:relative;
}

.main_footer{
height:100px;
	position:absolute;
	bottom:0;
	left:0;
}


</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>

<!-- admin css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<!-- CKEditor -->


<script type="text/javascript">
$(window).ready(function(){ 
	function varHeight() {
		var wheight = document.getElementById("content_height").offsetHeight;
		var navheight = document.getElementById("slider_main").offsetHeight;
		if(navheight <= wheight){
			$("#slider_main").css({'height':wheight+'px'});
		}
	}

	varHeight();
	});

	$(function() {
	

		$(window).resize(function() {
			var wheight = document.getElementById("content_height").offsetHeight;
			var navheight = document.getElementById("slider_main").offsetHeight;
			if(navheight <= wheight){
				$("#slider_main").css({'height':wheight+'px'});
			}
		}).resize();
		
		$(window).scroll(function() {
			var wheight = document.getElementById("content_height").offsetHeight;
			var navheight = document.getElementById("slider_main").offsetHeight;
			if(navheight <= wheight){
				$("#slider_main").css({'height':wheight+'px'});
			}
		});
	})

</script>
</head>
<body>
	<div id="wrapper">
	<!-- 메인 헤더 -->
	<jsp:include
		page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>

	<!-- 메인 시작 -->
	<div class="container-fluid admin_main_container hidden-xs">
		<div class="row admin_main_row">
			<!-- 어드민 슬라이드 메뉴 영역 -->
			<div class="col-md-2 amdin_main_slider" id="slider_main">
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
			<div class="col-md-10 admin_content" id="content_height">


				<h1 class="page-header" id="upload_title">공지항 업로드</h1>


				<!-- 공지 게시글 폼 시작 -->
				<form class="form-horizontal new_upload"
					action="${pageContext.request.contextPath}/admin/article_notice_upload_ok.do"
					id="novel_upload" method="post">
					<!-- 게시판 카테고리에 대한 상태유지 -->
					<input type="hidden" name="category" value="${category}" />
					<!-- 작성자, 비밀번호 이메일은 로그인하지 않은 경우만 입력한다. -->

					<!-- 작성자, 비밀번호 이메일은 로그인하지 않은 경우만 입력한다. -->
					<fieldset>
						<legend>공지 사항</legend>
						<div class="form-group">
							<label class="control-label col-xs-2" for="book_author">제목
							</label>
							<div class="col-xs-10">
								<input type="text" class="form-control" id="book_author"
									name="admin_subject" placeholder="공지할 제목을 입력해 주세요">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-xs-2" for="intro">공지 내용</label>
							<div class="col-xs-10">
								<textarea class="form-control" rows="7" id="intro"
									name="admin_content" placeholder="공지할 내용을 입력해 주세요"></textarea>
							</div>
						</div>

						<div class="form-group">
							<div class="col-xs-offset-2 col-xs-10">
								<button type="submit" class="btn btn-success">등록</button>
								<button type="button" class="btn btn-danger"
									onclick="history.back();">취소</button>
							</div>
						</div>
					</fieldset>
				</form>
				<!-- 신규 Article Upload 폼 시작 -->


			</div>
			<!-- //어드민 컨텐트 영역 -->

		</div>
		<!-- end row -->


	</div>
	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</div><!-- end wrapper -->

	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/dataTables.bootstrap.min.js"></script>

</body>
</html>