<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- ajaxForm -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/ajax-form/jquery.form.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});

	/** 모든 모달창의 캐시방지 처리 */
	$(function() {
		$('.modal').on("hidden.bs.modal", function(e) {
			$(this).removeData('bs.modal');
		});
		/** 모든 모달창의 캐시방지 처리 끝 */

		$(document).on('submit', "#member_delete_form", function(e) {
			e.preventDefault();

			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}

				alert("삭제되었습니다.");
				// modal 강제로 닫기
				$("#myModal").modal('hide');

				var member_id = json.memberId;
				$("#member_id" + member_id).remove();
			});

		});
	});
</script>
</head>
<body>

	<!-- 메인 헤더 -->
	<jsp:include
		page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>

	<div id="myModal" class="modal fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
				</div>
			</div>
		</div>
	</div>

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
			<div class="col-sm-10 admin_content admin_userInfo_container">
				<h1 class="page-header">회원 관리</h1>
				<table id="example"
					class="table table-hover table-bordered table-responsive user_info_table"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th style="width: 30px;">번호</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>생년월일</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>포인트</th>
							<th>강제 탈퇴</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>번호</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>생년월일</th>
							<th>이메일</th>
							<th>가입일</th>
							<th>포인트</th>
							<th>강제 탈퇴</th>
						</tr>
					</tfoot>
					<tbody>
						<c:choose>
							<c:when test="${fn:length(memberlist) > 0}">
								<c:forEach var="member" items="${memberlist}">
									<c:if test="${member.member_level == 'AA'}">
										<tr>
											<td>${member.id}</td>
											<td>${member.name}</td>
											<td>${member.nick_name}</td>
											<td>${member.birthdate}</td>
											<td>${member.email}</td>
											<td>${member.reg_date}</td>
											<td>${member.point}</td>
											<td><a
												href="${pageContext.request.contextPath}/admin/admin_member_delete.do?Id=${member.id}&nick_name=${member.nick_name}"
												class="btn btn-danger btn-xs" data-toggle="modal"
												data-target="#myModal">강제 탈퇴</a></td>
										</tr>
									</c:if>
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






		</div>

	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


	<script
		src="${pageContext.request.contextPath}/assets/js/admin/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/admin/dataTables.bootstrap.min.js"></script>

</body>
</html>