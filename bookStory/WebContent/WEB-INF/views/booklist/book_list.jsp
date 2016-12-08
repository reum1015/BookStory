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
		<div class="content">
			<div class="col-xs-6 col-sm-6">
				<h3>${bookitem.book_name}</h3>
				<p>
					글&nbsp&nbsp&nbsp&nbsp<a href="#">${bookitem.book_author}</a>
				</p>
			</div>
			<div class="col-xs-6 col-sm-6 content6">
				<a href="#"> <span class="favorite_module pull-right"> </span>
				</a>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 block_12">
		<c:url var="downloadUrl" value="/download.do">
			 <c:param name="file" value="${bookitem.imagePath}" />
		</c:url>
			<img class="col-xs-5 col-sm-5 img-response"
				src="${downloadUrl}"
				alt="그림">
			<div class="col-xs-7 col-sm-7 pull-left">
				<span class="grade_area"> <span class="stargrade"></span> <em>${bookitem.total_star}</em>
				</span>
				<p class="info_book">
					<span><span class="">관심 ${bookitem.total_favorite} 명</span>
					
					</span> <span class="publish">${bookitem.daily_date} 연재 </span> <span class="genre">
						퓨전 </span>
				</p>
				<p class="">${bookitem.intro}</p>
			</div>
			<a href="${downloadUrl}"
				class="btn btn-warning">첫회 보기 </a>
			<!-- 책 전체 대여 -->
			<button class="btn btn-default pull-right"
				data-target="#book_all_rent" data-toggle="modal">전체 대여</button>
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
			<button class="btn btn-default pull-right"
				data-target="#book_all_buy" data-toggle="modal">전체 구입</button>
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

		</div>
		<div class="col-xs-12 col-sm-12 block_12">
			<div class="col-xs-6 col-sm-6 pull-left">
				<h3>
					작품회차<span class="total">(10)</span>
				</h3>
			</div>
			<div class="col-xs-6 col-sm-6 btn_h3">
				<!-- 에피소드 대여 -->
				<button data-target="#book_rent" data-toggle="modal"
					class="btn btn-default pull-right">대여</button>
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
				<button data-target="#book_buy" data-toggle="modal"
					class="btn btn-default pull-right">구입</button>
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

				<button class="btn btn-default pull-right">전체선택/해제</button>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_1">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/booklist-01.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">10. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/booklist-02.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">9. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">8. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">7. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">6. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">5. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">4. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">3. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">2. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 block_12_2">
				<img class="col-xs-4"
					src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
					alt="에피소드_메인그림" />
				<div class="col-xs-5">
					<div class="episode_size">
						<a href="#">1. 회차제목</a>
					</div>
					<span class="score_area"> <span class="icon_star_s"></span>
						<em>9.98</em>
					</span>
					<p>2016.10.24(등록일자)</p>
				</div>
				<div class="col-xs-3 check_box_list">
					<p>
						작품선택 : <input type="checkbox" />
					</p>
					<p>대여일자 ~ 대여마지막일자 or 구입일자</p>
				</div>
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
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span></a></li>
		</ul>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>