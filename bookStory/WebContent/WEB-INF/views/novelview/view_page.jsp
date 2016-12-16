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
	
	
	<script type="text/javascript">
	
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
					<a href="#">
					<span class="icon_bookmark2">책갈피</span>					
				</a>
				
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
										<button type="button" class="btn btn-warning star_rate_in pull-left" id="star_rate_in">참여 완료</button>
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
			
	
	<div class="container comment_view">
				<div class="section_area_viewer">
			<h4>
				<img
					src="${pageContext.request.contextPath}/assets/imgs/article/coment.png"
					alt="코멘트" class="left-block"> <span class="coment_size">총<strong
					class="coment_color">1개</strong>의 코멘트가 있습니다.
				</span>
			</h4>
			<hr />
			<ul class="list-inline">
				<li class="coment_li">
					<div class="coment_div pull-left">
						<span class="nic1">닉네임&nbsp&nbsp&nbsp&nbsp<span
							class="nic2">2016.06.15</span></span>
						<p>코멘트 내용</p>
					</div>
					<button type="submit" class="btn btn-danger pull-right btn-sm">신고</button>
					<button type="submit" class="btn btn-default pull-right btn-sm">삭제</button>
				</li>
			</ul>
			<!-- 덧글 입력 -->
			<div class="write">
				<form class="form-group row">
					<textarea class="form-control col-xs-9 col-sm-9" rows="3"></textarea>
					<button type="submit"
						class="btn btn-primary col-xs-3 col-sm-3 pull-right">등록하기</button>
				</form>
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
			
		</div>
	


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

				<!-- ajaxForm -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/ajax-form/jquery.form.min.js"></script>
	
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

</body>
</html>