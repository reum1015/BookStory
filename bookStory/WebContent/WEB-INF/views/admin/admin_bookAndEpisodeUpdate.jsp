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
		$(function() {
			//캐러셀 이미지 Jpg or png만 등록 가능
			$("#carousel").change(
				    function(){
				     val = $(this).val().split("\\");
				     f_name = val[val.length-1]; //마지막 화일명
				     s_name = f_name.substring(f_name.length-4, f_name.length);//확장자빼오기

				     if(s_name.toLowerCase() == '.jpg' || s_name.toLowerCase() == '.png'){//허용 확장자 비교
				      $("#carousel_file").html(f_name);
				     }else{
				      alert("jpg 이나 png 파일만 가능 합니다.");
				      document.getElementById("carousel").value = "";
				      return false;
				     }
			 });
			
			//메인 이미지 Jpg or png만 등록 가능
			$("#main").change(
				    function(){
				     val = $(this).val().split("\\");
				     f_name = val[val.length-1]; //마지막 화일명
				     s_name = f_name.substring(f_name.length-4, f_name.length);//확장자빼오기

				     if(s_name.toLowerCase() == '.jpg' || s_name.toLowerCase() == '.png'){//허용 확장자 비교
				      $("#carousel_file").html(f_name);
				     }else{
				      alert("jpg 이나 png 파일만 가능 합니다.");
				      document.getElementById("main").value = "";
				      return false;
				     }
			 });
		
			//작품 등록시 이미지(캐러셀,메인) 유효성 검사
			$("#novel_upload").submit(function() {
				var carousel_value = document.getElementById('carousel').value
				var main_value = document.getElementById('main').value
				
				if(carousel_value == null || carousel_value==""){
					alert("캐러셀 이미지를 등록해 주세요");
					return false;
				}
				if(main_value == null || main_value ==""){
					alert("메인 이미지를 등록해 주세요");
					return false;
				}
			});
			
			
			 $("#carousel").change(function(){
			        readURL(this);
			        var carousel_value = document.getElementById('carousel').value
			        if(carousel_value == null || carousel_value==""){
			        	$('#carousel_img').css('display','none')
						return false;
					}
			        
			   });
			 function readURL(input) {
			        if (input.files && input.files[0]) {
			            var reader = new FileReader();
			            
			            reader.onload = function (e) {
			            	$('#carousel_img').css('display','block')
			                $('#carousel_img').attr('src', e.target.result);
			            }
			            
			            reader.readAsDataURL(input.files[0]);
			        }
			    }
			 
			 $("#main").change(function(){
			        readURL_main(this);
			        var carousel_value = document.getElementById('main').value
			        if(carousel_value == null || carousel_value==""){
			        	$('#main_img').css('display','none')
						return false;
					}
			        
			   });
			 function readURL_main(input) {
			        if (input.files && input.files[0]) {
			            var reader = new FileReader();
			            
			            reader.onload = function (e) {
			            	$('#main_img').css('display','block')
			                $('#main_img').attr('src', e.target.result);
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
			<div class="col-md-2 amdin_main_slider">
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
			<div class="col-md-10 admin_content">
	    		
			
				<h1 class="page-header" id="upload_title">작품업로드</h1>
			
			
			<!-- 신규작품 Article Upload 폼 시작 -->
			<form class="form-horizontal new_upload" enctype="multipart/form-data" 
			action="${pageContext.request.contextPath}/admin/novel_upload_ok.do" id="novel_upload" method="post">
				<fieldset>
					<legend>신규작품</legend>
				<div class="form-group">
					<label class="control-label col-xs-2" for="book_author">작가명 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="book_author" name="book_author" placeholder="작가명을 입력해 주세요">
					</div>
				</div>
							
				<!--  장르 & 요일 선택 -->
				<div class="form-group">
			
						<label for="genre" class="control-label col-xs-2">장르선택</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="genre" name="genre" >
								<option value="">-----장르 선택-----</option>
								<option value="Romance">로맨스</option>
								<option value="SF&Fantasy">SF&amp;판타지</option>
								<option value="Heroism">무협</option>
								<option value="Mystery">미스테리</option>
								<option value="Fusion">퓨전</option>
							</select>
						</div>
						
						<label for="dayby" class="control-label col-xs-2">요일선택</label>
						<div class="col-xs-4 ">							
								<select class="form-control" id="daily_date" name="daily_date">
								<option value="">-----요일 선택-----</option>
								<option value="MON">월요일</option>
								<option value="THE">화요일</option>
								<option value="WEN">수요일</option>
								<option value="THU">목요일</option>
								<option value="FRI">금요일</option>
								<option value="SAT">토요일</option>
								<option value="SUN">일요일</option>							
							</select>
						</div>
				</div>
				
				<!-- 작품 내용 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="book_name">작품 제목 </label>
					<div class="col-xs-10">
						<input type="text" class="form-control" id="book_name" name="book_name" placeholder="작품 제목을 입렵해 주세요 ">
					</div>
				</div>
				
				<!-- 작가 코멘트 -->
				<div class="form-group">
					<label class="control-label col-xs-2" for="intro">시놉시스</label>
					<div class="col-xs-10">
						<textarea class="ckeditor form-control" rows="3" id="intro" name="intro"></textarea>
					</div>
				</div>
				
			
			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">파일첨부(캐러셀)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="carousel" id="carousel" multiple/>
					<img id="carousel_img" src="#" alt="your image" style="width: 100%; display: none;"/>
				</div>
			</div>
			<!-- 파일 업로드 -->
			<div class="form-group">
				<label for="file" class="col-xs-2 control-label">파일첨부(메인)</label>
				<div class="col-xs-10">
					<input type="file" class="form-control" name="main" id="main" multiple/>
					<img id="main_img" src="#" alt="your image" style="width: 320px; height: 220px; display: none;"/>
				</div>
			</div>
			
				<!-- 작가 코멘트 -->

				
				    <div class="form-group">
			      <div class="col-xs-offset-2 col-xs-10">
			        <button type="submit" class="btn btn-success">작품 등록</button>
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

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/assets/js/ckeditor/ckeditor.js"></script>
	</body>
</html>