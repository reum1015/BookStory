<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>

<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>
<!-- Article css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/article/articleList.css" />

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/booklist/booklist.css" />
	
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
				<a href="#"> <span class="favorite_module pull-right"> </span>
				</a>
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
						<span><span class="">관심등록 ${bookitem.total_favorite} 명</span>
						
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
						<!-- 책 전체 대여 -->
						<button class="btn btn-default pull-right"
							data-target="#book_all_rent" data-toggle="modal">전체 대여</button>
							<button class="btn btn-default pull-right"
				data-target="#book_all_buy" data-toggle="modal">전체 구입</button>
					</div>
				</div>
				
		
			</div>
		</div>
		
		<div class="row">
		<div class="col-xs-12 col-sm-12 episodeList_header">
			<div class="col-xs-6 col-sm-6 pull-left">
				<h3>
					작품회차<span class="total"></span>
				</h3>
			</div>
			<div class="col-xs-6 col-sm-6 btn_h3">
				<!-- 에피소드 대여 -->
				<button data-target="#book_rent" data-toggle="modal"
					class="btn btn-default pull-right">대여</button>
	

			<button class="btn btn-default pull-right">전체선택/해제</button>
			<button data-target="#book_buy" data-toggle="modal"
					class="btn btn-default pull-right">구입</button>
		</div>
		</div>
		</div>
			<!--  작품 정보  끝-->
		
			
			
	<!-- 에피소드 리스트 시작 -->
		<div class="episode_list row">
		<c:choose>
			<c:when test="${fn:length(episodeList) > 0}">
			<c:forEach var="episode" items="${episodeList}">
			
			
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
						${episode.episode_order} . ${episode.episode_name}
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>${episode.total_star}</em>
					</span>
					<p>${episode.reg_date}</p>
				</div>
				<div class="col-xs-3 check_box_list pull-right">
					
						
						 <div class="checkbox checkbox-warning">
                        <input id="${episode.id}" type="checkbox">
                        <label for="${episode.id}">
  							작품 선택
                        </label>
                    </div>
					
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
		
			</c:forEach>
			</c:when>
			</c:choose>
		</div>
		<!-- 에피소드 리스트 시작 -->	
			
			
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
							<button type="button" class="btn btn-default"
								data-dismiss="modal">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
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
						<!-- header -->
						<div class="modal-header">
							<!-- 닫기(x) 버튼 -->
							<button type="button" class="close" data-dismiss="modal">×</button>
							<!-- header title -->
							<h4 class="modal-title">책 전체 구입</h4>
						</div>
						<!-- body -->
						<div class="modal-body">모든 에피소드를 구입 하시겠습니까?</div>
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
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>