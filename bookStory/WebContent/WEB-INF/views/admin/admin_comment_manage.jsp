<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<script type="text/javascript">
	$(document).ready(function(){
		$("#mytable #checkall").click(function () {
		        if ($("#mytable #checkall").is(':checked')) {
		            $("#mytable input[type=checkbox]").each(function () {
		                $(this).prop("checked", true);
		            });
		        } else {
		            $("#mytable input[type=checkbox]").each(function () {
		                $(this).prop("checked", false);
		            });
		        }
		    });
		    
		    $("[data-toggle=tooltip]").tooltip();
		    
		    $('#example').DataTable();
		    
		 	$('.reply_content').mouseenter(function(){
	    		$(this).attr('class','reply_content_view');
	    
	   			 });
	   		 $('.reply_content').mouseleave(function(){
    			$(this).attr('class','reply_content');
	   		 });
		    
		});
	</script>
	
	<script type="text/javascript">
		$(function() {
			
			
			$('.modal').on('hidden.bs.modal', function(e){
				//모달창 내의 내용을 강제로 지움.
				$(this).removeData('bs.modal');
			});
			
			
			//댓글 리스트에서 삭제(report 테이블에서만 삭제, 원 게시물 유지)
			/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
			$(document).on('submit', "#commentDeleteList", function(e) {
				e.preventDefault();

				// AjaxForm 플러그인의 강제 호출
				$(this).ajaxSubmit(function(json) {
					if (json.rt != "OK") {
						alert(json.rt);
						return false;
					}
					
					$("#editConfirm").modal('show');
					
					// modal 강제로 닫기
					$("#edit").modal('hide');
					
					// JSON 결과에 포함된 덧글일련번호를 사용하여 삭제할 <li>의 id값을 찾는다.
					var comment_id = json.comment_id;
					$("#comment_" + comment_id).remove();
				});
			});
			
			//댓글 블라인드
			/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
			$(document).on('submit', "#commentBlind", function(e) {
				e.preventDefault();

				// AjaxForm 플러그인의 강제 호출
				$(this).ajaxSubmit(function(json) {
					if (json.rt != "OK") {
						alert(json.rt);
						return false;
					}
					
					$("#blindConfirm").modal('show');
					
					// modal 강제로 닫기
					$("#blind").modal('hide');
					
					// JSON 결과에 포함된 덧글일련번호를 사용하여 삭제할 <li>의 id값을 찾는다.
					var comment_id = json.comment_id;
					$("#comment_" + comment_id).find('#edit_block').css('display','none');
					$("#comment_" + comment_id).find('#blind_block').css('display','none');
					
					
					
				});
			});
			
			
			//댓글 삭제
			/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
			$(document).on('submit', "#commentDeleteByAdmin", function(e) {
				e.preventDefault();

				// AjaxForm 플러그인의 강제 호출
				$(this).ajaxSubmit(function(json) {
					if (json.rt != "OK") {
						alert(json.rt);
						return false;
					}
					
					$("#deleteConfirm").modal('show');
					
					// modal 강제로 닫기
					$("#delete").modal('hide');
					
					// JSON 결과에 포함된 덧글일련번호를 사용하여 삭제할 <li>의 id값을 찾는다.
					var comment_id = json.comment_id;
					$("#comment_" + comment_id).remove();
				});
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
				<div class="replymanage_container">
					<h1 class="page-header">댓글 관리</h1>
					
					
					<ul class="list-group">
					
				<c:choose>
		    		<c:when test="${fn:length(commentLists) > 0}">
		    			<c:forEach var="commentLists" items="${commentLists}">
		    	
						<li class="list-group-item" id="comment_${commentLists.comment_id}">
							<div class="row">
								<div class="col-xs-2 reply_name">${commentLists.nick_name }</div>
								<div class="col-xs-2 reply_id">${commentLists.user_nickname }</div>
								<c:choose>
											<c:when test="${commentLists.report_content == 'option1'}">
												<div class="col-xs-4 reply_reason">음란성 또는 청소년에게 부적합한 내용</div>
											</c:when>
											<c:when test="${commentLists.report_content == 'option2'}">
											<div class="col-xs-4 reply_reason">폭언 또는 욕설</div>
											</c:when>
											<c:otherwise>
											<div class="col-xs-4 reply_reason">게시물 광고</div>
											</c:otherwise>
										</c:choose>
								<div class="col-xs-2 reply_date">${fn:substring(commentLists.reg_date,0,11)}</div>
								<div class="col-xs-2 reply_button_group">
									<div class="reply_button_group pull-right">
									<c:choose>
										<c:when test="${commentLists.blind == '1'}">
										<p data-placement="top" data-toggle="tooltip" title="정상" class="cancel_button" id="edit_block">
											<a class="btn btn-success btn-xs" data-title="Delete" data-toggle="modal" data-target="#edit"
											href="${pageContext.request.contextPath}/admin/comment_deleteList.do?comment_id=${commentLists.comment_id}">
												<span class="glyphicon glyphicon-check"></span>
											</a>
										</p>
										<p data-placement="top" data-toggle="tooltip" title="블라인드"class="delete_button" id="blind_block">
											<a class="btn btn-danger btn-xs" data-title="Delete"data-toggle="modal" data-target="#blind"
											href="${pageContext.request.contextPath}/admin/comment_blind.do?comment_id=${commentLists.comment_id}">
												<span class="glyphicon glyphicon-minus"></span>
											</a>
										</p>
										<p data-placement="top" data-toggle="tooltip" title="삭제"class="delete_button">
											<a class="btn btn-danger btn-xs" data-title="Delete"data-toggle="modal" data-target="#delete"
											href="${pageContext.request.contextPath}/admin/comment_delete.do?comment_id=${commentLists.comment_id}">
												<span class="glyphicon glyphicon-remove"></span>
											</a>
										</p>
										</c:when>
										<c:when test="${commentLists.blind == 'Y'}">	
										<p data-placement="top" data-toggle="tooltip" title="삭제"class="delete_button">
											<a class="btn btn-danger btn-xs" data-title="Delete"data-toggle="modal" data-target="#delete"
											href="${pageContext.request.contextPath}/admin/comment_delete.do?comment_id=${commentLists.comment_id}">
												<span class="glyphicon glyphicon-remove"></span>
											</a>
										</p>
										</c:when>
								</c:choose>		
										
										
										
									</div>
								</div>
							</div>
							<div class="row">
								<div class="reply_content">${commentLists.comment_content}</div>
							</div>
						</li>
		   
		    			</c:forEach>
		    		</c:when>
		    		<c:otherwise>
		    			<tr>
				            <td colspan="5" class="text-center" style="line-height: 100px;">
				                조회된 글이 없습니다.</td>
				        </tr>
		    		</c:otherwise>
		    	</c:choose>

					</ul>
					
					
					
					<div>
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0}">
						<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
						<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
						<c:url var="prevUrl" value="/admin/comment_manage.do">
							<c:param name="page" value="${pageHelper.prevPage}"></c:param>
						</c:url>
		
						<li><a href="${prevUrl}">&laquo;</a></li>
					</c:when>
		
					<c:otherwise>
						<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
						<li class='disabled'><a href="#">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
					
				<!-- 페이지 번호 -->
				<!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
				<c:forEach var="i" begin="${pageHelper.startPage}" end="${pageHelper.endPage}" step="1">
		
					<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
					<c:url var="pageUrl" value="/admin/comment_manage.do" >
						<c:param name="page" value="${i}"></c:param>
					</c:url>
						
					<!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
					<c:choose>
						<c:when test="${pageHelper.page == i}">
							<li class='active'><a href="#">${i}</a></li>
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
						<c:url var="nextUrl" value="/admin/comment_manage.do">
							<c:param name="page" value="${pageHelper.nextPage}"></c:param>
						</c:url>
		
						<li><a href="${nextUrl}">&raquo;</a></li>
					</c:when>
		
					<c:otherwise>
						<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
						<li class='disabled'><a href="#">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		</div>
		<!--// 페이지 번호 끝 -->


				</div>
				<!--end admin_userInfo_container -->

			</div>
			<!-- admin content end -->

		</div>
		<!-- //end row -->

	</div>
	<!--end container main_container -->





	<!-- 메인 화면 끝 -->

	<!-- 모달 시작 리스트목록에서 삭제 -->
	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	<!-- 확인용 모달창 -->
		<div class="modal fade" id="editConfirm" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">댓글 리스트 삭제</h4>
					</div>
					<div class="modal-body">
	
						<div class="alert alert-danger">
							목록에서 삭제 되었습니다.
						</div>
	
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> 확인
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>




	<div class="modal fade" id="blind" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	<!-- 확인용 모달창 -->
		<div class="modal fade" id="blindConfirm" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">블라인드</h4>
					</div>
					<div class="modal-body">
	
						<div class="alert alert-danger">
							블라인드 처리가 완료 되었습니다.
						</div>
	
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> 확인
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	
	
	
	

	<!--  -->
		<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	<!-- 확인용 모달창 -->
		<div class="modal fade" id="deleteConfirm" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">댓글 삭제</h4>
					</div>
					<div class="modal-body">
	
						<div class="alert alert-danger">
							댓글 삭제 처리가 완료 되었습니다.
						</div>
	
					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> 확인
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
ㄴ
