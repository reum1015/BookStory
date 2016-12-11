<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
<head>	
	<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	    		
	    		
	<!-- StarRating -->    		
	<link href="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.css" media="all" rel="stylesheet" type="text/css" />    		
	    		
	<!-- optionally if you need to use a theme, then include the theme CSS file as mentioned below -->
	<link href="${pageContext.request.contextPath}/assets/css/star-rating/theme.css" media="all" rel="stylesheet" type="text/css" />
	
	
	<link href="${pageContext.request.contextPath}/assets/css/selectbox/css/bootstrap-select.css" media="all" rel="stylesheet" type="text/css" />
	
	
	<script type="text/javascript">
	function open1() {
	    window.open('01-open.jsp');
	    }
	
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
								
				<!-- view footer -->
			<div class="viewer_footer">
			
			<!-- 별점주기 -->
			<div class="row star_row">
		
			<div class="star_grade col-lg-3 col-lg-offset-3 col-sm-3 col-sm-offset-3">
			<label for="str" title="별점" class="icon_stargrade"  id="stargradeIcon">별점</label>
			</div>
			
			<div class="col-lg-1 col-sm-1"><a id="currentStarScore" class="CurrentStarScore">${episode.total_star}</a></div>
			<div class="col-lg-3 col-sm-3"><a class="num" id="currentStarScoreCount">${episode.total_starcount}</a></div>
			
			<div class="grade_insert col-lg-3 col-sm-3">
			<a type="button" class="btn btn-default"  id="star_rate" data-toggle="modal" data-target="#myModal">별점주기</a></div>
			
		
			</div>
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
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">별점 주기</h4>
        </div>
         <form action="${pageContext.request.contextPath}/book/addStar.do" method="post">
        <div class="modal-body">
         
		    <label for="input-id" class="control-label">이 작품에 별점을 주세요</label>
		    <input id="input-id" type="text" class="rating" data-size="xs" name="star_rate">
        </div>
        <div class="modal-footer">
         <button class="btn btn-warning btn-block" type="submit" >별점주기</button>
        
        </div>
           </form>
      </div>
      
    </div>
  </div>


	<!-- footer -->
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>


	<script src="${pageContext.request.contextPath}/assets/css/selectbox/js/bootstrap-select.js" type="text/javascript"></script>

	<!-- important mandatory libraries -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
	<script src="${pageContext.request.contextPath}/assets/css/star-rating/star-rating.js" type="text/javascript"></script>
	
	<!-- optionally if you need to use a theme, then include the theme JS file as mentioned below -->
	<script src="${pageContext.request.contextPath}/assets/css/star-rating/theme.js"></script>
	
	<script type="text/javascript">
	$(function() {
		//모달 캐시 데이터 삭제
		//모든 모달이 완전히 닫힌 직후 호출됨
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

	
	})
	

	
	
	
	</script>
	
</body>
</html>