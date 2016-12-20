<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang='ko'>
	<head>
			<jsp:include page="/WEB-INF/views/template/head.jsp"/>
		
		
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<!-- 스타일 sheet -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/mymenu.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/mymenuCommon.css" />
		
		<script type="text/javascript">
		$(function() {
			/** 모든 모달창의 캐시 방지 처리 */
			$('.modal').on('hidden.bs.modal', function (e) {
				// 모달창 내의 내용을 강제로 지움.
	    		$(this).removeData('bs.modal');
			});
			
			$("#pointbtn").click(function(e){
				var memberId=$("#member_id").val();
				if(memberId==0 || memberId==null || memberId ==''){
					var result = confirm("로그인이 필요한 서비스 입니다. 로그인 창으로 이동하시겠습니까?");
					if(result){
						location.replace('/bookStory/login/login.do');
						return false;
					}else{
						return false;
					}
					
				}
			});
		
			//포인트 충전
			$(document).on("submit", "#point_form", function(e) {
			e.preventDefault();
			
			var point = $(":radio[name='point']:checked").val();
			var name = $("#myPointAdd").find("#name").val();
			
			
			$.get("${pageContext.request.contextPath}/mymenu/my_point_oK.do",{point:point, name:name},
					function(data){
							var myPoint = data.curPoint;
							var nickName = data.nickName;
							
							$("#nicKName").html(nickName+" 님");
							
							$("#myPointScore").text(myPoint);
							$("#myPointAdd").modal('hide');
							$("#afterPoint").modal('show');
						});
			});//포인트 충전 끝
			
			
			function centerModal() {
			    $(this).css('display', 'block');
			    var $dialog = $(this).find(".modal-dialog");
			    var offset = ($(window).height() - $dialog.height()) / 2;
			    // Center modal vertically in window
			    $dialog.css("margin-top", offset);
			}

			$('.modal').on('show.bs.modal', centerModal);
			$(window).on("resize", function () {
			    $('.modal:visible').each(centerModal);
			});
			
		});
		</script>		
	</head>
	<body>
	
		<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"/>
	
	<input type="hidden" name="member_id" value="${member_id}" id="member_id">
	<!-- 포인트 충전 모달 -->
	<div id="myPointAdd" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	              <fieldset>
	              <form id="point_form" method="post">
	              
	              <h4 class="modal-title" id="myModalLabel">포인트 충전하기</h4>
	              <div class="modal-body">
	                <div class="section section_id">
						<div class="box1" style="text-align: center">

							<div class="form-group">
								<label for="name" class="col-md-3">이름</label> <input type="text"
									id="name" class="col-md-9" placeholder="본인 이름" />
							</div>
						
							<div class="btn-group btn-group-justified" role="group" aria-label="${pageContext.request.contextPath}.">
							<div class="radioArea">
							    <label for="point" class="col-md-3">충전금액</label>
								<div class="col-md-9">
                                  <label class="radio-inline">
                                    <input type="radio" name="point" id="point1" value="1000"/> 1000point
                                  </label>
                                  <label class="radio-inline">
                                    <input type="radio" name="point" id="point2" value="5000"/> 5000point
                                  </label>
                                  <label class="radio-inline">
                                    <input type="radio" name="point" id="point3" value="10000"/> 10000point
                                  </label>
                                </div>								
							</div>
							</div>
						</div>
					</div>
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-default"  data-dismiss="modal">닫기</button>
	                <button type="submit" class="btn btn-primary" >포인트충전</button>
	              </div>
	              
	              </form>
	              </fieldset>
	            </div>
	          </div>
	        </div>
	      </div>
          <!-- // 포인트 충전 모달 -->
          <!-- 포인트 환불 모달 -->
	<div id="myModal" class="mymodal modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	              <h4 class="modal-title" id="myModalLabel">포인트 환불하기</h4>
	              <div class="modal-body">
	                <div class="section section_id">
						<div class="box1" style="text-align: center">

							<div class="form-group">
								<label for="user_pw" class="col-md-3">비밀번호</label> <input type="password"
									id="user_pw" class="col-md-9" placeholder="비밀번호를 입력하세요." />
							</div>
							
							<div class="form-group">
								<label for="user_number" class="col-md-3">휴대전화</label> <input type="text"
									id="user_number" class="col-md-9" placeholder="가입시 등록했던 전화번호" />
							</div>

						</div>
					</div>
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-default"  data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary" >포인트환불</button>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
          <!-- // 포인트 환불 모달 -->
	
	
	
	<!-- 포인트 충전 후 모달 화면 -->
	
	<div id="afterPoint" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    	<div class="modal-header">
	    		<h3 id="nicKName"></h3><p>충전이 완료 되었습니다. 감사합니다.</p>
	    	</div>
	        <div class="modal-body">
	            <img src="${pageContext.request.contextPath}/assets/imgs/popup/smile.jpeg" class="img-responsive"style="width: 500px; height: 500px;">
	        </div>
	    </div>
	  </div>
	</div>
	
	
			

<!-- 메인 화면 시작 -->
<nav class="navbar navbar-default main_navi main_navi_sub">
  				

    				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table table-striped table-bordered table-hover" id="table">
    						 <thead>
    						 	<tr>
    						 	    <th><a href="${pageContext.request.contextPath}/mymenu/recentepisode_list.do"><span>최근 본 작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/favorite_list.do"><span>관심작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/bookmark_list.do"><span>책갈피</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/purchase_list.do"><span>구매내역</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/my_point.do"><span>내 포인트</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/my_info.do"><span>내정보</span></a></th>

    						 		
    						 	</tr>
    						 </thead>
    						 
    						 </table>
    					
    					
    					
    					
      				
    					</div>
    				</div>
 
			</nav>
			
	<div class="container-point" >
	  <table class="point-table">
	    <thead>
	      <tr>
	        <th><span><a class="point_color1">내 포인트</a></span></th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <th>
	          <span><a class="point_color2" id="myPointScore">${point} POINT</a></span>	          
	   
	          <a data-toggle="modal" href="#myPointAdd" class="btn btn-primary" id="pointbtn">포인트충전</a>
	          <a data-toggle="modal" href=".mymodal" class="btn btn-danger">포인트환불</a>
	      
	        </th>
	      </tr>
	    </tbody>
	  </table>
	      
	</div>	
	
			<!-- 메인 화면 끝 -->
			
			
	<!-- footer -->
		<jsp:include page="/WEB-INF/views/template/footer.jsp"/>

	
	
	</body>
</html>

