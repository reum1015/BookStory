<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/admin/dataTables.bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/naviStateColor/adminCommon.css" />

<script type="text/javascript">
			$(document).ready(function() {
			    $('#example').DataTable();
			} );
		
		</script>
</head>
<body>
	<jsp:include
		page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>

	<!-- 메인 화면 시작 -->
	<div class="container-fluid admin_main_container hidden-xs">
		<div class="row admin_main_row">
			<!-- 어드민 슬라이드 메뉴 영역 -->
			<div class="col-md-2 amdin_main_slider">
				<ul class="nav main_slider_nav" id="admin_main_menu">
					<li class="search_list"><a
						href="${pageContext.request.contextPath}/admin/admin_userInfo.do">
							<span class="glyphicon glyphicon-user pull-left icon_color"
							aria-hidden="true"></span>회원 정보
					</a></li>

					<li class="search_list"><a
						href="${pageContext.request.contextPath}/admin/notice_upload.do">
							<span class="glyphicon glyphicon-upload pull-left icon_color"
							aria-hidden="true"></span>공지 사항 업로드
					</a></li>

					<li class="search_list"><a
						href="${pageContext.request.contextPath}/admin/novel_upload.do">
							<span class="glyphicon glyphicon-upload pull-left icon_color"
							aria-hidden="true"></span>신규 작품 업로드
					</a></li>

					<li class="search_list"><a
						href="${pageContext.request.contextPath}/admin/episode_upload.do">
							<span class="glyphicon glyphicon-upload pull-left icon_color"
							aria-hidden="true"></span>에피소드 업로드
					</a></li>

					<li class="search_list"><a
						href="${pageContext.request.contextPath}/admin/book_manage.do">
							<span class="glyphicon glyphicon-upload pull-left icon_color"
							aria-hidden="true"></span>작품 관리
					</a></li>

					<li class="search_list"><a
						href="${pageContext.request.contextPath}/admin/article_manage.do">
							<span class="glyphicon glyphicon-sunglasses pull-left icon_color"
							aria-hidden="true"></span>게시물 관리
					</a></li>

					<li class="search_list"><a
						href="${pageContext.request.contextPath}/admin/comment_manage.do">
							<span class="glyphicon glyphicon-sunglasses pull-left icon_color"
							aria-hidden="true"></span>댓글 관리
					</a></li>
				</ul>
			</div>
			<!-- //어드민 슬라이드 메뉴 영역 -->

			<!-- 어드민 컨텐트 영역 -->
			<div class="col-md-10 admin_content">
				<h1>관리자 메인</h1>


			</div>
			<!-- //어드민 컨텐트 영역 -->

		</div>
		<!-- end row -->




	</div>
	<!-- 메인 화면 끝 -->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


	<!-- Javascript -->

	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/dataTables.bootstrap.min.js"></script>

</body>
</html>