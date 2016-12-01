<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
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
	href="${pageContext.request.contextPath}/assets/css/article/articleRead.css" />

</head>
<body>
	<!-- 게시판 영역 -->
	<div class="container main_container">
		<div class="Article_size">
			<div class="left-block">
				<img src="${pageContext.request.contextPath}/assets/imgs/article/FreeArticle1.png" alt="자유게시판"
					class="img-rounded left-block">
			</div>
			<section>
  <!-- 제목, 작성자, 작성일시, 조회수 -->
  <div class="alert alert-info">
    <h3 style="margin: 0">
      ${readArticle.subject}<br/>
      <small>
        작성자 : ${readArticle.member_id} / 조회수 : ${readArticle.hit} / 작성일시 : ${readArticle.reg_date}
      </small>
    </h3>
  </div>
    <!-- 내용 -->
  <section style="padding: 0 10px 20px 10px">
    ${readArticle.content}
  </section>
  <!-- 다음글/이전글 -->
  <table class="table table-bordered">
    <tbody>
      <tr>
        <th class="success" style="width: 100px">다음글</th>
        <td>
          <c:choose>
            <c:when test="${nextArticle != null}">
              <c:url var="nextUrl" value="/community/article_read.do">
                <c:param name="article_id" value="${nextArticle.id}"/>
              </c:url>
              <a href="${nextUrl}">${nextArticle.subject}</a>
            </c:when>
            <c:otherwise>
                     다음글이 없습니다.
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
      <tr>
        <th class="success" style="width: 100px">이전글</th>
        <td>
          <c:choose>
            <c:when test="${prevArticle != null}">
              <c:url var="prevUrl" value="/community/article_read.do">
                <c:param name="article_id" value="${prevArticle.id}"/>
              </c:url>
              <a href="${prevUrl}">${prevArticle.subject}</a>
            </c:when>
            <c:otherwise>
                     이전글이 없습니다.
            </c:otherwise>
          </c:choose>
        </td>
      </tr>
    </tbody>
  </table>
  <!-- 버튼들 : category값에 대한 상태유지 필요함 -->
  <div class="clearfix">
    <div class="pull-right">
      <a href="${pageContext.request.contextPath}/community/article_list.do?category=${category}" class="btn btn-info">목록보기</a>
      <a href="${pageContext.request.contextPath}/community/article_write.do?category=${category}" class="btn btn-primary">글쓰기</a>
      <!-- 수정, 삭제 대상을 지정하기 위해서 글 번호가 전달되어야 한다. -->
      <a href="${pageContext.request.contextPath}/community/article_edit.do?category=${category}&article_id=${readArticle.id}" class="btn btn-warning">수정하기</a>
      <a href="${pageContext.request.contextPath}/community/article_delete.do?category=${category}&article_id=${readArticle.id}" class="btn btn-danger">삭제하기</a>
    </div>
  </div>
  
  
				<!-- 덧글 내용 -->
				<div>
					<h4>
						<img src="${pageContext.request.contextPath}/assets/imgs/article/coment.png" alt="코멘트"
							class="left-block"> <span class="coment_size">총<strong
							class="coment_color">1개</strong>의 코멘트가 있습니다.
						</span>
					</h4>
					<hr />
					<ul class="list-inline">
						<li class="coment_li">
							<div class="coment_div pull-left">
								<span class="nic1">닉네임&nbsp&nbsp&nbsp&nbsp<span
									class="nic2">2016.06.15</span></span>
								<p>코멘트 내용</p>
							</div>
							<button type="submit" class="btn btn-danger pull-right btn-sm"
								data-toggle="modal" data-target="#reply_toadmin">신고</button>
						</li>
					</ul>
					<!-- 덧글 입력 -->
					<div class="write">
						<form class="form-group row">
							<textarea class="form-control col-xs-9 col-sm-9" rows="3"></textarea>
							<button type="submit"
								class="btn btn-primary col-xs-3 col-sm-3 pull-right">등록하기</button>
						</form>
					</div>
				</div>
			</section>
		</div>

		<!-- 게시글 신고 모달 -->
		<div class="modal fade" id="article_toadmin" tabindex="-1"
			role="dialog" aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">게시글 신고</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> 이 게시글을
							신고하시겠습니까?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>



		<!--덧글 신고 모달 -->
		<div class="modal fade" id="reply_toadmin" tabindex="-1" role="dialog"
			aria-labelledby="edit" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						</button>
						<h4 class="modal-title custom_align" id="Heading">덧글 신고</h4>
					</div>
					<div class="modal-body">

						<div class="alert alert-danger">
							<span class="glyphicon glyphicon-warning-sign"></span> 이 덧글을
							신고하시겠습니까?
						</div>

					</div>
					<div class="modal-footer ">
						<button type="button" class="btn btn-success">
							<span class="glyphicon glyphicon-ok-sign"></span> Yes
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span> No
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>


	</div>

	<!-- footer -->
	
	<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

</body>
</html>