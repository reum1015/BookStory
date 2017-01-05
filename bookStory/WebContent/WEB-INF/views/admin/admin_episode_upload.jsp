<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
		
		<!-- admin css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/adminCommon.css"/>
	
		
		
		<script src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	    	   
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.css"/>
	    <script src="${pageContext.request.contextPath}/assets/js/ajax/ajax_helper.js"></script>
	    <script src="${pageContext.request.contextPath}/assets/js/ajax-form/jquery.form.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/handlebars/handlebars-v4.0.5.js"></script>
		
		<!-- imageUpload Css -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/bootstrap-imageupload.min.css"/>
		
	<style type="text/css">



	</style>
		
	</head>
	<body>

	<jsp:include page="/WEB-INF/views/template/head_navs.jsp"/>

	

					
<!-- 메인 화면 시작 -->
	<div class="container-fluid admin_main_container">
		<div class="row admin_main_row">
			<!-- 어드민 슬라이드 메뉴 영역 -->
			<div class="col-md-2 amdin_main_slider" id="slider_main">
	    		<ul class="nav main_slider_nav" id="admin_main_menu">
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/admin_userInfo.do">
	    				<span class="glyphicon glyphicon-user pull-left icon_color" aria-hidden="true"></span>회원 정보</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/notice_upload.do">
	    				<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>공지 사항 업로드</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/novel_upload.do">
	    				<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>신규 작품 업로드</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/episode_upload.do">
	    				<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>에피소드 업로드</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/book_manage.do">
	    				<span class="glyphicon glyphicon-upload pull-left icon_color" aria-hidden="true"></span>작품 관리</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/article_manage.do">
	    				<span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>게시물 관리</a>
	    			</li>
	    			
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/comment_manage.do">
	    				<span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>댓글 관리</a>
	    			</li>
	    		</ul>
    		</div>
    	<!-- //어드민 슬라이드 메뉴 영역 -->
    		
	    	<!-- 어드민 컨텐트 영역 -->
			<div class="col-md-10 admin_content" id="content_height">
	    	
	    	
	    	<form class="form-horizontal book_search" style="margin: 50px 0;" 
	    		action="${pageContext.request.contextPath}/admin/adminBookSearch.do" method="post"
	    		id="search-form">
		    	<fieldset>
	
		    		<label class="control-label col-xs-2" for="writer">검색 </label>
						<div class="col-xs-10">
							<div class="input-group">
								<input type="text" class="form-control col-xs-10" placeholder="작품명 or 작가명" id="keyword" name="keyword"/>
		                   <span class="input-group-btn">
		                        <button class="btn btn-info" type="submit" style="background-color: #CD8F49; border-color:#CD8F49">
		                        <i class="glyphicon glyphicon-search"></i>
		                        </button>
		                    </span>
							</div>
		    			</div>
		    	</fieldset>
	    	</form>
	    	
	    	
	    	<div class="col-sm-offset-2 media" id="search_resultBox">
 			 	
            </div>
	    	
	    	
	    	
	    	
	    	<script type="text/x-handlebars-template" id="List-item-templ">
					{{#item}}
				
                  <a href="#">
					
 					<div class="media">
				        <div class="media-left">
				                <img src="${pageContext.request.contextPath}/download.do?file={{imagePath}}" class="media-object"style="width: 150px; height: 118px;">
				        </div>
				        <div class="media-body result_book_info">
				            <h3 class="media-heading" id="book_name">{{book_name}}</h3>
				            <small><i id="book_author">{{book_author}}</i></small>
							<input type="hidden" value="{{id}}" id="id">
							<input type="hidden" value="{{daily_date}}" id="daily_date">
							<input type="hidden" value="{{genre}}" id="genre">
				        </div>
				    </div>
				    </a>
              
	    		{{/item}}
	    	</script>
	    	
			<!-- 기존 episode Upload 폼 시작 -->
			<form class="form-horizontal" enctype="multipart/form-data" 
						action="${pageContext.request.contextPath}/admin/episode_upload_ok.do" id="episode_upload" method="post">
				<fieldset>
				
				<legend>에피소드 업로드</legend>
				
				<!-- 작품 번호 hidden -->

				<div class="form-group" style="display: none;">
					<label class="control-label col-xs-2" for="book_id">작품 번호 </label>
					<div class="col-xs-10">
						<input class="form-control" type="text" name="book_id" id="book_id" value="" readonly="readonly">
					</div>
				</div>
				
				
				
				
				<!-- 작품 제목 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="book_title">작품 제목 </label>
					<div class="col-xs-10">
						<input class="form-control" type="text" name="book_title" id="form_book_title" value="" readonly="readonly">
					</div>
				</div>
				
				
				<!--  장르 & 요일 선택 -->
				<div class="form-group">

						<label for="form_genre" class="control-label col-xs-2">장르</label>
						<div class="col-xs-4 ">							
							<input class="form-control" type="text" name="genre" id="form_genre" value="" readonly="readonly">
						</div>
						
						<label for="form_daily_date" class="control-label col-xs-2">요일</label>
						<div class="col-xs-4 ">							
							<input class="form-control" type="text" name="daily_date" id="form_daily_date" value="" readonly="readonly">	
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
					<label class="col-xs-2 control-label" for="content">에피소드 내용</label>
					<div class="col-xs-10">
						<textarea class="form-control" rows="15" id="content" name="content"></textarea>
					</div>
				</div>

			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">에피소드(메인)</label>
				
				
				<div class="col-xs-10">
					<input type="file" class="form-control" name="episode" id="episode_img" multiple/>
				</div>
			</div>
			
			
			<div class="form-group" id="img_box">
				<div class="col-xs-offset-2 col-xs-10">
					<img alt="" src="#" id="episode_imgBox" style="width: 200px; height: 200px; display: none;">
				</div>
			</div>
				
				
				<!-- 작가 코멘트 -->

				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="author_comment">작가 코멘트</label>
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


	<script type="text/javascript">
			$(function() {
				
				function varHeight() {
					var wheight = document.getElementById("content_height").offsetHeight;
					var navheight = document.getElementById("slider_main").offsetHeight;
					if(navheight <= wheight){
						$("#slider_main").css({'height':wheight+'px'});
					}
				}
	
				varHeight();
	
				$(window).resize(function() {
					var wheight = document.getElementById("content_height").offsetHeight;
					var navheight = document.getElementById("slider_main").offsetHeight;
					if(navheight <= wheight){
						$("#slider_main").css({'height':wheight+'px'});
					}
				});
				
				$(window).scroll(function() {
					var wheight = document.getElementById("content_height").offsetHeight;
					var navheight = document.getElementById("slider_main").offsetHeight;
					if(navheight <= wheight){
						$("#slider_main").css({'height':wheight+'px'});
					}
				});
				
				
				 //업로드 유효성 검사(이미지)
				 $("#episode_upload").submit(function() {
						var episode_imgValue = document.getElementById('episode_img').value

						if(episode_imgValue == null || episode_imgValue ==""){
							alert("이미지를 등록해 주세요");
							return false;
						}
				});
	
				$("#search-form").ajaxForm(function(json) {
					
					$("#search_resultBox").empty();
					
					//keyword 받아오기
					var keyword = $("#keyword").val();
					
					// json은 API에서 표시하는 전체 데이터
					if (json.rt != "OK") {
						alert(json.rt);
						return false;
					}

					// 템플릿 HTML을 로드한다.
					var template = Handlebars.compile($("#List-item-templ").html());
					// JSON에 포함된 작성 결과 데이터를 템플릿에 결합한다.
					var html = template(json);
					// 결합된 결과를 덧글 목록에 추가한다.
					$("#search_resultBox").append(html);
					
					//검색결과에 있는 값 ---> 폼으로 이동
					$("div#search_resultBox a").click(function(e) {
						
						var bookName = $(this).find("h3").text();
						var bookAuthor = $(this).find("i").text();
						var dailyDate = $(this).find("#daily_date").val();
						var id = $(this).find("#id").val();
						var genre = $(this).find("#genre").val();
						
						
						
						$("#form_book_title").attr("value",bookName);
						$("#form_genre").attr("value",genre);
						$("#form_daily_date").attr("value",dailyDate);
						$("#book_id").attr("value",id);
							
						$("#episode_name").focus();
						
					});				
				});
				
				
				//이미지 미리 보기
				 $("#episode_img").change(function(){
				        readURL(this);
				        var carousel_value = document.getElementById('episode_img').value
				        if(carousel_value == null || carousel_value==""){
				        	$('#img_box').css('display','none')
							return false;
				        }
				    });
				
				 function readURL(input) {
				        if (input.files && input.files[0]) {
				            var reader = new FileReader();
				            
				            reader.onload = function (e) {
				            	$('#img_box').css('display','block');
				            	$('#episode_imgBox').css('display','block');
				                $('#episode_imgBox').attr('src', e.target.result);
				            }
				            
				            reader.readAsDataURL(input.files[0]);
				        }
				    }
			})
			</script>
	
	<!-- Javascript -->
	<script src="${pageContext.request.contextPath}/assets/js/image-upload/bootstrap-imageupload.min.js"></script>
	</body>
</html>