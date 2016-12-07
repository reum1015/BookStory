<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<!-- 깃허브 테스트 -->

<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>

<style type="text/css">
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
			$(function(){
				
				$(".male_button").click(function(){
					$(".main_gender_list_female").css('display','none');
					$(".main_gender_list_male").css('display', 'block');
					$(".male_button").css('background-color','#FFEBCD');
					$(".female_button").css('background-color','#FFF');
				});
				
				$(".female_button").click(function(){
					$(".main_gender_list_female").css('display','block');
					$(".main_gender_list_male").css('display', 'none');
					$(".male_button").css('background-color','#FFF');
					$(".female_button").css('background-color','#FFEBCD');
				});
				
			});
		</script>
</head>
<body>
	<!-- 메인 섹션 시작 -->
	<div class="container main_container">

		<!-- 캐러셀 시작 -->
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<a href="#"><img
						src="${pageContext.request.contextPath}/assets/imgs/carousel/naver_carousel.jpg"
						alt="..."
						style="width: 1159px; height: 367px;"></a>
					<div class="carousel-caption">
						<h2>여기에 내용이 출력 됩니다!!!!!</h2>
					</div>
				</div>
				<div class="item">
					<a href="#"><img
						src="${pageContext.request.contextPath}/assets/imgs/carousel/02.png"
						alt="..."
						style="width: 1159px; height: 367px;"></a>
					<div class="carousel-caption">
						<h2>여기에 내용이 출력 됩니다!!!!!</h2>
					</div>
				</div>
				<div class="item">
					<a href="#"><img
						src="${pageContext.request.contextPath}/assets/imgs/carousel/03.png"
						alt="..."
						style="width: 1159px; height: 367px;"></a>
					<div class="carousel-caption">
						<h2>여기에 내용이 출력 됩니다!!!!!</h2>
					</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<!-- 캐러셀 끝 -->

		<!-- 장르별 추천작 시작-->
		<!-- 장르별 추천작 & 드롭다운 메뉴(장르 선택) -->
		<div class="dropdown genre_choice">
			<h4 id="genre_title">장르별 추천작</h4>
			<div class="btn-group pull-right check_button">
				<button type="button" data-toggle="dropdown"
					class="btn btn-warning dropdown-toggle">
					장르선택 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li><a href="#">로맨스</a></li>
					<li><a href="#">SF&amp;판타지</a></li>
					<li><a href="#">무협</a></li>
					<li><a href="#">미스터리</a></li>
					<li><a href="#">퓨전</a></li>

				</ul>
			</div>
		</div>
		<!-- 장르별 추천작 & 드롭다운 메뉴(장르 선택) 끝 -->


		<!-- 장르별 추천작 리스트 -->
		<div class="row genre_row">
			<!-- 항목1 -->
			<div class="col-xs-6 col-sm-3 main_list_genre">
				<div class="thumbnail main_thumbbox">
					<a href="${pageContext.request.contextPath}/booklist/book_list.do"
						class="main_alist"> <span class="icon_new"></span> <img
						alt="thumb"
						src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist01.png"
						class="main_list_img"> <span class="caption list_info">
							<span class="genre">미스테리</span> <span class="subj v2">르네
								마그리트의 '연인'</span> <span> <span class="author v2">유지나</span> <span
								class="num_total">총 5회</span>
						</span> <span class="score_area"> <span class="icon_star"></span>
								<em class="score">9.94</em>
						</span> <span class="favorite"> <span>관심</span> <span>22,215</span>
						</span> <span class="emptybox"> </span>
					</span>
					</a>
				</div>
			</div>


			<!-- 항목2 -->
			<div class="col-xs-6 col-sm-3 main_list_genre">
				<div class="thumbnail main_thumbbox">
					<a href="#" class="main_alist"> <span class="icon_com"></span>
						<img alt="thumb"
						src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist02.png"
						class="main_list_img"> <span class="caption list_info">
							<span class="genre">미스테리</span> <span class="subj v2">르네
								마그리트의 '연인'</span> <span> <span class="author v2">유지나</span> <span
								class="num_total">총 5회</span>
						</span> <span class="score_area"> <span class="icon_star"></span>
								<em>9.94</em>
						</span> <span class="favorite"> <span>관심</span> <span>22,215</span>
						</span> <span class="emptybox"> </span>
					</span>
					</a>
				</div>
			</div>

			<!-- 항목3 -->
			<div class="col-xs-6 col-sm-3 main_list_genre">
				<div class="thumbnail main_thumbbox">
					<a href="#" class="main_alist"> <img alt="thumb"
						src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist03.png"
						class="main_list_img"> <span class="caption list_info">
							<span class="genre">미스테리</span> <span class="subj v2">르네
								마그리트의 '연인'</span> <span> <span class="author v2">유지나</span> <span
								class="num_total">총 5회</span>
						</span> <span class="score_area"> <span class="icon_star"></span>
								<em>9.94</em>
						</span> <span class="favorite"> <span>관심</span> <span>22,215</span>
						</span> <span class="emptybox"> </span>
					</span>
					</a>
				</div>
			</div>


			<!-- 항목4 -->
			<div class="col-xs-6 col-sm-3 main_list_genre">
				<div class="thumbnail main_thumbbox">
					<a href="#" class="main_alist"> <img alt="thumb"
						src="${pageContext.request.contextPath}/assets/imgs/genre/mainlist04.png"
						class="main_list_img"> <span class="caption list_info">
							<span class="genre">미스테리</span> <span class="subj v2">르네
								마그리트의 '연인'</span> <span> <span class="author v2">유지나</span> <span
								class="num_total">총 5회</span>
						</span> <span class="score_area"> <span class="icon_star"></span>
								<em>9.94</em>
						</span> <span class="favorite"> <span>관심</span> <span>22,215</span>
						</span> <span class="emptybox"> </span>
					</span>
					</a>
				</div>
			</div>

		</div>
		<!-- 장르별 추천작 리스트 끝-->



		<!-- 남여별 인기작 & 통합 랭킹 -->

		<div class="row gender_row">

			<!-- 남녀별 인기작 -->
			<div
				class="col-xs-12 col-sm-8 text-left section_area list_gender box">


				<div class="list_gender_titleButton_div">
					<h4 class="list_gender_title">남여별 인기작</h4>

					<div class="btn-group list_gender_button" data-toggle="buttons">

						<a href="#" class="btn btn-default female_button" role="button">여성</a>
						<a href="#" class="btn btn-default male_button" role="button">남성</a>

					</div>
				</div>


				<div class="main_gender_list_female">
					<div class="col-xs-6 col-md-4 list_gender_li">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <span
								class="icon_new"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list01.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li  list_gender_02">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list02.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <span
								class="icon_com"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list03.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>


					<div class="col-xs-6 col-md-4 list_gender_li list_gender_04">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list04.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list05.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>
				</div>
				<!-- 남여별 인기작 숨김영역 남자 -->
				<div class="main_gender_list_male">
					<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

					<div class="col-xs-6 col-md-4 list_gender_li list_gender_06">
						<div class="thumbnail main_gender_list">
							<a href="#"> <span class="gender_list_skin"></span> <img
								class="gender_list_img img-response"
								src="${pageContext.request.contextPath}/assets/imgs/gender/list06.jpg"
								alt="Pulpit Rock" style="width: 100%; height: 100%"> <span
								class="main_gender_info"> <span class="gender_title">위험한
										신혼부부</span> <span class="gender_author">박수정(방울마마)</span>

							</span>
							</a>
						</div>
					</div>

				</div>
			</div>
			<!-------- 연령별 선호작  ---------->
			<div
				class="col-xs-12 col-sm-4 text-center section_area list_rank box">
				<h4 class="text-left">연령별 선호작품</h4>
				<div class="btn-group btn-group-justified" role="group"
					aria-label="...">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">남자</button>
					</div>
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default">여자</button>
					</div>

				</div>
				<div class="row empty_box_rank"></div>

				<!-- tab-x -->
				<div id="btn-group-justified">
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a data-toggle="tab" href="#home">10대</a></li>
						<li><a data-toggle="tab" href="#menu1">20대</a></li>
						<li><a data-toggle="tab" href="#menu2">30대</a></li>
						<li><a data-toggle="tab" href="#menu3">40대</a></li>
					</ul>

					<div class="tab-content total_ranking_tab">
						<div id="home" class="tab-pane fade in active">
							<ul class="list-group listgroup_rank">
								<li class="list-group-item text-"><a href="#">[판타지]마왕군
										네크로맨서</a></li>
								<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
								<li class="list-group-item"><a href="#">[미스테리]그리고 아무도
										없었다</a></li>
								<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>
								<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>
								<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>
								<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>
								<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은
										장미 아가씨</a></li>
								<li class="list-group-item"><a href="#">[미스테리]그리고 아무도
										없었다</a></li>
							</ul>
						</div>
						<div id="menu1" class="tab-pane fade">
							<ul class="list-group listgroup_rank">
								<li class="list-group-item text-"><a href="#">[판타지]마왕군
										네크로맨서</a></li>
								<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
								<li class="list-group-item"><a href="#">[미스테리]그리고 아무도
										없었다</a></li>
								<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>
								<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>
								<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>
								<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>
								<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은
										장미 아가씨</a></li>
								<li class="list-group-item"><a href="#">[미스테리]그리고 아무도
										없었다</a></li>
							</ul>
						</div>
						<div id="menu2" class="tab-pane fade">
							<ul class="list-group listgroup_rank">
								<li class="list-group-item text-"><a href="#">[판타지]마왕군
										네크로맨서</a></li>
								<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
								<li class="list-group-item"><a href="#">[미스테리]그리고 아무도
										없었다</a></li>
								<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>
								<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>
								<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>
								<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>
								<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은
										장미 아가씨</a></li>
								<li class="list-group-item"><a href="#">[미스테리]그리고 아무도
										없었다</a></li>
							</ul>
						</div>
						<div id="menu3" class="tab-pane fade">
							<ul class="list-group listgroup_rank">
								<li class="list-group-item text-"><a href="#">[판타지]마왕군
										네크로맨서</a></li>
								<li class="list-group-item"><a href="#">[로맨스]정령의 왕</a></li>
								<li class="list-group-item"><a href="#">[미스테리]그리고 아무도
										없었다</a></li>
								<li class="list-group-item"><a href="#">[로맨스]위험한 신혼부부</a></li>
								<li class="list-group-item"><a href="#">[로맨스]조선 연애 실록</a></li>
								<li class="list-group-item"><a href="#">[무협]낙향문 사건</a></li>
								<li class="list-group-item"><a href="#">[미스테리]12시의 신데렐라</a></li>
								<li class="list-group-item"><a href="#">[SF&amp;스릴러]붉은
										장미 아가씨</a></li>
								<li class="list-group-item"><a href="#">[미스테리]그리고 아무도
										없었다</a></li>
							</ul>
						</div>
					</div>
				</div>


				<!-- //tab-x end -->

			</div>
			<!-- 연령별 선호작 끝 -->

		</div>
		<!-- 남여별 인기작 & 통합 랭킹 끝 -->

	</div>
	<!-- 메인 섹션 끝 -->

	<!-- footer include -->

	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

</body>
</html>