<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- header -->
	<div class="modal-header">
		<!-- 닫기(x) 버튼 -->
			<button type="button" class="close" data-dismiss="modal">×</button>
				<!-- header title -->
			<h4 class="modal-title">책 전체 구입</h4>
	</div>
	
	<c:choose>
		<c:when test="${isBuyAllBook==false}">
			<div class="modal-body">포인트 충전이 필요합니다.</div>
				<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
			</div>
		</c:when>
		
		<c:otherwise>
			<div class="modal-body">
			
				 <p>모든 에피소드를 구입 하시겠습니까?</p>
				<form id="allBuyBookForm" action="${pageContext.request.contextPath}/book/totalBuyBookOk.do" method="post">
					<input type="hidden" value="${memberPoint }" id="memberPoint" name="memberPoint">
					<input type="hidden" value="${totalBuyPointFromBook }" id="totalBuyPointFromBook" name="totalBuyPointFromBook">
					<input type="hidden" value="${book_id }" id="book_id" name="book_id">
					
					<div class="modal-footer">
					<button type="submit" class="btn btn-warning">구입</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>	
		</c:otherwise>
	</c:choose>
	

	<!-- body -->
	
	<!-- Footer -->
