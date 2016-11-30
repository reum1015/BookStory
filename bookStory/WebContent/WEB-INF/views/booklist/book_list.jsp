<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<h3>작품제목</h3>
				<p>
					글&nbsp&nbsp&nbsp&nbsp<a href="#">작가이름</a>
				</p>
			</div>
			<div class="col-xs-6 col-sm-6 content6">
				<a href="#"> <span class="favorite_module pull-right"> </span>
				</a>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 block_12">
			<img class="col-xs-5 col-sm-5"
				src="${pageContext.request.contextPath}/assets/imgs/img/bookList.jpg"
				alt="그림">
			<div class="col-xs-7 col-sm-7 pull-left">
				<span class="grade_area"> <span class="stargrade"></span> <em>9.95</em>
				</span>
				<p class="info_book">
					<span>관심 <span class="">20,353</span>
					</span> <span class="publish"> 월, 금 연재 </span> <span class="genre">
						퓨전 </span>
				</p>
				<p class="dsc">‘마왕’과의 계약으로 운명을 볼 수 있는 눈을 갖게 된 소년, 공손천기. 그러나 그
					거래는 그에게 잔혹한 대가를 요구한다. 부조리한 운명에 거스르기 위한 공손천기의 필사적인 저항. 지금 죽은 자들의 왕,
					사자왕(死者王)이 무림에 강림한다!</p>
			</div>
			<a href="${pageContext.request.contextPath}/novelview/view_page.do" class="btn btn-primary">첫회 보기 </a> <a href="#"
				class="btn btn-default pull-right">전체 대여 </a> <a href="#"
				class="btn btn-default pull-right">전체 구입 </a>
		</div>
		<div class="col-xs-12 col-sm-12 block_12">
			<div class="col-xs-6 col-sm-6 pull-left">
				<h3>
					작품회차<span class="total">(10)</span>
				</h3>
			</div>
			<div class="col-xs-6 col-sm-6 btn_h3">
				<button class="btn btn-default pull-right">대여</button>
				<button class="btn btn-default pull-right">구입</button>
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