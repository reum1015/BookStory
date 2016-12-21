<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>	
	<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	   
	  	<!-- Javascript -->
	  	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/tab-x/bootstrap-tabs-x.min.js"></script>
	    
	   
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>   		
	<!-- StarRating -->    		
	<link href="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.css" media="all" rel="stylesheet" type="text/css" />    		
	    		
	<!-- optionally if you need to use a theme, then include the theme CSS file as mentioned below -->
	<link href="${pageContext.request.contextPath}/assets/css/star-rating/theme.css" media="all" rel="stylesheet" type="text/css" />
	
	
	<link href="${pageContext.request.contextPath}/assets/css/selectbox/css/bootstrap-select.css" media="all" rel="stylesheet" type="text/css" />
	
	<!-- important mandatory libraries -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.js" type="text/javascript"></script>
	
	<!-- optionally if you need to use a theme, then include the theme JS file as mentioned below -->
	<script src="${pageContext.request.contextPath}/assets/css/star-rating/theme.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	
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
	
	
	<script type="text/javascript">
	$(function(){		
		var bookmark_count = $("#bookmark_count").val();
		var member_id = $("#member_id").val();
		var total_bookmark = $("#total_bookmark").val();		
		var episode_id = $("#episode_id").val();
		var isBookMarkState = $("#isBookMarkState").val();
		var book_id = $("#book_id").val();
		
	
		
		
		
		//관심등록 On 이면 마크 표시
		if(bookmark_count > 0){
			$("#bookmark_img").removeClass("bookmark_Off").addClass("bookmark_On");
		}else{
			$("#bookmark_img").removeClass("bookmark_On").addClass("bookmark_Off");
		}
		
		$("#bookmark_button").on('click',function(e){
			e.preventDefault();
			if(member_id == 0){
				var result = confirm("로그인이 필요한 서비스 입니다. 로그인 창으로 이동하시겠습니까?");
				
				if(result){
					location.replace('/bookStory/login/login.do?episode_id=' + episode_id );
					return false;
				}else{
					return false;
				}
			}
			

			
			$.get("${pageContext.request.contextPath}/book/addBookMark.do", 
					{bookmark_count : bookmark_count, member_id : member_id, total_bookmark : total_bookmark, episode_id: episode_id, book_id:book_id},
					function(data){
							var isBookMarkState = data.isBookMarkState;
							 total_bookmark=data.total_bookmark;
							 bookmark_count = data.bookmark_count;
						
							$("#bookmark_count").attr("value", bookmark_count);
							$("#concernCount").text(total_bookmark);
							
							
							if(isBookMarkState){
								alert("이 페이지는 책갈피로 설정되었습니다. 나의 메뉴에서 책갈피 페이지에서 확인 할 수 있습니다.");
								$("#bookmark_img").removeClass("bookmark_Off").addClass("bookmark_On");
							}else{
								alert("관심 작품에서 삭제되었습니다.");
								$("#bookmark_img").removeClass("bookmark_On").addClass("bookmark_Off");
							}
						});
		});
});


	
	</script>
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/novelview/novel_view.css"/>

<!-- 메뉴바 고정 CSS -->
<style type="text/css">

.barFixed{
	position: fixed;
	top: 0;
	width: 1026px !important;

}

.titlebar2Width{
	width: 45% !important;
}

</style>
</head>
<body>

   <!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>	
   
	<!-- 메인 화면 시작 -->
	
		<div class="container">
			<div class="container_view">
				<div class="section_area_viewer">

				<!-- title bar -->
				<div class="row view_header" id="titlebar_header">
				
                <div id="" class="col-sm-3 novel_title">
					<h4><a href="#">${book.book_name}</a></h4>
				</div>
				
				
				<div id="" class="col-sm-6 episode_list">
			
				<button type="button" class="prevpage btn-default">&lt;</button>
				
				<select name="epList_selectBox">
				<c:forEach var="title" items="${episodeTitleList}"  varStatus="status">
					<option value="${title.id}"><a href="#">${title.episode_order}화. ${title.episode_name}
					</a>
					</option>
				</c:forEach>
				</select>
				<button type="button" class="nextpage btn-default">&gt;</button>
				</div>
				
				
				
				
				
				
				<div id="" class="col-sm-1 episode_bookmark">
					<a href="#" id="bookmark_button">
					<span class="bookmark_Off pull-right" id="bookmark_img"> </span>					
				</a>
				<input type="hidden" value="${bookmarkCount}" id="bookmark_count">
				<input type="hidden" value="${member_id}" id="member_id">				
                <input type="hidden" value="${book_id}" id="book_id">
				<input type="hidden" value="${episode.id}" id="episode_id">
				<input type="hidden" value="${bookmarkCount}" id="total_bookmark">
				<input type="hidden" value="${isBookMarkState}" id="isBookMarkState">
				</div>
				<div id="" class="col-sm-2 view_set">
					<a>보기설정</a>
				</div>
				
				</div>
				<!-- //title bar -->
				
				<!-- view content -->
				<div class="viewer_container">
				
				<div class="page-header novel_title_header">
			    <h1>${episode.episode_order}.${episode.episode_name}</h1>      
			    <span class="date">2016.10.18</span>
			  	</div>
			  	
			  	<!-- 
				<div class="detail_view_header">
				<h2>18.어렵네 제목
				</h2>
				<span class="date">2016.10.18</span>
				</div>
				 -->
				
				<div class="detail_view_content">
					<p>${episode.content}</p>					
				</div>				
				</div>
				<!-- // view content -->
				
				
			<div class="row star_row">
		
		
			<div class="col-sm-6 score_block">
				<div class="num_info">
					<span title="별점" class="icon_stargrade" id="stargradeIcon">별점</span>
					<p class="CurrentStarScore" id="currentStarScore">${episode.total_star}</p>
					<p class="num" id="currentStarScoreCount">${episode.total_starcount} 명</p>
				</div>
			</div>
			
			<div class="grade_insert col-sm-6">
					<div class="button_group">
							<c:choose>
									
									
									<c:when test="${isStarAdd==true}">
										<button type="button" class="btn btn-warning star_rate_in" id="star_rate_in">참여 완료</button>
									</c:when>
									<c:when test="${isStarAdd==false}">										
										<button type="button" class="btn btn-default"  id="star_rate_button" data-toggle="modal" data-target="#addStarModal">별점주기</button>
									</c:when>
							</c:choose>
					</div>
				</div>
			</div>
				
				
								
				<!-- view footer -->
			<div class="viewer_footer">
			
			<!-- 별점주기 -->
			
		
			
			<!-- //별점주기 -->	
				
				<!-- 작가의말 -->
			<div class="author_comment">
				<h4 class="author_comment_title">작가의 말</h4>
				 <p>
				 	${episode.author_comment}
				 </p>
				</div>
				<!-- // 작가의말 -->
			</div>
				<!-- // view footer -->
	
	<!-- 
	
		<a href="#" id="previousVolumeBtn" class="lk_story_prev N=a:flt.prev _volumeMove(113897,321)" 
	style="top: 200px; position: absolute; left: -1px;">
			<span class="icon_story_prev"></span>
			<div class="ly_move">
			
		<span class="htxt_story_prev">이전회로 가기</span>
			
			
				<span class="ellipsis">제321화. 흙바닥에 줄을 그어도</span>
			</div>
		</a>
		
	<button type="button" class="nextpage_fix col-lg-1 btn-default">&gt;</button>
	
				 -->
				 
		</div>				
			</div>	
			<!-- 댓글 부분  -->	 
			
	
  <form style="margin: auto; width: 90%;" id="comment_form" method="post" action="${pageContext.request.contextPath}/episodecomment/episode_comment_insert.do">
    <!-- 글 번호 상태 유지 -->
    <input type="hidden" name="episode_id" value="${episode.id}"/>
   
    <!-- 내용입력, 저장버튼 -->
    <div style="margin-top: 20px;" class="form-group">
      <div class="input-group">
        <textarea class="form-control custom-control" name="content" style="resize:none; height: 80px"></textarea>
        <span class="input-group-btn">
          <button type="submit" class="btn btn-warning" style="height: 80px">저장</button>
        </span>
      </div>
    </div>
  </form>
  
  <!-- 덧글 리스트 -->
  <ul style="margin: auto; width: 90%;" class="media-list" id="comment_list">

  </ul>
  
  <!-- 덧글 삭제 modal -->
  <div id="episode_comment_delete_modal" class="modal fade">
    <div class="modal-dialog modal-sm">
	  <div class="modal-content">

	  </div>
	</div>
  </div>
  
  <!-- 덧글 수정 modal -->
  <div id="episode_comment_edit_modal" class="modal fade">
    <div class="modal-dialog">
	  <div class="modal-content">
	           
	  </div>
	</div>
  </div>
  
	<div class="jb-center">
		<ul class="pagination">
			<li class="disabled"><a href="#"><span
					class="glyphicon glyphicon-chevron-left"></span></a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span></a></li>
		</ul>
	</div>
			
			</div>
			
			<!-- // 댓글 부분  끝 -->
			
	


	<!-- 메인 화면 끝 -->
	
	
	
<!-- Modal -->
  <div class="modal fade" id="addStarModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">별점 주기</h4>
        </div>
         <form action="${pageContext.request.contextPath}/book/AddStarOk.do" method="post" id="addStarForm">
        <div class="modal-body">
         	<input type="hidden" value="${member_id}" name="member_id">
         	<input type="hidden" value="${book_id}" name="book_id">
         	<input type="hidden" value="${episode.id}" name="episode_id">
		    <label for="input-id" class="control-label">이 작품에 별점을 주세요</label>
		    <input id="input-id" type="text" class="rating" data-size="xs" name="star_rate">
        </div>
        <div class="modal-footer">
         <button class="btn btn-warning btn-block" type="submit">별점주기</button>
        </div>
           </form>
      </div>
    </div>
  </div>


	<!-- footer -->
<footer class="page-footer text-center" id="main_footer">
		<div class="container footer_container">
			<p class="text-center">
			<h5>
				<a href="#">이용약관</a> / <a href="#">운영원칙</a> / <a href="#">개인정보
					취급방침</a> / <a href="#">책임의 한계와 법적고지</a>
			</h5>

			<address>
				<small>본 콘텐츠의 저작권은 제공처에 있으며, 이를 무단 이용하는경우 저작권법 등에 따라 법적 책임을
					질 수 있습니다.</small> <br> <img src="${pageContext.request.contextPath}/assets/imgs/main/homebutton.jpg" alt="저작권"  width="100" />   copyright&copy; All rights reserved.
			</address>
		</div>
	</footer>



	<script src="${pageContext.request.contextPath}/assets/css/selectbox/js/bootstrap-select.js" type="text/javascript"></script>
	
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
            <a href="${pageContext.request.contextPath}/episodecomment/episode_comment_reported.do?comment_id={{id}}" data-toggle="modal" data-target="#comment_reported_modal" class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-scissors'></i></a>
            <a href="${pageContext.request.contextPath}/episodecomment/episode_comment_edit.do?comment_id={{id}}" data-toggle="modal" data-target="#episode_comment_edit_modal" class='btn btn-warning btn-xs'><i class='glyphicon glyphicon-edit'></i></a>
            <a href="${pageContext.request.contextPath}/episodecomment/episode_comment_delete.do?comment_id={{id}}" data-toggle="modal" data-target="#episode_comment_delete_modal" class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-remove'></i></a>
          </div>
        </h4>
        <!-- 내용 -->
        <p>{{{content}}}</p>
      </div>
    </li>
</script>

	
	<script type="text/javascript">
	$(function() {
		$('.modal').on('hidden.bs.modal', function(e){
			//모달창 내의 내용을 강제로 지움.
			$(this).removeData('bs.modal');
		});
		
		// 별점
		// initialize with defaults
		$("#input-id").rating();
		// with plugin options (do not attach the CSS class "rating" to your input if using this approach)
		$("#input-id").rating({'size':'xs'});
		
		
		//메뉴바 고정 스크립트
		var barOffset = $("#titlebar_header").offset();
		$(window).scroll(function() {
			if($(document).scrollTop() > barOffset.top){
				$("#titlebar_header").addClass("barFixed");
			}else{
				$("#titlebar_header").removeClass("barFixed");
			}
		});
		
		//참여 완료 버튼 클릭시
		$("#star_rate_in").on('click',function(e){
			e.preventDefault();
			alert("이미 참여 완료 하였습니다.");
			return false;
		});
		
		//별점 등록 Ajax
		/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
		$(document).on("submit", "#addStarForm", function(e) {
			e.preventDefault();

			/* AjaxForm 플러그인의 강제 호출*/
			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}
				
				//별점 평균, 별점 등록 회원수 갱신
				var star_count = json.starCount;
				var starAvgEpisode = json.starAvgEpisode;
				
				$("#currentStarScore").text(starAvgEpisode);
				$("#currentStarScoreCount").text(star_count);
				
				if(json.rt == "OK"){
					//별점 등록 버튼 비활성화
					var starButton = $("#star_rate_button");
					starButton.attr('disabled',true);
					starButton.attr("class","btn btn-warning");
					starButton.text("참여완료");
			
				// 별점 모달 강제로 닫기
				$('.modal').modal('hide');
				}
				alert("별점이 등록 되었습니다. ");
			});
	
		});
		
		//모달 캐시 데이터 삭제
		//모든 모달이 완전히 닫힌 직후 호출됨
		
	})
	
	</script>
	
	<script type="text/javascript">
	// 코멘트 ajax
	$(function() {
	  /** 페이지가 열리면서 동작하도록 이벤트 정의 없이 Ajax요청 */
	  $.get("${pageContext.request.contextPath}/episodecomment/episode_comment_list.do", {
		  episode_id: "${episode.id}"
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
		$(document).on('submit', "#episode_comment_delete_form", function(e) {
			e.preventDefault();

			// AjaxForm 플러그인의 강제 호출
			$(this).ajaxSubmit(function(json) {
				if (json.rt != "OK") {
					alert(json.rt);
					return false;
				}
				
				alert("삭제되었습니다.");
				// modal 강제로 닫기
				$("#episode_comment_delete_modal").modal('hide');
				
				// JSON 결과에 포함된 덧글일련번호를 사용하여 삭제할 <li>의 id값을 찾는다.
				var comment_id = json.commentId;
				$("#comment_" + comment_id).remove();
			});
		});
		
		/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
		$(document).on('submit', "#episode_comment_edit_form", function(e) {
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
				$("#episode_comment_edit_modal").modal('hide');
			});
		});
	});
	</script>

</body>
</html>