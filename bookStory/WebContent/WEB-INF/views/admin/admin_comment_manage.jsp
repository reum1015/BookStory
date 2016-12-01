<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
	<head>
		<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	   
		<!-- admin css -->
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/admin.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/admin/dataTables.bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/adminCommon.css"/>
		
	<script type="text/javascript">
	$(document).ready(function(){
		$("#mytable #checkall").click(function () {
		        if ($("#mytable #checkall").is(':checked')) {
		            $("#mytable input[type=checkbox]").each(function () {
		                $(this).prop("checked", true);
		            });

		        } else {
		            $("#mytable input[type=checkbox]").each(function () {
		                $(this).prop("checked", false);
		            });
		        }
		    });
		    
		    $("[data-toggle=tooltip]").tooltip();
		    
		    $('#example').DataTable();
		    
		 	$('.reply_content').mouseenter(function(){
	    		$(this).attr('class','reply_content_view');
	    
	   			 });
	   		 $('.reply_content').mouseleave(function(){
    			$(this).attr('class','reply_content');
	   		 });
		    
		    
		    
		});
	</script>

	</head>
	<body>

	<!-- 메인 헤더 -->
		<!-- 메인 헤더 -->
		<header class="main_header clearfix page-header hidden-xs">
			
			<!-- 메인 wrapper div -->
			<div class="container clearfix main_header_wrapperdiv">
				
				<!-- 메인 헤더 로그인 회원가입 화면-->
				     <ul class="nav navbar-nav navbar-right hidden-xs">
				        <li><a href="${pageContext.request.contextPath}/login/sign_up_agree.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
				        <li><a href="${pageContext.request.contextPath}/login/login.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
   					</ul>
				
				<!-- 메인 헤더 이미지 -->
				<div class="container main_header_image">
					<h1 class="main_h1">
						<a href="${pageContext.request.contextPath}/index.do" id="main_image_link"></a>
					</h1>
					<p class="sr-only">북스토리 메인 헤더영역</p>
				</div>
				
			</div>
			<div id="top_mar"></div>
			
			
					
		</header>
	
		<!-- 네비게이션 바 (메뉴 영역) -->
			<nav class="navbar navbar-default main_navi">
  				<div class="container">
    				<div class="navbar-header clearfix">   
				      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				        <span class="icon-bar"></span>
				      </button>
     				<a href="${pageContext.request.contextPath}/index.do" class="navbar-brand bookstoryhome">BookStory</a>
    			</div>
    				<div class="container">
    					<div class="collapse navbar-collapse" id="myNavbar">
      						<ul class="nav navbar-nav">
						        <li class="todayNovel"><a href="${pageContext.request.contextPath}/todaynovel/today_novel.do">TodayNovel</a></li>
						        <li class="novelList"><a href="${pageContext.request.contextPath}/novellist/novel_list.do">NoveList</a></li>
						        <li class="community"><a href="${pageContext.request.contextPath}/community/article_list.do">Community</a></li>
						        <li class="mymenu"><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.do">MyMenu</a></li>
       							<li class="main_admin"><a href="${pageContext.request.contextPath}/admin/admin_main.do" class="main_navi_admin active">administrator</a></li>
        						<li><a href="#" class="visible-xs signup_icon"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        						<li><a href="#" class="visible-xs login_icon"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       							<li>
				        			<form class="navbar-form navbar-left pull-left search_form visible-xs" role="search">
							        	<fieldset>
							        	<div class="input-group form-group">
							        		
								        		<label class="sr-only" for="total_search">통합검색</label>
								          		<input type="text" class="form-control" placeholder="통합검색" id="total_search">
								        	
								          		<span class="input-group-btn">
								          			<button type="submit" class="btn btn-default">검색</button>
												</span>		          	
							          		
							          	</div>
							        	</fieldset>
							      	</form>
        
        						</li>
     					</ul>
 
	    	  		<div class="main_login">
						<form class="navbar-form navbar-left pull-right hidden-xs form-inline" role="search">
				        	<fieldset>
				        	<div class="input-group input-group-sm">
				          		<input type="text" class="form-control" placeholder="통합검색">
				        		<span class="input-group-btn"> <button type="submit" class="btn btn-default">검색</button></span>
				        	</div>
				        	</fieldset>
				      	</form>
					</div>
      
    </div>
    </div>
  </div>
</nav>	


	
						<nav class="navbar navbar-default main_navi main_navi_sub visible-xs">
  							<div class="container main_navi_sub_list">
    							<div class="" id="myNavbar_sub">
		      						<ul class="nav navbar-nav">
								        <li><a href="${pageContext.request.contextPath}/admin/adminUserInfo.do">회원 관리</a></li>
								        <li><a href="${pageContext.request.contextPath}/admin/replyManage.do">게시글 댓글 관리</a></li>
								        <li><a href="${pageContext.request.contextPath}/admin/articleUpload.do">작품 올리기</a></li>
		     						</ul>
	    						</div>
    						</div>
					</nav>	

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
	    					<li><a href="${pageContext.request.contextPath}/admin/notice_upload.do">공지 사항 업로드</a></li>
	    					<li><a href="${pageContext.request.contextPath}/admin/novel_upload.do">신규 작품 업로드</a></li>
	    					<li><a href="${pageContext.request.contextPath}/admin/episode_upload.do">에피소드 업로드</a></li>
	    				</ul>
	    			</li>	
					
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/article_manage.do">
	    			<span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>게시물 관리</a></li>
	    			<li class="search_list"><a href="${pageContext.request.contextPath}/admin/comment_manage.do">
	    			<span class="glyphicon glyphicon-sunglasses pull-left icon_color" aria-hidden="true"></span>댓글 관리</a></li>
	    		</ul>
    	</div>
    	<!-- //어드민 슬라이드 메뉴 영역 -->
    	
    	<!-- 어드민 컨텐트 영역 -->
    	<div class="col-md-10 admin_content">
			<div class="replymanage_container">
				<h1 class="page-header">댓글 관리</h1>
				<ul class="list-group">
				<li class="list-group-item">
						<div class="row">
							
							<div class="col-xs-2 reply_name">홍금보</div>
							<div class="col-xs-2 reply_id">화소도(dwis*****)</div>
							<div class="col-xs-4 reply_reason">음란성 또는 청소년에게 부적합한 내용</div>
							<div class="col-xs-2 reply_date">2016-04-15 11:46 </div>
							
							<div class="col-xs-2 reply_button_group">
								<div class="reply_button_group pull-right">
									<p data-placement="top" data-toggle="tooltip" title="edit" class="cancel_button">
									<button class="btn btn-success btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-edit"></span></button>
									</p>
									<p data-placement="top" data-toggle="tooltip" title="Delete" class="delete_button">
									<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-trash"></span></button>
									</p>
								</div>
							</div>
						</div>	
						<div class="row">	
								<div class="reply_content">리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
										리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라와 
									    이 소설 진짜 갈 수록 재밌네요 처음엔 성녀의 취직관련 발언이 되게 거슬렸었는데 이젠 그 거슬림을 
									    거뜬히 무시할 정도로 재밌어요 작가님 제가 결재를 하게 만들다니 대박이에요b 흥하세요~!					
								</div>
						</div>
					</li>
					
				<li class="list-group-item">
						<div class="row">
							
							<div class="col-xs-2 reply_name">유덕화</div>
							<div class="col-xs-2 reply_id">화소도(dwis*****)</div>
							<div class="col-xs-4 reply_reason">음란성 또는 청소년에게 부적합한 내용</div>
							<div class="col-xs-2 reply_date">2016-04-15 11:46 </div>
							
							<div class="col-xs-2 reply_button_group">
								<div class="reply_button_group pull-right">
									<p data-placement="top" data-toggle="tooltip" title="edit" class="cancel_button">
									<button class="btn btn-success btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-edit"></span></button>
									</p>
									<p data-placement="top" data-toggle="tooltip" title="Delete" class="delete_button">
									<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-trash"></span></button>
									</p>
								</div>
							</div>
						</div>	
						<div class="row">	
								<span class="reply_content">
									그냥 리라야, 너의 삶으로 돌아가 돈은 사람을 외롭게한다 오늘도 우리는
								</span>
						</div>
					</li>
				
					
					<li class="list-group-item">
						<div class="row">
							
							<div class="col-xs-2 reply_name">왕조현</div>
							<div class="col-xs-2 reply_id">호둣골살다(kris****)</div>
							<div class="col-xs-4 reply_reason">음란성 또는 청소년에게 부적합한 내용</div>
							<div class="col-xs-2 reply_date">2016-04-15 11:46 </div>
							
							<div class="col-xs-2 reply_button_group">
								<div class="reply_button_group pull-right">
									<p data-placement="top" data-toggle="tooltip" title="edit" class="cancel_button">
									<button class="btn btn-success btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-edit"></span></button>
									</p>
									<p data-placement="top" data-toggle="tooltip" title="Delete" class="delete_button">
									<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-trash"></span></button>
									</p>
								</div>
							</div>
						</div>	
						<div class="row">	
								<span class="reply_content">다희는 버려진 아픔.
										윤호는 잘 못 잉태되어 냉대 속에 성장한 아픔.
										상처를 가진 두 사람이.
										서로를 잘 보듬어주며 사랑하면 좋겠어요. ~~~♡
								</span>
						</div>
					</li>
					
					<li class="list-group-item">
						<div class="row">
							
							<div class="col-xs-2 reply_name">금성무</div>
							<div class="col-xs-2 reply_id">화소도(dwis*****)</div>
							<div class="col-xs-4 reply_reason">음란성 또는 청소년에게 부적합한 내용</div>
							<div class="col-xs-2 reply_date">2016-04-15 11:46 </div>
							
							<div class="col-xs-2 reply_button_group">
								<div class="reply_button_group pull-right">
									<p data-placement="top" data-toggle="tooltip" title="edit" class="cancel_button">
									<button class="btn btn-success btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-edit"></span></button>
									</p>
									<p data-placement="top" data-toggle="tooltip" title="Delete" class="delete_button">
									<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-trash"></span></button>
									</p>
								</div>
							</div>
						</div>	
						<div class="row">	
								<span class="reply_content">리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
								</span>
						</div>
					</li>
					
					<li class="list-group-item">
						<div class="row">
							
							<div class="col-xs-2 reply_name">알란탐</div>
							<div class="col-xs-2 reply_id">화소도(dwis*****)</div>
							<div class="col-xs-4 reply_reason">음란성 또는 청소년에게 부적합한 내용</div>
							<div class="col-xs-2 reply_date">2016-04-15 11:46 </div>
							
							<div class="col-xs-2 reply_button_group">
								<div class="reply_button_group pull-right">
									<p data-placement="top" data-toggle="tooltip" title="edit" class="cancel_button">
									<button class="btn btn-success btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-edit"></span></button>
									</p>
									<p data-placement="top" data-toggle="tooltip" title="Delete" class="delete_button">
									<button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" >
									<span class="glyphicon glyphicon-trash"></span></button>
									</p>
								</div>
							</div>
						</div>	
						<div class="row">	
								<span class="reply_content">리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라
									    리라가 저기서 잘 대처해야할 거 같은데요 너무 화려함에 치중중하네요 어쩌구 저쩌구 욜라욜라와 
									    이 소설 진짜 갈 수록 재밌네요 처음엔 성녀의 취직관련 발언이 되게 거슬렸었는데 이젠 그 거슬림을 
									    거뜬히 무시할 정도로 재밌어요 작가님 제가 결재를 하게 만들다니 대박이에요b 흥하세요~!
								</span>
						</div>
					</li>
				
				
				
				
					 
				</ul><!-- end list-group -->
				<div class="page-nation text-center">
							<div class=" reply_damin_pagenation">
                                        <ul class="pagination pagination-large">
	                                        <li class="disabled"><span></span></li>
	                                        <li class="active"><span>1</span></li>
	                                        <li><a href="#">2</a></li>
	                                        <li><a href="#">3</a></li>
	                                        <li><a href="#">4</a></li>
	                                       <li class="disabled"><span>></span></li>
                
                                     </ul>
                                 </div>
                            </div>
				
			
				</div><!--end admin_userInfo_container -->
		
			</div><!-- admin content end -->
		
		</div><!-- //end row -->
	
	</div>	<!--end container main_container -->

	
	
	
	
			<!-- 메인 화면 끝 -->
			
<!-- 모달 시작 -->
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
        <input class="form-control " type="text" placeholder="Mohsin">
        </div>
        <div class="form-group">
        
        <input class="form-control " type="text" placeholder="Irshad">
        </div>
        <div class="form-group">
        <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
    
        
        </div>
      </div>
          <div class="modal-footer ">
        <button type="button" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">댓글 블라인드</h4>
      </div>
          <div class="modal-body">
       
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> 이글을 정말 블라인드 하시겠습니까?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>			
	
	<!-- footer -->
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/assets/js/admin/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/admin/dataTables.bootstrap.min.js"></script>
	</body>
</html>