<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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

    <!-- Multi-column -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/multi-column/ie-row-fix.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/plugins/multi-column/multi-columns-row.css"/>
	
	<!-- handlebars -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/handlebars/handlebars-v4.0.5.js"></script>
	
	<!-- ajax -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.js"></script>
	
	<!-- ajaxForm -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax-form/jquery.form.min.js"></script>


<!-- Article css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/naviStateColor/articleCommon.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/article/articleRead.css" />

<script type="text/javascript">

</script>
</head>
<body>
	<!-- 게시판 영역 -->
	<div class="container main_container">
		<div class="Article_size">
			<div class="left-block">
				<img src="${pageContext.request.contextPath}/assets/imgs/article/FreeArticle1.png" alt="자유게시판"
					class="img-rounded left-block">
			</div>
			
  <!-- 제목, 작성자, 작성일시, 조회수 -->
  <div class="alert alert-info">
    <h3 style="margin: 0">
      ${readArticle.subject}<br/>
      <small>
        작성자 : ${readArticle.user_nickname} / 조회수 : ${readArticle.hit} / 작성일시 : ${readArticle.reg_date}
      </small>
    </h3>
  </div>
    <!-- 내용 -->
  <section style="padding: 0 10px 20px 10px">
    ${readArticle.content}
  </section>
  <!-- 다음글/이전글 -->
  <table class="table table-bordered">
    <tbody>
      <tr>
        <th class="success" style="width: 100px">다음글</th>
        <td>
          <c:choose>
            <c:when test="${nextArticle != null}">
              <c:url var="nextUrl" value="/community/article_read.do">
                <c:param name="article_id" value="${nextArticle.id}"/>
              </c:url>
              <a href="${nextUrl}">${nextArticle.subject}</a>
            </c:when>
            <c:otherwise>
                     다음글이 없습니다.
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="success" style="width: 100px">이전글</th>
        <td>
          <c:choose>
            <c:when test="${prevArticle != null}">
              <c:url var="prevUrl" value="/community/article_read.do">
                <c:param name="article_id" value="${prevArticle.id}"/>
              </c:url>
              <a href="${prevUrl}">${prevArticle.subject}</a>
            </c:when>
            <c:otherwise>
                     이전글이 없습니다.
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
    </tbody>
  </table>
  <!-- 버튼들 : category값에 대한 상태유지 필요함 -->
  <div class="clearfix">


	<!-- 게시글 신고 버튼 -->
	<c:if test="${count==0}">
  	<div class="pull-left" >
  		<a href="${pageContext.request.contextPath}/community/article_report.do?member_id=${readArticle.member_id}&subject=${readArticle.subject}&article_id=${readArticle.id}&user_nickname=${readArticle.user_nickname}&nick_name=${nick_name}" class="btn btn-danger">게시글 신고</a>
  	</div>
  	</c:if>
  	<!-- 관리자삭제 버튼 -->
  	<c:if test="${member_level=='BB'}">
  	<div class="pull-left" >
  		<a href="${pageContext.request.contextPath}/community/article_delete.do?category=${category}&article_id=${readArticle.id}&member_level=${member_level}" class="btn btn-danger">관리자 삭제</a>
  	</div>
  	</c:if>
    <div class="pull-right">
      <a href="${pageContext.request.contextPath}/community/article_list.do?category=${category}" class="btn btn-info">목록보기</a>
      <a href="${pageContext.request.contextPath}/community/article_write.do?category=${category}" class="btn btn-primary">글쓰기</a>
      <!-- 수정, 삭제 대상을 지정하기 위해서 글 번호가 전달되어야 한다. -->
      <a href="${pageContext.request.contextPath}/community/article_edit.do?category=${category}&article_id=${readArticle.id}" class="btn btn-warning">수정하기</a>
      <a href="${pageContext.request.contextPath}/community/article_delete.do?category=${category}&article_id=${readArticle.id}" class="btn btn-danger">삭제하기</a>
    </div>
  </div>
  
  
				<br/>

		<!-- 게시글 신고 모달 -->
		<div class="modal fade" id="article_toadmin" tabindex="-1"
			role="dialog" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">게시글 신고</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> 이 게시글을
							신고하시겠습니까?
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



		<!--덧글 신고 모달 -->
		<div class="modal fade" id="reply_toadmin" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">덧글 신고</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> 이 덧글을
							신고하시겠습니까?
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



  <!-- 덧글 -->
  <form id="comment_form" method="post" action="${pageContext.request.contextPath}/comment/comment_insert.do">
    <!-- 글 번호 상태 유지 -->
    <input type="hidden" name="article_id" value="${readArticle.id}"/>
   
    <!-- 내용입력, 저장버튼 -->
    <div class="form-group">
      <div class="input-group">
        <textarea class="form-control custom-control" name="content" style="resize:none; height: 80px"></textarea>
        <span class="input-group-btn">
          <button type="submit" class="btn btn-warning" style="height: 80px">저장</button>
        </span>
      </div>
    </div>
  </form>
  
  <!-- 덧글 리스트 -->
  <ul class="media-list" id="comment_list">

  </ul>
  
  <!-- 덧글 삭제 modal -->
  <div id="comment_delete_modal" class="modal fade">
    <div class="modal-dialog modal-sm">
	  <div class="modal-content">

	  </div>
	</div>
  </div>
  
  <!-- 덧글 수정 modal -->
  <div id="comment_edit_modal" class="modal fade">
    <div class="modal-dialog">
	  <div class="modal-content">
	           
	  </div>
	</div>
  </div>
  
	</div>
	</div>


    


	<!-- footer -->
	
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
<script id="tmpl_comment_item" type="text/x-handlebars-template">
    <li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px' 
    	id="comment_{{id}}">
        <div class="media-body" style='display: block; width:100%;'>
            <h4 class="media-heading clearfix">
          <!-- 작성자, 작성일시 -->
          <div class="pull-left">
            {{user_nickname}}
            <small>
              / {{reg_date}}
            </small>
          </div>
          <!-- 수정,삭제,신고 버튼 -->
          <div class="pull-right">
            <a href="${pageContext.request.contextPath}/comment/comment_reported.do?comment_id={{id}}" data-toggle="modal" data-target="#comment_reported_modal" class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-scissors'></i></a>
            <a href="${pageContext.request.contextPath}/comment/comment_edit.do?comment_id={{id}}" data-toggle="modal" data-target="#comment_edit_modal" class='btn btn-warning btn-xs'><i class='glyphicon glyphicon-edit'></i></a>
            <a href="${pageContext.request.contextPath}/comment/comment_delete.do?comment_id={{id}}" data-toggle="modal" data-target="#comment_delete_modal" class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-remove'></i></a>
          </div>
        </h4>
        <!-- 내용 -->
        <p>{{{content}}}</p>
      </div>
    </li>
</script>
<script type="text/javascript">
$(function() {
	  /** 페이지가 열리면서 동작하도록 이벤트 정의 없이 Ajax요청 */
	  $.get("${pageContext.request.contextPath}/comment/comment_list.do", {
		  article_id: "${readArticle.id}"
	  }, function(json) {
		  if(json.rt != "OK"){
				alert(json.rt);
				return false;
		  }
		  
		// 템플릿 HTML을 로드한다.
			var template = Handlebars.compile($("#tmpl_comment_item").html());
			
			// JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
			// --> 정규표현식 /~~~/g는 문자열 전체의 의미.
			for (var i=0; i<json.item.length; i++) {
				json.item[i].content = json.item[i].content.replace(/&lt;br\/&gt;/g, "<br/>");
				
				// 덧글 아이템 항목 하나를 템플릿과 결합한다.
				var html = template(json.item[i]);
				// 결합된 결과를 덧글 목록에 추가한다.
				$("#comment_list").append(html);
			}
		});
		
		/** 덧글 작성 폼의 submit 이벤트 Ajax 구현 */
		// <form>요소의 method, action속성과 <input>태그를
		// Ajax요청으로 자동 구성한다.
		$("#comment_form").ajaxForm(function(json) {
			// json은 API에서 표시하는 전체 데이터
			if (json.rt != "OK") {
				alert(json.rt);
				return false;
			}
			alert("덧글 작성 완료.");
			// 줄 바꿈에 대한 처리
			// --> 정규표현식 /~~~/g는 문자열 전체의 의미.
			// --> JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
			json.item.content = json.item.content.replace(/&lt;br\/&gt;/g, "<br/>");
			
			// 템플릿 HTML을 로드한다.
			var template = Handlebars.compile($("#tmpl_comment_item").html());
			// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
			var html = template(json.item);
			// 결합된 결과를 덧글 목록에 추가한다.
			$("#comment_list").append(html);
			// 폼 태그의 입력값을 초기화 하기 위해서 reset이벤트를 강제로 호출
			$("#comment_form").trigger('reset');
		});
		
		/** 모든 모달창의 캐시 방지 처리 */
		$('.modal').on('hidden.bs.modal', function (e) {
			// 모달창 내의 내용을 강제로 지움.
  		    $(this).removeData('bs.modal');
		});
		
		/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
		$(document).on('submit', "#comment_delete_form", function(e) {
			e.preventDefault();

			// AjaxForm 플러그인의 강제 호출
			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}
				
				alert("삭제되었습니다.");
				// modal 강제로 닫기
				$("#comment_delete_modal").modal('hide');
				
				// JSON 결과에 포함된 덧글일련번호를 사용하여 삭제할 <li>의 id값을 찾는다.
				var comment_id = json.commentId;
				$("#comment_" + comment_id).remove();
			});
		});
		
		/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
		$(document).on('submit', "#comment_edit_form", function(e) {
			e.preventDefault();
			
			// AjaxForm 플러그인의 강제 호출
			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}
				
				// 줄 바꿈에 대한 처리
				// --> 정규표현식 /~~~/g는 문자열 전체의 의미.
				// --> JSON에 포함된 '&lt;br/&gt;'을 검색에서 <br/>로 변경함.
				json.item.content = json.item.content.replace(/&lt;br\/&gt;/g, "<br/>");
				
				// 템플릿 HTML을 로드한다.
				var template = Handlebars.compile($("#tmpl_comment_item").html());
				// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
				var html = template(json.item);
				// 결합된 결과를 기존의 덧글 항목과 교체한다.
				$("#comment_" + json.item.id).replaceWith(html);
				
				// 덧글 수정 모달 강제로 닫기
				$("#comment_edit_modal").modal('hide');
			});
		});
	});
</script>

</body>
</html>