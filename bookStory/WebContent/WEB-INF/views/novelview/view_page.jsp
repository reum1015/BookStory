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
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
	<script type="text/javascript">
	$(function(){		
		
		$('.modal').on('hidden.bs.modal', function(e){
			//모달창 내의 내용을 강제로 지움.
			$(this).removeData('bs.modal');
		});
		
		
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
			
			//북마크 On/Off
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
		
		// 코멘트 ajax
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
		
			//관리자에 의한 덧그 blind 처리
			$(".reportState_Y").text("관리자에의해 blind된 게시물 입니다.");
			
			//우클릭 금지
			$(document).ready(function(){
				 $(document).bind("contextmenu", function(e) {
				  return false;
				 });
			});
			
			
			//덧글 신고 모달창
			/** 동적으로 로드된 폼 안에서의 submit 이벤트 */
			$(document).on("submit", "#episode_comment_report_form", function(e) {
				e.preventDefault();
				console.log("시작");
				
				var comment_id = $(this).find("#comment_id").val();
				var member_id = $(this).find("#member_id").val();
				var comment_memberId = $(this).find("#comment_memberId").val();
				var comment_content = $(this).find("#comment_content").val();
				var user_nickname = $(this).find("#user_nickname").val();
				var report_reason =  $(this).find('input[name=report_reason]:checked').val();
				
				console.log(report_reason);
				
				$.post('${pageContext.request.contextPath}/episodecomment/episode_comment_report_ok.do',
						{comment_id:comment_id,member_id:member_id,comment_content:comment_content,					
						comment_memberId:comment_memberId,report_reason:report_reason,user_nickname:user_nickname},
						
						function(data){
							//  모달 강제로 닫기
							$('.modal').modal('hide');
							
							$('#confirmReport').modal('show');
							
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
	left: 0;
	right: 0;

}

.titlebar2Width{
	width: 45% !important;
	}
.txtcolor{
	color: red;
	font-style: italic;
	}
	
	.diplayBlock{
		display: none;
	}
}

</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>
   <!-- 메인 헤더 -->
<!-- 메인 헤더 -->


<!-- 네비게이션 바 (메뉴 영역)
<nav class="navbar navbar-default main_navi"  oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<div class="container">
		<div class="navbar-header clearfix">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="${pageContext.request.contextPath}/index.do"
				class="navbar-brand bookstoryhome">BookStory</a>
		</div>
		<div class="container">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">


					<li class="todayNovel"><a
						href="${pageContext.request.contextPath}/todaynovel/today_novel.do">TodayNovel</a></li>
					<li class="novelList"><a
						href="${pageContext.request.contextPath}/novellist/novel_list.do">NoveList</a></li>
					<li class="community"><a
						href="${pageContext.request.contextPath}/community/article_list.do">Community</a></li>
					<li class="mymenu"><a
						href="${pageContext.request.contextPath}/mymenu/recentepisode_list.do">MyMenu</a></li>
					
					
					
					
					
					
					<li class="main_admin"><a
						href="${pageContext.request.contextPath}/admin/admin_main.do"
						class="main_navi_admin active">administrator</a></li>
					
					
					
					
					
					<li><a href="${pageContext.request.contextPath}/login/sign_up_agree.do" class="visible-xs signup_icon"><span
							class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="${pageContext.request.contextPath}/login/login.do" class="visible-xs login_icon"><span
							class="glyphicon glyphicon-log-in"></span> Login</a></li>
							
							
							
							
							
							
					<li>
						<form
							class="navbar-form navbar-left pull-left search_form visible-xs"
							role="search"
							action="${pageContext.request.contextPath}/totalsearch/total_search.do">
							<fieldset>
								<div class="input-group form-group">

									<label class="sr-only" for="total_search">통합검색</label> <input
										type="text" class="form-control" placeholder="통합검색"
										id="total_search"> <span class="input-group-btn">
										<button type="submit" class="btn btn-default">검색</button>
									</span>
								</div>
							</fieldset>
						</form>
					</li>
				</ul>

				<form class="navbar-form navbar-left pull-right"
							action="${pageContext.request.contextPath}/book/BookSearch.do"
							method="post" id="search-form" style="padding-right: 0px;">
							<fieldset>

								<div class="col-xs-10 pull-right" style="padding-right: 0px;">
									<div class="input-group">
										<input type="text" class="form-control col-xs-10"
											placeholder="작품명 or 작가명" id="keyword" name="keyword" /> <span
											class="input-group-btn">
											<button class="btn btn-info" type="submit"
												style="background-color: #CD8F49; border-color: #CD8F49">
												<i class="glyphicon glyphicon-search"></i>
											</button>
										</span>
									</div>
								</div>
							</fieldset>
						</form>
				
				
			</div>
		</div>
	</div>
</nav>
    -->
	<!-- 메인 화면 시작 -->
	
		<div class="container" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
			<div class="container_view" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
				<div class="section_area_viewer" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

				<!-- title bar -->
				<div class="row view_header" id="titlebar_header" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
				
                <div id="" class="col-sm-3 novel_title" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
					
					<c:url var="readUrl" value="/booklist/book_list.do">
						<c:param name="book_id" value="${book_id}" />
	        		</c:url>
					<h4 class="epi_title"><a href="${readUrl}">${book.book_name}</a></h4>
				</div>
				
				
				<div id="" class="col-sm-6 episode_list" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
					<div class="">
						<div class="epi_title_top">
						<!-- 이전 에피소드 -->
						<c:choose>
							<c:when test="${preEpisode != null }">
								<c:url var="preEpisode" value="/novelview/view_page.do">
									<c:param name="episode_id" value="${preEpisode.id}" />
							 		<c:param name="book_id" value="${book_id}" />
							 		<c:param name="episodeOrder" value="${preEpisode.episode_order}" />
								</c:url>
							</c:when>
							<c:otherwise>
								<c:url var="preEpisode" value="/novelview/view_page.do">
									<c:param name="episode_id" value="${preEpisode.id}" />
							 		<c:param name="book_id" value="${book_id}" />
							 		<c:param name="episodeOrder" value="${preEpisode.episode_order}" />
							 		<c:param name="episodeLast" value="first" />
								</c:url>
							</c:otherwise>
						</c:choose>
						<a href="${preEpisode}"><i class="fa fa-hand-o-left fa-2x" aria-hidden="true" style="color:#000"></i></a>
						
						
						<span class="epi_title_fortop">${episode.episode_name }</span>
						<!-- 
						<select name="epList_selectBox" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
						<c:forEach var="title" items="${episodeTitleList}"  varStatus="status">
							<option value="${title.id}"><a href="#">${title.episode_order}화. ${title.episode_name}
							</a>
							</option>
						</c:forEach>
						</select>
						 -->
						
						<!-- 다음 에피소드 -->
						
						<c:choose>
							<c:when test="${nextEpisode != null }">
								<c:url var="nextEpisode" value="/novelview/view_page.do">
									<c:param name="episode_id" value="${nextEpisode.id}" />
							 		<c:param name="book_id" value="${book_id}" />
							 		<c:param name="episodeOrder" value="${nextEpisode.episode_order}" />
								</c:url>
							</c:when>
							<c:otherwise>
								<c:url var="nextEpisode" value="/novelview/view_page.do">
									<c:param name="episode_id" value="${nextEpisode.id}" />
							 		<c:param name="book_id" value="${book_id}" />
							 		<c:param name="episodeOrder" value="${nextEpisode.episode_order}" />
							 		<c:param name="episodeLast" value="last" />
								</c:url>
							</c:otherwise>
						</c:choose>
						<a href="${nextEpisode }"><i class="fa fa-hand-o-right fa-2x" aria-hidden="true" style="color:#000"></i></a>
						</div>
					</div>
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
				<div id="" class="col-sm-2 view_set" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
				</div>
				
				</div>
				<!-- //title bar -->
				
				<!-- view content -->
				<div class="viewer_container">
				
				<div class="page-header novel_title_header" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
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
				
				<div class="detail_view_content"  id="mouse_no" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
					<p>${episode.content}</p>					
				</div>				
				</div>
				<!-- // view content -->
				
				
			<div class="row star_row" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		
		
			<div class="col-sm-6 score_block" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
				<div class="num_info">
					<span title="별점" class="icon_stargrade" id="stargradeIcon">별점</span>
					<p class="CurrentStarScore" id="currentStarScore">${episode.total_star}</p>
					<p class="num" id="currentStarScoreCount">${episode.total_starcount} 명</p>
				</div>
			</div>
			
			<div class="grade_insert col-sm-6" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
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
			<div class="viewer_footer" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
			
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
        <textarea class="form-control custom-control" name="content" style="resize:none; height: 80px" id="reply_box"></textarea>
        <span class="input-group-btn">
          <button type="submit" class="btn btn-warning" style="height: 80px">저장</button>
        </span>
      </div>
    </div>
  </form>
  
  <!-- 덧글 리스트 -->
  <ul style="margin: auto; width: 90%;" class="media-list" id="comment_list">

  </ul>
  
  
  <!-- 확인용 Modal -->
  <div class="modal fade" id="confirmReport" role="dialog">
    <div class="modal-dialog modal-sm">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title"></h4>
        </div>
       
        <div class="modal-body">
         	댓글 신고 완료
        </div>
        <div class="modal-footer">
         <button class="btn btn-success btn-block" type="button" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>
  
  
  
  <!-- 덧글 신고 modal -->
  <div id="comment_reported_modal" class="modal fade">
    <div class="modal-dialog">
	  <div class="modal-content">

	  </div>
	</div>
  </div>
  
  
  
  
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
<footer class="page-footer text-center" id="main_footer" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
		<div class="container footer_container" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
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
    <li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px' id="comment_{{id}}">
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
          <div class="pull-right {{restate blind}}">
            <a href="${pageContext.request.contextPath}/episodecomment/episode_comment_reported.do?comment_id={{id}}" data-toggle="modal" data-target="#comment_reported_modal" class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-scissors'></i></a>
            <a href="${pageContext.request.contextPath}/episodecomment/episode_comment_edit.do?comment_id={{id}}" data-toggle="modal" data-target="#episode_comment_edit_modal" class='btn btn-warning btn-xs'><i class='glyphicon glyphicon-edit'></i></a>
            <a href="${pageContext.request.contextPath}/episodecomment/episode_comment_delete.do?comment_id={{id}}" data-toggle="modal" data-target="#episode_comment_delete_modal" class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-remove'></i></a>
          </div>
        </h4>
        <!-- 내용 -->
        <p class="{{converterComment blind}}" id="reportState_{{blind}}">{{{content}}}</p>
      </div>
    </li>
</script>

<script type="text/javascript">
	$(function(){
		Handlebars.registerHelper("converterComment",function(g){
			if(g=="Y"){
				return "txtcolor";
			}else{
				return "";
			}
		});
		
		Handlebars.registerHelper("restate",function(g){
			if(g=="Y"){
				return "diplayBlock";
			}else{
				return "";
			}
		});
		
	})
var temp = document.getElementById("reportState_Y");

console.log("temp" +  temp);



</script>
</body>
</html>