<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang='ko'>
<head>

<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<jsp:include
	page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>

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

<style type="text/css">
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">

$(".retable").click(function(){
	
});
</script>
<!-- Article css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/naviStateColor/articleCommon.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/article/articleList.css" />


</head>
<body>
	<!-- 게시판 영역 -->
	<div class="container main_container">
		<div class="center-block">
			<img
				src="${pageContext.request.contextPath}/assets/imgs/article/freearticle.png"
				alt="자유게시판" class="img-rounded center-block" />
		</div>
		<table
			class="table table-spriped table table-condensed table table-hover">
			<thead>
				<tr>
					<th class="text-center">글번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">조회수</th>
					<th class="text-center">작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(adminArticleList) > 0}">
						<c:forEach var="article" items="${adminArticleList}">
							<c:if test="${article.category == 'notice'}">
								<tr id="TableCategory"  style="font-weight:bolder; background-color : #EEEEEE;">
									<td class="text-center">${article.id}</td>
									<td class="text-center"><c:url var="readUrl"
											value="/community/article_read.do">
											<c:param name="article_id" value="${article.id}" />
										</c:url> <a href="${readUrl}">${article.subject}</a></td>
									<td class="text-center">${article.user_nickname}</td>
									<td class="text-center">${article.hit}</td>
									<td class="text-center">${article.reg_date}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:when>
				</c:choose>
			</tbody>
			<tbody>
				<c:choose>
					<c:when test="${fn:length(articleList) > 0}">
						<c:forEach var="article" items="${articleList}">
							<c:if test="${article.category == 'free'}">
								<tr>
									<td class="text-center">${article.id}</td>
									<td class="text-center"><c:url var="readUrl"
											value="/community/article_read.do">
											<c:param name="article_id" value="${article.id}" />
										</c:url> <a href="${readUrl}">${article.subject}</a></td>
									<td class="text-center">${article.user_nickname}</td>
									<td class="text-center">${article.hit}</td>
									<td class="text-center">${article.reg_date}</td>
								</tr>
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5" class="text-center" style="line-height: 100px">조회된
								글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		
		<!-- 검색폼 + 글 쓰기 버튼 시작 -->
		<div class="clearfix">
			<!-- 검색 폼 -->
			<div class="pull-left">
				<form method="get"
					action="${pageContext.request.contextPath}/community/article_list.do"
					style="width: 200px">

					<div class="input-group">
						<input type="text" name="keyword" class="form-control"
							placeholder="제목,내용 검색" value="${keyword}" /> <span
							class="input-group-btn">
							<button class="btn btn-warning" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</form>
			</div>
			<!-- 글 쓰기 버튼 -->
			<div class="pull-right">
				<a
					href="${pageContext.request.contextPath}/community/article_write.do?category=${category}"
					class="btn btn-warning"><i class="glyphicon glyphicon-pencil"></i>
					글쓰기</a>
			</div>
		</div>
		<!-- // 검색폼 + 글 쓰기 버튼 끝 -->

		<!-- 페이지 번호 시작 -->
		<nav class="text-center">
			<ul class="pagination">
				<!-- 이전 그룹으로 이동 -->
				<c:choose>
					<c:when test="${pageHelper.prevPage > 0}">
						<!-- 이전 그룹에 대한 페이지 번호가 존재한다면? -->
						<!-- 이전 그룹으로 이동하기 위한 URL을 생성해서 "prevUrl"에 저장 -->
						<c:url var="prevUrl" value="/community/article_list.do">

							<c:param name="keyword" value="${keyword}"></c:param>
							<c:param name="page" value="${pageHelper.prevPage}"></c:param>
						</c:url>

						<li><a href="${prevUrl}" class="retable">&laquo;</a></li>
					</c:when>

					<c:otherwise>
						<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
						<li class="disabled"><a href="#">&laquo;</a></li>
					</c:otherwise>
				</c:choose>

				<!-- 페이지 번호 -->
				<!-- 현재 그룹의 시작페이지~끝페이지 사이를 1씩 증가하면서 반복 -->
				<c:forEach var="i" begin="${pageHelper.startPage}"
					end="${pageHelper.endPage}" step="1">
					<!-- 각 페이지 번호로 이동할 수 있는 URL을 생성하여 page_url에 저장 -->
					<c:url var="pageUrl" value="/community/article_list.do">
						
						<c:param name="keyword" value="${keyword}"></c:param>
						<c:param name="page" value="${i}"></c:param>
					</c:url>

					<!-- 반복중의 페이지 번호와 현재 위치한 페이지 번호가 같은 경우에 대한 분기 -->
					<c:choose>
						<c:when test="${pageHelper.page == i}">
							<li class="active"><a href="#">${i}</a></li>
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
						<c:url var="nextUrl" value="/community/article_list.do">

							<c:param name="keyword" value="${keyword}"></c:param>
							<c:param name="page" value="${pageHelper.nextPage}"></c:param>
						</c:url>

						<li><a href="${nextUrl}" class="retable">&raquo;</a></li>
					</c:when>

					<c:otherwise>
						<!-- 이전 그룹에 대한 페이지 번호가 존재하지 않는다면? -->
						<li class="disabled"><a href="#">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<!-- // 페이지 번호 끝 -->
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

</body>
</html>