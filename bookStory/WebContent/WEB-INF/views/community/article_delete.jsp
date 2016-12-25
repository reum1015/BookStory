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


</head>
<body>
	<!-- 게시글 삭제 -->
	<div class="container">
  <h1><small>글 삭제하기</small></h1>
  
  <form name="myform" method="post" action="${pageContext.request.contextPath}/community/article_delete_ok.do">
    <!-- 카테고리와 게시글 번호 상태유지 -->
    <input type="hidden" name="article_id" value="${article_id}"/>
    <input type="hidden" name="member_level" value="${member_level}"/>
    <input type="hidden" name="report_delete" value="${report_delete}"/>
    <input type="hidden" name="member_id" value="${member_id}"/>
    
    <div style="width: 300px; margin: 50px auto;">
    	<c:choose>
    		<c:when test="${report_delete != 1}">
       			<h4>정말 이 게시물을 삭제 하시겠습니까?</h4>
       		</c:when>
       		<c:otherwise>
       			<h4>Report에 등록된 게시글 데이터만 삭제 하시겠습니까?</h4>
       		</c:otherwise>
       </c:choose>
      <div class="form-group">
        <button type="submit" class="btn btn-danger btn-block">삭제하기</button>
        <button type="button" class="btn btn-primary btn-block" onclick="history.back()">삭제취소</button>
      </div>
    </div>
  </form>
</div>
	
<!-- footer -->
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

</body>
</html>