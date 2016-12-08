<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html lang='ko'>
	<head>
			<jsp:include page="/WEB-INF/views/template/head.jsp"/>
		
		<!-- 스타일 sheet -->
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mymenu/mymenu.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/naviStateColor/mymenuCommon.css" />
		
	</head>
	<body>
	
		<!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"/>
	
	<!-- 포인트 충전 모달 -->
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	        <div class="modal-dialog">
	          <div class="modal-content">
	            <div class="modal-header">
	              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	              <h4 class="modal-title" id="myModalLabel">포인트 충전하기</h4>
	              <div class="modal-body">
	                <div class="section section_id">
						<div class="box1" style="text-align: center">

							<div class="form-group">
								<label for="user_name" class="col-md-3">이름</label> <input type="text"
									id="user_name" class="col-md-9" placeholder="본인 이름" />
							</div>
							
							<div class="form-group">
								<label for="user_number" class="col-md-3">휴대전화</label> <input type="text"
									id="user_number" class="col-md-9" placeholder="가입시 등록했던 전화번호" />
							</div>
							
							<div class="radioArea">
							    <label for="point" class="col-md-3">충전금액</label>
								<div class="col-md-9">
                                  <label class="radio-inline">
                                    <input type="radio" name="point" id="point1" value="1"/> 1000point
                                  </label>
                                  <label class="radio-inline">
                                    <input type="radio" name="point" id="point2" value="2"/> 5000point
                                  </label>
                                  <label class="radio-inline">
                                    <input type="radio" name="point" id="point3" value="3"/> 10000point
                                  </label>
                                </div>
								
							</div>

						</div>
					</div>
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-default"  data-dismiss="modal">닫기</button>
	                <button type="button" class="btn btn-primary" >포인트충전</button>
	              </div>
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
	
			

<!-- 메인 화면 시작 -->
<nav class="navbar navbar-default main_navi main_navi_sub">
  				

    				<div class="container main_navi_sub_list">
    					<div class="table-responsive" id="myNavbar_sub">
    						 <table class="table table-striped table-bordered table-hover" id="table">
    						 <thead>
    						 	<tr>
    						 	    <th><a href="${pageContext.request.contextPath}/mymenu/recent_novel_list.do"><span>최근 본 작품</span></a></th>
    						 		<th><a href="${pageContext.request.contextPath}/mymenu/favor_novel_list.do"><span>관심작품</span></a></th>
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
	<div class="container" id="content">
	  <table class="point-table">
	    <thead>
	      <tr>
	        <th><span>내 포인트</span></th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <th>
	          <span>0 POINT</span>
	          <a data-toggle="modal" href="#myModal" class="btn btn-primary">포인트충전</a>
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

