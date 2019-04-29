<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>팀 선택</title>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<style type="text/css">
	#result{
		width: 100%;
		height: 100%;
	}
	.ima{
		width: 98%;
	}
	.hoverE{
		box-shadow: 1px 6px 10px 1px rgba(0,0,0,.16);
	}
	.hoverE:active {
	    background-color: black;
	}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var d = new Date();
	var todayday = d.getDay();		//일:0 월:1 화:2 수:3 목:4 금:5 토:6
	//todayday = 3;	//(테스트용)
	if(todayday=="1"){	//월		
		$("#result").css("display", "none");
		$("#monday").css("display", "block");
	}
	
	$("table.today td").on("click", function(){		
		var choice = $(this);
		var team = choice.text();

		$.ajax({
			type: "get",
			url: "today_opposing.jsp",
			data: {
				team: team,
				todayday: todayday
			},
			dataType: "text",
			success: function( responseData, status , xhr ){
				var res = responseData;
				//console.log(res);
				$("#result").html(res);
			},
			error:function(xhr, status, error){
				console.log(error);
			}
		});		
		
	});

	$("table.today td").hover(
			function() {
			  $( this ).addClass("hoverE");
			}, function() {
			  $( this ).removeClass("hoverE");
			}
	);
});
</script>
</head>
<body>
<div id="result">
<table class="today " style="background-color: white;" width="100%">
	<tr>
		<td width="33%"><h5 style="display: none;">두산</h5><img src="/baseball/images/DOOSAN_emblem.jpg" class="ima"></td>
		<td width="33%"><h5 style="display: none;">NC</h5><img src="/baseball/images/NC_emblem.png" class="ima"></td>
		<td width="33%"><h5 style="display: none;">넥센</h5><img src="/baseball/images/NEXEN_emblem.jpg" class="ima"></td>
	</tr>
	<tr>
		<td><h5 style="display: none;">LG</h5><img src="/baseball/images/LG_emblem.jpg" class="ima"></td>
		<td><h5 style="display: none;">KIA</h5><img src="/baseball/images/KIA_emblem.jpg" class="ima"></td>
		<td><h5 style="display: none;">SK</h5><img src="/baseball/images/SK_emblem.gif" class="ima"></td>
	</tr>
	<tr>
		<td><h5 style="display: none;">한화</h5><img src="/baseball/images/HANWHA_emblem.jpg" class="ima"></td>
		<td><h5 style="display: none;">삼성</h5><img src="/baseball/images/SAMSUNG_emblem.jpg" class="ima"></td>
		<td><h5 style="display: none;">KT</h5><img src="/baseball/images/KT_emblem.jpg" class="ima"></td>
	</tr>
</table>
</div>
<div id="monday" style="display: none; background-color: blue;">
오늘은 월요일 야구 쉬는 날!
</div>
</body>
</html>