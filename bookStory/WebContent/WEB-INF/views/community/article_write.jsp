<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang='ko'>
<head>

<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>
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

		</script>
<!-- Article css -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/naviStateColor/articleCommon.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/article/articleWrite.css" />
	
	<!-- CKEditor -->
	<script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>


</head>
<body>
<!-- 게시판 영역 -->
	<div class="container main_container">
		<div class="Article_size">
			<div class="left-block">
				<img
					src="${pageContext.request.contextPath}/assets/imgs/article/FreeArticle1.png"
					alt="자유게시판" class="img-rounded left-block">
			</div>
			<section>
				<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/community/article_write_ok.do">
  
    <!-- 게시판 카테고리에 대한 상태유지 -->
    <input type="hidden" name="category" value="${category}"/>
    <!-- 작성자, 비밀번호 이메일은 로그인하지 않은 경우만 입력한다. -->
    <c:choose>
    <c:when test="${loginInfo == null}">
      <!-- 작성자 -->
      <div class="form-group">
        <h1>로그인 후 이용 가능합니다.</h1>
      </div>
    </c:when>
    <c:otherwise>
    
    <!-- 제목 -->
    <div class="form-group">
      <label for="subject" class="col-sm-2 control-albel">제목</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="subject" name="subject"/>
      </div>
    </div>
    <!-- 내용 -->
    <div class="form-group">
      <label for="content" class="col-sm-2 control-albel">내용</label>
      <div class="col-sm-10">
        <textarea id="content" name="content" class="ckeditor"></textarea>
      </div>
    </div>
    <!-- 버튼들 -->
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-primary">저장하기</button>
        <button type="button" class="btn btn-danger" onclick="history.back();">작성취소</button>
      </div>
    </div>
    </c:otherwise>
    </c:choose>
  </form>
			</section>
		</div>
	</div>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
</body>
</html>