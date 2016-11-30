<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
		
		<!-- admin css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/adminCommon.css"/>
		
<script type="text/javascript">




</script>
<style type="text/css">

</style>
		
	</head>
	<body>

	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>

	

					
<!-- 메인 화면 시작 -->
<div class="container-fluid admin_main_container hidden-xs">
		<div class="row admin_main_row">
		<!-- 어드민 슬라이드 메뉴 영역 -->
			<div class="col-md-2 amdin_main_slider">
	    		<ul class="nav main_slider_nav" id="admin_main_menu">
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/admin_userInfo.do"><span class="glyphicon glyphicon-user pull-left icon_color" aria-hidden="true"></span>회원 정보</a></li>
	    			<li class="search_list"><a href="#upload_sub" data-toggle="collapse" data-parent="#admin_main_menu" id="accordion1">
	    			<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>업로드</a>
	    				<ul id="upload_sub" class="collapse">
	    					<li>공지사항 업로드</li>
	    					<li><a href="${pageContext.request.contextPath}/admin/novel_upload.do">신규 작품 업로드</a></li>
	    					<li><a href="${pageContext.request.contextPath}/admin/episode_upload.do">에피소드 업로드</a></li>
	    				</ul>
	    			</li>	
					
	    			<li class="search_list"><a href="#"><span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>게시물 관리</a></li>
	    			<li class="search_list"><a href="#"><span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>댓글 관리</a></li>
	    		</ul>
    	</div>
    	<!-- //어드민 슬라이드 메뉴 영역 -->
    		
	    	<!-- 어드민 컨텐트 영역 -->
			<div class="col-md-10 admin_content">
	    	
	    	
	    	<form class="form-horizontal book_search" style="margin: 50px 0;">
		    	<fieldset>
	
		    		<label class="control-label col-xs-2" for="writer">검색 </label>
						<div class="col-xs-10">
							<div class="input-group">
								<input type="text" class="form-control col-xs-10" placeholder="작품명" id="search_box" />
		                   <span class="input-group-btn">
		                        <button class="btn btn-info" type="button" style="background-color: #CD8F49; border-color:#CD8F49">
		                        <i class="glyphicon glyphicon-search"></i>
		                        </button>
		                    </span>
							</div>
		    			</div>
		    	</fieldset>
	    	</form>
	    	
	    	


			<!-- 기존 Article Upload 폼 시작 -->
			<form class="form-horizontal existing_upload" enctype="multipart/form-data" 
						action="${pageContext.request.contextPath}/admin/episode_upload_ok.do" id="episode_upload" method="post">
				<fieldset>
				
				<legend>기존 작품</legend>
				
				
				<!-- 작품 제목 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="book_title">작품 제목 </label>
					<div class="col-xs-10">
												
							<select class="form-control" id="book_title" name="book_title">
								<option>우아한 환생</option>
								<option>두입술 사이</option>
								<option>나쁜 관계</option>					
							</select>
						
					</div>
				</div>
				
				
				<!--  장르 & 요일 선택 -->
				<div class="form-group">

						<label for="genre" class="control-label col-xs-2">장르</label>
						<div class="col-xs-4 ">							
							<input class="form-control" type="text" name="genre" id="genre" value="공포" readonly="readonly">
						</div>
						
						<label for="dayby" class="control-label col-xs-2">요일</label>
						<div class="col-xs-4 ">							
							<input class="form-control" type="text" name="daily_date" id="daily_date" value="금요일" readonly="readonly">	
						</div>						
				</div>
				
				
				<!-- 회차 제목 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="episode_name">에피소드 제목 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" placeholder="에피소드 제목" id="episode_name" name="episode_name" />					
			
						
					</div>
				</div>
				
				
				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="content">작품 내용</label>
					<div class="col-xs-10">
						<textarea class="form-control" rows="15" id="content" name="content"></textarea>
					</div>
				</div>

			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">에피소드(메인)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="episode" multiple/>
				</div>
			</div>
				
				
				<!-- 작가 코멘트 -->

				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="auther_comment">작가 코멘트</label>
					<div class="col-xs-10">
						<textarea class="ckeditor form-control" rows="3" id="author_comment" name="author_comment"></textarea>
					</div>
				
				</div>
				
				    <div class="form-group">
			      <div class="col-xs-offset-2 col-xs-10">
			        <button type="submit" class="btn btn-success">전송</button>
			        <button type="button" class="btn btn-danger" onclick="history.back();">
					작성취소</button> 
			      </div>
			      </div>
			
				
			
			</fieldset>
			</form><!-- 신규 Article Upload 폼 시작 -->
					
	    	
	    	</div>
			<!-- //어드민 컨텐트 영역 -->
    		
		</div> <!-- end row -->


	</div>
			<!-- 메인 화면 끝 -->
	
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
		<script src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/typeahead.js/typeahead.bundle.min.js"></script>
	    
	    	
	</body>
</html>