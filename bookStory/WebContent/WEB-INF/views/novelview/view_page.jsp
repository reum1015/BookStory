<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang='ko'>
<head>	
	<jsp:include page="/WEB-INF/views/template/head.jsp"></jsp:include>
	    		
	<script type="text/javascript">
	function open1() {
	    window.open('01-open.jsp');
	    }
	
	</script>
<!-- main css -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/novelview/novel_view.css"/>

</head>
<body>

   <!-- 메인 헤더 -->
	<jsp:include page="/WEB-INF/views/template/head_nav.jsp"></jsp:include>	
   
	<!-- 메인 화면 시작 -->
	
		<div id="container">
			<div class="container view">
				<div class="section_area_viewer">
				
				<!-- title bar -->
				<div id="titlebar_header" class="row col-lg-12" >
				
                <div id="title_title" class="titlebar col-lg-2 col-sm-2">
					<a href="#">소설제목</a>
				</div>
				
				
				<div id="title_list" class="titlebar2 col-lg-7 col-sm-6">
			
			<button type="button" class="prevpage col-lg-1 btn-default">&lt;</button>
				   <div>
				  <select name="novellist" class="novellist col-lg-10 btn-default">
				  <option>제 201화. 이름 없는</option>
				   <option value="title1">소설제목1</option>  
				   <option value="title2">소설제목2</option>
				   <option value="title3">소설제목3</option>
			</select>
				 </div>
			<button type="button" class="nextpage col-lg-1 btn-default">&gt;</button>
				</div>
				
				
				
				
				<div id="title_bookmark" class="titlebar3 col-lg-1 col-sm-1">
					<input type="checkbox" id="bmk" class="bmk">
					<label for="bmk" title="책갈피 추가" class="icon_bookmark2 " id="bookmarkIcon">책갈피</label>
				</div>
				
				
				
				<div id="title_bookmark" class="titlebar4 col-lg-2 col-sm-2">
					<a>보기설정</a>
				</div>				
				
				</div>
				<!-- //title bar -->
				
				<!-- view content -->
				<div class="viewer_container">
				<div class="detail_view_header">
				<h2>18.어렵네 제목
				</h2>
				<span class="date">2016.10.18</span>
				</div>
				
				
				<div class="detail_view_content">
				<p>무엇을 바라고 좋아했던 게 아니다. 

처음 하는 사랑이 그저 좋아서, 내가 그를 사랑한다는 느낌이, 그 사람도 나를 사랑한다는 만족감이 그냥 좋아서, 신기해서.

아주 바보 같을 정도로 순수하게, 과거도 미래도 아닌 현재만 바라보면서 좋아했다.

그 또한 그녀를 아무 조건 없이 좋아해줘서, 그녀도 어떤 사심 없이 그 사랑을 받아들였던 것이다.

그냥 그렇게 함께 있는 시간이 좋았을 뿐이었는데, 그 행복의 대가가 이렇게 가혹할 줄이야.

‘몰랐네. 내가 팜므파탈이었네…….’

이새는 힘없이 하아, 한숨을 내쉬었다. 가뭄처럼 메마른 탄식이었다.

그렇게 태원에게 일방적으로 몰린 후, 집으로 돌아오는 길. 

이새는 며칠 전에 문화센터에서 준서를 잃어버렸던 일이 다시 생각났다. 

그 일이 있은 후 그녀는 지원에게, 자신이 연애에 정신을 홀랑 빼앗겨서 준서를 소홀히 하고 있는 것 같다고 말했었다. 

그는 그녀를 위로했고 사귀는 건 보류하자는 그녀의 말에는 잠시 언성을 높이기도 했다.

작은 갈등이 있었지만, 그 일로 인하여 그의 마음을 다시 한 번 깨닫게 됐다. 

그는 절대, 자신을 놓지 않을 것이다.

생각해보니 그때 그녀가 겪은 트러블은 그가 현재 맞닥뜨린 위기에 비하면 아무것도 아닌 일이었다. 어쨌든 잃어버렸던 준서는 금방 찾았으니까.

지금 그렇게 힘든 상황인데도 그는…… 여태껏 아무 말도 하지 않았다.

바쁜 일이 끝나면 많이 놀아주겠다고 했을 뿐, 연애 핑계는 조금도 대지 않았다. 

‘난 정말 이기적이었구나.’
				</p>					
				</div>				
				</div>
				<!-- // view content -->
								
				<!-- view footer -->
			<div class="viewer_footer">
			
			<!-- 별점주기 -->
			<div id="grade_bar" class="col-lg-12 col-sm-12">
			<div class="star_grade col-lg-3 col-lg-offset-3 col-sm-3 col-sm-offset-3">
			<label for="str" title="별점" class="icon_stargrade"  id="stargradeIcon">별점</label>
			</div>
			
			<div class="col-lg-1 col-sm-1"><a id="currentStarScore" class="CurrentStarScore">9.92</a></div>
			<div class="col-lg-3 col-sm-3"><a class="num" id="currentStarScoreCount">1394명</a></div>
			
			<div class="grade_insert col-lg-3 col-sm-3">
			<button type="button" class="but_grade" onclick="open1(); return false; ">별점주기</button></div>
			
			</div>
			<!-- //별점주기 -->	
				
				<!-- 작가의말 -->
			<div class="author_comment">
				<h4 class="author_comment_title">작가의 말</h4>
				 <p>
				 이것은 마치 오마하 해변 상륙작전 당시, 사방에서 터지는 포화속에 간신히 살아남은 연합군 군인의 모습
				 </p>
				</div>
				<!-- // 작가의말 -->
			</div>
				<!-- // view footer -->
	
	<!-- 
	
		<a href="#" id="previousVolumeBtn" class="lk_story_prev N=a:flt.prev _volumeMove(113897,321)" 
	style="top: 200px; position: absolute; left: -1px;">
			<span class="icon_story_prev"></span>
			<div class="ly_move">
			
		<span class="htxt_story_prev">이전회로 가기</span>
			
			
				<span class="ellipsis">제321화. 흙바닥에 줄을 그어도</span>
			</div>
		</a>
		
	<button type="button" class="nextpage_fix col-lg-1 btn-default">&gt;</button>
	
				 -->
				 
				 		</div>				
			</div>	
			<!-- 댓글 부분  -->	 
			
	
	<div class="container comment_view">
				<div class="section_area_viewer">
			<h4>
				<img
					src="${pageContext.request.contextPath}/assets/imgs/article/coment.png"
					alt="코멘트" class="left-block"> <span class="coment_size">총<strong
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
					<button type="submit" class="btn btn-danger pull-right btn-sm">신고</button>
					<button type="submit" class="btn btn-default pull-right btn-sm">삭제</button>
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
	
	<div class="jb-center">
		<ul class="pagination">
			<li class="disabled"><a href="#"><span
					class="glyphicon glyphicon-chevron-left"></span></a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-chevron-right"></span></a></li>
		</ul>
	</div>
			
			</div>
			
			<!-- // 댓글 부분  끝 -->
			
		</div>
	


	<!-- 메인 화면 끝 -->



	<!-- footer -->
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>
	
</body>
</html>