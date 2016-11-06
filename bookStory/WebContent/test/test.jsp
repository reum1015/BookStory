<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>

			<!-- 저장시에 사용된 인코딩(파일의 저장 형식) 값을 웹 브라우저에게 알려준다. 
			- ANSI(euc-kr), UTF-8 -->
		<meta charset="utf-8"/>
		<!-- IE의 호환성 보기 모드 금지 -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<!-- 스마트 장치에서의 해상도 균일화 처리 -->
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,
		maximum-scale=1.0,user-scalable=no">
		
		<!-- 모바일 웹 페이지 설정 -->
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/icon/book01.png"/>
		<link rel="apple-touch-icon-precomposed" 
			  href="assets/icon/apple-touch-icon-144-precomposed.png"/>
			  
		<!-- bootstrap -->

		
		<!-- main css -->

		

		
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
			$(function(){
				
				$(".male_button").click(function(){
					$(".main_gender_list_female").css('display','none');
					$(".main_gender_list_male").css('display', 'block');
					$(".male_button").css('background-color','#FFEBCD');
					$(".female_button").css('background-color','#FFF');
				});
				
				$(".female_button").click(function(){
					$(".main_gender_list_female").css('display','block');
					$(".main_gender_list_male").css('display', 'none');
					$(".male_button").css('background-color','#FFF');
					$(".female_button").css('background-color','#FFEBCD');
				});
				
			});
			
			
			
			
			
			
		</script>
		<style type="text/css">
		.icon_bookmark{
			
		
		}
		.check_box_span{
			width: 19px;
    		height: 29px;
    		display: block;
    		background-image: url("icon.png");
			background-position: -60px -290px;
		}
		.book_a{
			display: block;
			width: 19px;
    		height: 29px;
			
		}
		
		body{
			background-color: #FFF;
		}
		
		.button_img_a{
			width: 19px;
    		height: 29px;
    		display: block;
    		background-image: url("icon.png");
			background-position: -60px -290px;
			border: none;
		
		}
		
		.button_img_b{
			display : none;
			width: 19px;
    		height: 29px;
    		display: none;
    		background-image: url("icon.png");
			background-position: -90px -290px;
			border: none;
		
		}
		
		 .tbl {
        table-layout: fixed;
        border-top: 5px solid #333;
        border-collapse: collapse;
        background: #fff;
    } .tbl td {
        border: 1px solid #688;
        padding: 2px 5px;
        overflow: hidden;
        white-space: nowrap;
        text-align: center;
    } .tbl th {
        border-bottom: 1px solid #333;
        padding: 2px 5px;
        overflow: hidden;
        white-space: nowrap;
        background: blue;
    }
		
		</style>
		<script type="text/javascript">
			$(function(){
				$(".button_img_a").click(function(){
					$(".button_img_a").css('display','none');
					$(".button_img_b").css('display','block');
					
				});
				
				$(".button_img_b").click(function(){
					$(".button_img_b").css('display','none');
					$(".button_img_a").css('display','block');
					
				});
			
				firstColumn = $(".firstColumn");
		        maxWidth = 50;
		        
		        // Get width % ratio for min width
		        var c_count = $('tr:first-child').children().size();
		        var w_ratio = (100 / c_count);
		        
		        minWidth = w_ratio;
		        
		        $("tr th").click(function(){
		            $(firstColumn).animate({
		                width: minWidth + "%"
		            }, {
		                queue: false,
		                duration: 900
		            });
		            
		            $(this).animate({
		                width: maxWidth + "%"
		            }, {
		                queue: false,
		                duration: 900
		            });
		            firstColumn = this;
		            
		            // Reset the cell width
		            $('tr:first-child').children().css({
		                'width': w_ratio,
		                'overflow': 'hidden',
		                'white-space': 'nowrap',
		                'text-overflow': 'ellipsis'
		            });
		        });
				
				
				
				
				
				
			});
			
		
		
		
		</script>
		
		
</head>
<body>
	<div class="container">
		<h1>Hello JSP</h1>
		
		<a href="#" class="book_a">
		<span class="check_box_span">
			
			<label class="icon_bookmark"></label>
		</span>
		</a>
		
		
		<button class="button_img_a" name="bookon"></button>
		
		<button class="button_img_b" name="bookoff"></button>
		
		
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	    
	    
	    <table class="tbl" width="100%">
    <tr>
        <th class="firstColumn">
            Cell 1:Heading
        </th>
        <th>
            Cell 2:Long Heading Data
        </th>
        <th>
            Cell 3:Heading
        </th>
        <th>
            Cell 4:Heading
        </th>
        <th>
            Cell 5:Heading
        </th>
        <th>
            Cell 6:Heading
        </th>
        <th>
            Cell 7:Heading
        </th>
        <th>
            Cell 8:Heading
        </th>
        <th>
            Cell 9:Heading
        </th>
        <th>
            Cell 10:Heading
        </th>
        <th>
            Cell 11:Heading
        </th>
        <th>
            Cell 12:Heading
        </th>
        <th>
            Cell 13:Heading
        </th>
        <th>
            Cell 14:Heading
        </th>
        <th>
            Cell 15:Heading
        </th>
        <th>
            Cell 16:Heading
        </th>
        <th>
            Cell 17:Heading
        </th>
        <th>
            Cell 18:Heading
        </th>
    </tr>
    <tr>
        <td>
            Cell 1:Row 1
        </td>
        <td>
            Cell 2:Row 1:Overflowing Data
        </td>
        <td>
            Cell 3:Row 1
        </td>
        <td>
            Cell 4:Row 1
        </td>
        <td>
            Cell 5:Row 1
        </td>
        <td>
            Cell 6:Row 1
        </td>
        <td>
            Cell 7:Row 1
        </td>
        <td>
            Cell 8:Row 1
        </td>
        <td>
            Cell 9:Row 1
        </td>
        <td>
            Cell 10:Row 1
        </td>
        <td>
            Cell 11:Row 1
        </td>
        <td>
            Cell 12:Row 1
        </td>
        <td>
            Cell 13:Row 1
        </td>
        <td>
            Cell 14:Row 1
        </td>
        <td>
            Cell 15:Row 1
        </td>
        <td>
            Cell 16:Row 1
        </td>
        <td>
            Cell 17:Row 1
        </td>
        <td>
            Cell 18:Row 1
        </td>
    </tr>
    <tr>
        <td>
            Cell 1:Row 2
        </td>
        <td>
            Cell 2:Row 2:Overflowing Data
        </td>
        <td>
            Cell 3:Row 2
        </td>
        <td>
            Cell 4:Row 2
        </td>
        <td>
            Cell 5:Row 2
        </td>
        <td>
            Cell 6:Row 2
        </td>
        <td>
            Cell 7:Row 2
        </td>
        <td>
            Cell 8:Row 2
        </td>
        <td>
            Cell 9:Row 2
        </td>
        <td>
            Cell 10:Row 2
        </td>
        <td>
            Cell 11:Row 2
        </td>
        <td>
            Cell 12:Row 2
        </td>
        <td>
            Cell 13:Row 2
        </td>
        <td>
            Cell 14:Row 2
        </td>
        <td>
            Cell 15:Row 2
        </td>
        <td>
            Cell 16:Row 2
        </td>
        <td>
            Cell 17:Row 2
        </td>
        <td>
            Cell 18:Row 2
        </td>
    </tr>
</table>
	    
	    
	</div>
</body>
</html>
