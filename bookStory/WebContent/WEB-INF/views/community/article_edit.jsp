<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/articleCommon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/article/articleList.css" />
    <!-- CKEditor -->
	<script src="http://cdn.ckeditor.com/4.4.7/standard/ckeditor.js"></script>


</head>
<body>
	<!-- 게시글 수정 -->
	<div class="container">
  <h1 class="page-header"><small>수정하기</small></h1>
  
  <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/community/article_edit_ok.do">
    
    <!-- 수정 대상에 대한 상태유지 -->
    <input type="hidden" id="article_id" name="article_id" value="${readArticle.id}"/>
    
    
    <!-- 제목 -->
    <div class="form-group">
      <label for="subject" class="col-sm-2 control-albel">제목</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="subject" name="subject" value="${readArticle.subject}"/>
      </div>
    </div>
    <!-- 내용 -->
    <div class="form-group">
      <label for="content" class="col-sm-2 control-albel">내용</label>
      <div class="col-sm-10">
        <textarea id="content" name="content" class="ckeditor">${readArticle.content}</textarea>
      </div>
    </div>
    
    <!-- 버튼들 -->
    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-warning">저장하기</button>
        <button type="button" class="btn btn-danger" onclick="history.back();">작성취소</button>
      </div>
    </div>
  </form>
</div>
	
<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

</body>
</html>