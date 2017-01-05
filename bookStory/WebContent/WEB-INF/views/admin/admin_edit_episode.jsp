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
			//메인 이미지 Jpg or png만 등록 가능
			$("#episode_img").change(
				    function(){
				     val = $(this).val().split("\\");
				     f_name = val[val.length-1]; //마지막 화일명
				     s_name = f_name.substring(f_name.length-4, f_name.length);//확장자빼오기

				     if(s_name.toLowerCase() == '.jpg' || s_name.toLowerCase() == '.png'){//허용 확장자 비교
				      $("#episode_img").html(f_name);
				     }else{
				      alert("jpg 이나 png 파일만 가능 합니다.");
				      document.getElementById("episode_img").value = "";
				      return false;
				     }
			 });
			
			//작품 등록시 이미지 유효성 검사
			$("#episode_update").submit(function() {
				var episodeImgVal = document.getElementById('episode_img').value
				var imgTagValue = $('#episode_imgBox').attr('src');
				
				if((episodeImgVal == null || episodeImgVal=="") &&(imgTagValue == null || imgTagValue=="") ){
					alert("이미지를 등록해 주세요");
					return false;
				}
			});
			
			
			/** 이미지 선택시 화면에 보여주기 */
			 $("#episode_img").change(function(){
			        readURL(this);
			        var carousel_value = document.getElementById('episode_img').value
			        if(carousel_value == null || carousel_value==""){
			        	$('#episode_imgBox').css('display','none')
			        	$('#episode_imgBox').attr('src', '');
			        	$('#episode_imgBox').attr('name', '');
						return false;
					}else{
						$('#episode_imgBox').attr('name', carousel_value);
					}
			        
			   });
			 function readURL(input) {
			        if (input.files && input.files[0]) {
			            var reader = new FileReader();
			            
			            reader.onload = function (e) {
			            	$('#episode_imgBox').css('display','block');
			                $('#episode_imgBox').attr('src', e.target.result);
			            }
			            
			            reader.readAsDataURL(input.files[0]);
			        }
			    }
		})
		</script>
	</head>
	<body>

				<!-- 메인 헤더 -->
		<jsp:include page="/WEB-INF/views/template/head_nav.jsp?member_level=${member_level}"></jsp:include>		


	<!-- 메인 시작 -->
	<div class="container-fluid admin_main_container hidden-xs">
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
			
			
	    		
			
				<h1 class="page-header" id="upload_title">에피소드 수정</h1>
			
			
			<!-- 기존 에피소드 수정 폼 시작 -->
			<form class="form-horizontal" enctype="multipart/form-data" 
						action="${pageContext.request.contextPath}/admin/adminEpisodeEdit_Ok" id="episode_update" method="post">
				<fieldset>
				
				<legend>기존 작품</legend>
				
				<!-- 작품 번호 hidden -->

				
				
				<input type="hidden" name="episode_id" value="${epiItem.id}">
				<input type="hidden" name="book_id" value="${book_id}">
				<!--  장르 & 요일 선택 -->
				
				
				<!-- 회차 제목 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="episode_name">에피소드 제목 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="episode_name" name="episode_name" value="${epiItem.episode_name}" />					
			
						
					</div>
				</div>
				
				
				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="content">에피소드 내용</label>
					<div class="col-xs-10">
						<textarea class="form-control" rows="15" id="content" name="content"> ${epiItem.content}</textarea>
					</div>
				</div>


			<!-- 작가 코멘트 -->

				
				<div class="form-group">
					<label class="col-xs-2 control-label" for="author_comment">작가 코멘트</label>
					<div class="col-xs-10">
						<textarea class="ckeditor form-control" rows="3" id="author_comment" name="author_comment">
							${epiItem.author_comment}
						</textarea>
					</div>
				
				</div>
			<div class="form-group">
					<label class="col-xs-2 control-label" for="author_comment">구매 가격</label>
					<div class="col-xs-4">
						<input type="text" class="form-control" id="episode_buy" name="episode_buy" value="${epiItem.episode_buy}">
					</div>
					
					<label class="col-xs-2 control-label" for="author_comment">대여 가격</label>
					<div class="col-xs-4">
						<input type="text" class="form-control" id="episode_rent" name=episode_rent value="${epiItem.episode_rent}">
					</div>
				
				</div>
			
			
			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">에피소드(메인)</label>
				
				
				<div class="col-xs-10">
					<input type="file" class="form-control" name="episode" id="episode_img" multiple/>
				</div>
			</div>
			
	
			<!-- 이미지 캐러셀 -->
			<div class="form-group">
					<div class="col-xs-10 col-xs-offset-2">
						<c:url var="image_url" value="/download.do">
							<c:param name="file" value="${epiItem.imagePath}" />
						</c:url>
						
						<p>
							<img src="${image_url}" alt="${epiItem.episode_name}" id="episode_imgBox"/>
							
						</p>
					</div>
			</div>
		
				    <div class="form-group">
			      <div class="col-xs-offset-2 col-xs-10">
			        <button type="submit" class="btn btn-success">에피소드 수정</button>
			        <button type="button" class="btn btn-danger" onclick="history.back();">
					작성취소</button> 
			      </div>
			      </div>
			
				
			
			</fieldset>
			</form><!-- 에피소드 수정 form 끝 -->
					
	    	
	    	</div>
			<!-- //어드민 컨텐트 영역 -->
		</div> <!-- end row -->
	</div>
			<!-- 메인 화면 끝 -->

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script>
	</body>
</html>