<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>

<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<!-- admin css -->

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/admin/admin.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/admin/dataTables.bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/naviStateColor/adminCommon.css" />


<script type="text/javascript">
	$(document).ready(function() {
		$("#mytable #checkall").click(function() {
			if ($("#mytable #checkall").is(':checked')) {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});
		$("[data-toggle=tooltip]").tooltip();

		$('#example').DataTable();

		$('.article_content').mouseenter(function() {
			$(this).attr('class', 'article_title_view');

		});
		$('.article_content').mouseleave(function() {
			$(this).attr('class', 'article_content');

		});

	});
	
	$(function() {
		function varHeight() {
			var wheight = document.getElementById("content_height").offsetHeight;
			var navheight = document.getElementById("slider_main").offsetHeight;
			if(navheight <= wheight){
				$("#slider_main").css({'height':wheight+'px'});
			}
		}

		varHeight();

		$(window).resize(function() {
			var wheight = document.getElementById("content_height").offsetHeight;
			var navheight = document.getElementById("slider_main").offsetHeight;
			if(navheight <= wheight){
				$("#slider_main").css({'height':wheight+'px'});
			}
		});
		
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

	<!-- 메인 헤더 -->
	<jsp:include
		page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>

	<!-- 메인 화면 시작 -->
	<div class="container-fluid admin_main_container hidden-xs">
		<div class="row admin_main_row">
			<!-- 어드민 슬라이드 메뉴 영역 -->
			<div class="col-md-2 amdin_main_slider" id="slider_main">
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
			<div class="col-md-10 admin_content" id="content_height">
				<h1 class="page-header">게시글 관리</h1>
				<c:choose>
					<c:when test="${fn:length(reportList) > 0}">
						<c:forEach var="report" items="${reportList}">
							<ul class="list-group">
								<li class="list-group-item">
									<div class="row">
										<div class="col-xs-2 admin_article_name">신고자 :
											${report.nick_name}</div>
										<div class="col-xs-3 admin_article_id">게시자 :
											${report.user_nickname}</div>
										<c:choose>
											<c:when test="${report.report_content == 'option1'}">
												<div class="col-xs-5 admin_article_reason">음란성 또는
													청소년에게 부적합한 내용</div>
											</c:when>
											<c:when test="${report.report_content == 'option2'}">
												<div class="col-xs-5 admin_article_reason">폭언 또는 욕설 내용
												</div>
											</c:when>
											<c:otherwise>
												<div class="col-xs-5 admin_article_reason">게시물 광고 내용</div>
											</c:otherwise>
										</c:choose>
										<div class="col-xs-2 admin_article_date">${report.reg_date}</div>
									</div>
									<div class="row">
										<div class="admin_article_title">
											<c:url var="readUrl" value="/community/article_read.do">
												<c:param name="article_id" value="${report.article_id}" />
											</c:url>
											<a href="${readUrl}">${report.report_subject}</a>
										</div>
									</div>
								</li>
							</ul>
						</c:forEach>
					</c:when>
				</c:choose>
				<!-- 페이지 번호 시작 -->
				<nav class="text-center">
					<ul class="pagination">
						<!-- 이전 그룹으로 이동 -->
						<c:choose>
							<c:when test="${pageHelper.prevPage > 0}">
								<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
								<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
								<c:url var="prevUrl" value="/admin/article_manage.do">

									<c:param name="page" value="${pageHelper.prevPage}"></c:param>
								</c:url>

								<li><a href="${prevUrl}">&laquo;</a></li>
							</c:when>

							<c:otherwise>
								<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
								<li class="disabled"><a href="#">&laquo;</a></li>
							</c:otherwise>
						</c:choose>

						<!-- 페이지 번호 -->
						<!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
						<c:forEach var="i" begin="${pageHelper.startPage}"
							end="${pageHelper.endPage}" step="1">
							<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
							<c:url var="pageUrl" value="/admin/article_manage.do">
								<c:param name="page" value="${i}"></c:param>
							</c:url>

							<!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
							<c:choose>
								<c:when test="${pageHelper.page == i}">
									<li class="active"><a href="#">${i}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="${pageUrl}">${i}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<!-- 다음 그룹으로 이동 -->
						<c:choose>
							<c:when test="${pageHelper.nextPage > 0}">
								<!-- 다음 그룹에 대한 페이지 번호가 존재한다면? -->
								<!-- 다음 그룹으로 이동하기 위한 URL을 생성해서 "nextUrl"에 저장 -->
								<c:url var="nextUrl" value="/admin/article_manage.do">

									<c:param name="page" value="${pageHelper.nextPage}"></c:param>
								</c:url>

								<li><a href="${nextUrl}">&raquo;</a></li>
							</c:when>

							<c:otherwise>
								<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
								<li class="disabled"><a href="#">&raquo;</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
				<!-- // 페이지 번호 끝 -->
			</div>
			<!-- //어드민 컨텐트 영역 -->
		</div>
		<!--end admin_userInfo_container -->

	</div>



	<!-- 메인 화면 끝 -->

	<!-- 모달 시작 -->
	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Edit Your
						Detail</h4>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<input class="form-control " type="text" placeholder="Mohsin">
					</div>
					<div class="form-group">

						<input class="form-control " type="text" placeholder="Irshad">
					</div>
					<div class="form-group">
						<textarea rows="2" class="form-control"
							placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


					</div>
				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-warning btn-lg"
						style="width: 100%;">
						<span class="glyphicon glyphicon-ok-sign"></span> Update
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>



	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">댓글 블라인드</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> 이글을 정말 블라인드
						하시겠습니까?
					</div>

				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>



	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/dataTables.bootstrap.min.js"></script>


</body>
</html>