<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우저에게 알려준다. 
			- ANSI(euc-kr), UTF-8 -->
		<meta charset="utf-8"/>
		<!-- IE의 호환성 보기 모드 금지 -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<!-- 스마트 장치에서의 해상도 균일화 처리 -->
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,
		maximum-scale=1.0,user-scalable=no">
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/icon/book01.png"/>
		<link rel="apple-touch-icon-precomposed" 
			  href="${pageContext.request.contextPath}/assets/icon/apple-touch-icon-144-precomposed.png"/>
			  
		<!-- bootstrap -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css"/>
		
		<!-- 나눔고딕 웹 폰트 적용 -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/nanumfont.css"/>
		
		<!-- main css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/main.css"/>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/navbarfont.css"/>
		
		<!-- bootstrap-tabs-x  -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/tab-x/bootstrap-tabs-x.min.css"/>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
		

		
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
<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>
<!-- Article css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/article/articleList.css" />

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/booklist/booklist.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/checkbox/awesome-bootstrap-checkbox.css" />
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
 
 <style type="text/css">
	    
</style>
	<script type="text/javascript">
	$(function(){
		
			/** 모든 모달창의 캐시 방지 처리 */
			$('.modal').on('hidden.bs.modal', function (e) {
				// 모달창 내의 내용을 강제로 지움.
	    		$(this).removeData('bs.modal');
			});
		

			var favorite_count = $("#favorite_count").val();
			var member_id = $("#member_id").val();
			var total_favorite = $("#total_favorite").val();
			var book_id = $("#book_id").val();
			var isFavoriteState = $("#isFavoriteState").val();
		
			//관심등록 On 이면 마크 표시
			if(favorite_count > 0){
				$("#favorite_img").addClass("favorite_On");
			}else{
				$("#favorite_img").removeClass("favorite_On").addClass("favorite_Off");
			}
			
			//관심등록 버튼
			$("#favorite_button").on('click',function(e){
				e.preventDefault();
				if(member_id == 0){
					var result = confirm("로그인이 필요한 서비스 입니다. 로그인 창으로 이동하시겠습니까?");
					
					if(result){
						location.replace('/bookStory/login/login.do?book_id=' + book_id );
						return false;
					}else{
						return false;
					}
				}
				
				$.get("${pageContext.request.contextPath}/book/addFavorite.do", 
						{favorite_count : favorite_count, member_id : member_id, total_favorite : total_favorite, book_id : book_id},
						function(data){
								var isFavoriteState = data.isFavoriteState;
								 total_favorite=data.total_favorite;
								 favorite_count = data.favorite_count;
							
								$("#favorite_count").attr("value",favorite_count);
								$("#concernCount").text(total_favorite);
								
								
								if(isFavoriteState){
									alert("관심작품으로 설정되었습니다. 나의 메뉴에서 나의 관심 작품을 확인 할 수 있습니다.");
									$("#favorite_img").addClass("favorite_On");
								}else{
									alert("관심 작품에서 삭제되었습니다.");
									$("#favorite_img").removeClass("favorite_On").addClass("favorite_Off");
								}
							});
			});
			
			
			
			//책 전체 구입
			// 비로그인 중이라면 이페이지를 동작시켜서는 안된다.
			$("#allBuyBook, #allRentBook").on('click',function(e){
				e.preventDefault();
				if(member_id == 0){
					var result = confirm("로그인이 필요한 서비스 입니다. 로그인 창으로 이동하시겠습니까?");
					
					if(result){
						location.replace('/bookStory/login/login.do?book_id=' + book_id );
						return false;
					}else{
						return false;
					}
				}
			
			});
			
			
			//구매목록 리스트
			//구매목록에 구매 완료 표시
			var buyList= eval(${json});
			var buyListLength = buyList.length;
			
			
			for(var i = 0; i <buyListLength ; i++){
				var epid = buyList[i].episode_id;
				$("#episode_" + epid).empty();
				$("#episode_" + epid).append('<div class="buystate pull-right"><i class="fa fa-cc-paypal fa-4x" aria-hidden="true" style="color:#f0ad4e"></i><div class="pay_done">구매 완료</div></div>')
			};

			
			
			// 작품 체크 박스 모두 체크/해제
			var checkedValues = [];	//체크 했을때 에피소드 id값 담을 변수
			var isChecked;			//체크 상태
			
			$("#checkAll").on("click",function(){
				isChecked = $("input:checkbox[name='checkboxitem']").is(":checked");
				
				if(isChecked){
					$("input:checkbox[name='checkboxitem']").prop("checked", false);
					$("input:checkbox[name='checkboxitem']").attr("checked", false);
					checkedValues = [];
					
				}else{
					$("input:checkbox[name='checkboxitem']").prop("checked", true);
					$("input:checkbox[name='checkboxitem']").attr("checked", true);
					$("input[name=checkboxitem]:checked").each(function() {
						checkedValues = $("input:checkbox[name='checkboxitem']").val();
					});
				}
								
			});
			
			$("#buyEpisodeButton").on("click",function(e){
				
				if(member_id == 0){
					var result = confirm("로그인이 필요한 서비스 입니다. 로그인 창으로 이동하시겠습니까?");
					
					if(result){
						location.replace('/bookStory/login/login.do?book_id=' + book_id );
						return false;
					}else{
						return false;
					}
				}
				
				alert(checkedValues);
				
				e.preventDefault();
				var aa= new Array();
								
				$.get("${pageContext.request.contextPath}/book/buyEpisode.do", {
					book_id:book_id,checkedValues:checkedValues},function(json) {
					  if(json.rt != "OK"){
							alert(json.rt);
							return false;
					  }
				
				
				});
			});
	
	});
	
	

	
	
	</script>
</head>

<body>
	<!-- 컨테인 영역 -->
	<div class="container">
		<div class="content row book_headerBox">
			<div class="col-xs-6 col-sm-6">
				<h3>${bookitem.book_name}</h3>
				<p>
					글&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">${bookitem.book_author}</a>
				</p>
			</div>
			<div class="col-xs-6 col-sm-6 content6">
				<a href="#" id="favorite_button" > <span class="favorite_Off pull-right" id="favorite_img"> </span>
				</a>
				<input type="hidden" value="${favoriteCount}" id="favorite_count">
				<input type="hidden" value="${member_id}" id="member_id">
				<input type="hidden" value="${bookitem.total_favorite}" id="total_favorite">
				<input type="hidden" value="${bookitem.id}" id="book_id">
				<input type="hidden" value="${isFavoriteState}" id="isFavoriteState">
			</div>
		</div>
		
		<!--  작품 정보 -->
		<div class="row book_infoBox">
			<div class="col-xs-12 col-sm-12">
			<c:url var="downloadUrl" value="/download.do">
				 <c:param name="file" value="${bookitem.imagePath}" />
			</c:url>
				<img class="col-xs-5 col-sm-5 img-response"
					src="${downloadUrl}"
					alt="그림" style="width: 320px; height: 220px;">
				<div class="col-xs-7 col-sm-7 pull-left">
					<span class="grade_area"> <span class="stargrade"></span> <em>${bookitem.total_star}</em>
					</span>
					<p class="info_book">
						<span><span class="">관심등록 <span id="concernCount">${bookitem.total_favorite}</span> 명</span>
						
						</span> <span class="publish">${bookitem.daily_date} 연재 </span> <span class="genre">${bookitem.genre} </span>
					</p>
					<p class="">${bookitem.intro}</p>
					
					
					<div class="bookInfo_button">
					
						
						
						<!-- 첫회 보기 -->
						<c:url var="episodeFirstUrl" value="/novelview/view_page.do">
							<c:param name="episode_id" value="${firstEpisode}" />
					 		<c:param name="book_id" value="${bookitem.id}" />
						</c:url>
						<a href="${episodeFirstUrl}"class="btn btn-warning">첫화 보기 </a>
						
						
						<!-- 책 전체 구입
						<c:url var="allbuybook" value="/book/totalBuyBook.do">
					 		<c:param name="book_id" value="${bookitem.id}" />
						</c:url>
						<a href="${allbuybook}" 
							class="btn btn-default pull-right" data-target="#book_all_buy" data-toggle="modal" id="allBuyBook">전체 구입</a>
						
						<!-- 책 전체 대여
						<c:url var="allrentbook" value="/book/totalRentBook.do">
					 		<c:param name="book_id" value="${bookitem.id}" />
					 		<c:param name="totalEpisodeCount" value="${totalCount}" />
					 		<c:param name="buyEpisodeCount" value="${fn:length(buyList)}" />
						</c:url>
						<a href="${allrentbook}" 
						class="btn btn-default pull-right" data-target="#book_all_rent" data-toggle="modal" id="allRentBook">전체 대여</a>
						
						 -->
					</div>
				</div>
				
		
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12 col-sm-12 episodeList_header">
				<div class="col-xs-6 col-sm-6 pull-left">
					<h3>
						작품회차<span class="total">(${totalCount})</span>
					</h3>
				</div>
				
				<div class="col-xs-6 col-sm-6">
					<div class="btn-group btn-group-md pull-right pull-right" style="margin-top: 13px;">
						
						<a data-target="#book_rent" data-toggle="modal" class="btn btn-default">대여</a>
						
						<c:url var="buyEpisode" value="/book/buyEpisode.do">
					 		<c:param name="book_id" value="${bookitem.id}" />
						</c:url>
						<a data-toggle="modal" class="btn btn-default" href="${buyEpisode}" id="buyEpisodeButton">구매</a>
						<button class="btn btn-default" id="checkAll">전체선택</button>
					</div>
				</div>
			</div>
		</div>
			<!--  작품 정보  끝-->
		
			
			
	<!-- 에피소드 리스트 시작 -->
		<div class="episode_list row">
		<c:choose>
			<c:when test="${fn:length(episodeList) > 0}">
			<c:forEach var="episode" items="${episodeList}" varStatus="status">
		
			<div class="col-xs-12 col-sm-12 block_12_2">
			
				<c:url var="downloadUrl" value="/download.do">
			 		<c:param name="file" value="${episode.imagePath}" />
				</c:url>
				
				<c:url var="episodeReadUrl" value="/novelview/view_page.do">
					<c:param name="episode_id" value="${episode.id}" />
			 		<c:param name="book_id" value="${bookitem.id}" />
				</c:url>
				
				<a href="${episodeReadUrl}">
				<img class="col-xs-4"
					src="${downloadUrl}"
					alt="에피소드 리스트그림" style="width: 200px; height: 170px;"/>
				</a>
				<div class="col-xs-5">
					<div class="episode_size">
						${episode.episode_order}. ${episode.episode_name}
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>${episode.total_star}</em>
					</span>
					<p>${episode.reg_date}</p>
				</div>
					
					
					
					<c:choose>
						<c:when test="${loginInfo == null }">
						
						
						</c:when>
						<c:otherwise>
					
							<div class="col-xs-3 check_box_list pull-right" id="episode_${episode.id}">

											<div class="checkbox checkbox-success pull-right">
									            <input type="checkbox" name="checkboxitem" id="${episode.id}" class="input_check" value="${episode.id}"/>
									            <label for="${episode.id}" class="check_label">선택</label>
								        	</div>
								  
											<div></div>
							</div>
						</c:otherwise>
					</c:choose>





						<!-- <div class="col-xs-3 check_box_list pull-right">
								<div class="checkbox checkbox-warning">
			                        <input id="${episode.id}" type="checkbox">
			                        <label for="${episode.id}">
			  							작품 선택
			                        </label>
		                    	</div>
							
								<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
								</div>

						<c:set var="doneLoop" value="false"/>
					<c:set var="Loop" value="false"/>
						<c:forEach var="buyList" items="${buyList}">
							
						
							<c:if test="${not doneLoop}">
								<c:if test="${episode.id!=buyList.episode_id}">
									<div>********</div>
									<c:set var="doneLoop" value="true"/>
								</c:if>	
								<c:if test="${episode.id==buyList.episode_id}">
									<div>구매완료</div>
									<c:set var="doneLoop" value="true"/>
								</c:if>
							</c:if>
		
						<c:if test="${episode.id==buyList.episode_id}">
									<div>구매 완료</div>
								</c:if>
						
						
						</c:forEach>
						
						
						
						
						
						
						
						
						
						
						
						
							 -->
							




	
			</div>
		
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
		<!-- 에피소드 리스트 끝 -->	
		
			
			<!-- 페이지 번호 시작 -->
	<div>
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0}">
						<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
						<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
						<c:url var="prevUrl" value="/booklist/book_list.do">
							<c:param name="book_id" value="${bookitem.id}"></c:param>
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
					<c:url var="pageUrl" value="/booklist/book_list.do" >
						<c:param name="book_id" value="${bookitem.id}"></c:param>
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
						<c:url var="nextUrl" value="/booklist/book_list.do">
							<c:param name="book_id" value="${bookitem.id}"></c:param>
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
	<!-- 컨테이너 영역 끝 -->
	
	
	
		<!-- 전체 대여 모달 -->
			<div class="modal fade" id="book_all_rent">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- header -->
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
							<h4 class="modal-title">책 전체 대여</h4>
						</div>
						<!-- body -->
						<div class="modal-body">모든 에피소드를 대여 하시겠습니까?</div>
						<!-- Footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
			<!-- 전체 대여 모달 끝 -->

			<!-- 책 전체 구입 -->
			
			<br />
			<!-- 전체 구입 모달 -->
			<div class="modal fade" id="book_all_buy">
				<div class="modal-dialog">
					<div class="modal-content">
					
					</div>
				</div>
			</div>
			<!-- 전체 구입 모달 끝 -->
			
			<!-- 에피소드 대여 모달 -->
				<div class="modal fade" id="book_rent">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<!-- 닫기(x) 버튼 -->
								<button type="button" class="close" data-dismiss="modal">×</button>
								<!-- header title -->
								<h4 class="modal-title">에피소드 대여</h4>
							</div>
							<!-- body -->
							<div class="modal-body">N개의 에피소드를 대여 하시겠습니까?</div>
							<!-- Footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">확인</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 에피소드 대여 모달 끝-->

				<!--  에피소드 구입 -->
				
				<!-- 에피소드 구입 모달 -->
				<div class="modal fade" id="book_buy">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- header -->
							<div class="modal-header">
								<!-- 닫기(x) 버튼 -->
								<button type="button" class="close" data-dismiss="modal">×</button>
								<!-- header title -->
								<h4 class="modal-title">에피소드 구입</h4>
							</div>
							<!-- body -->
							<div class="modal-body">N개의 에피소드를 구입 하시겠습니까?</div>
							<!-- Footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">확인</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</div>
				</div>
				<!-- 에피소드 구입 모달 끝-->
	

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

	
	<!-- Javascript -->

	    
	    		
	    <script src="${pageContext.request.contextPath}/assets/js/tab-x/bootstrap-tabs-x.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

</body>
</html>