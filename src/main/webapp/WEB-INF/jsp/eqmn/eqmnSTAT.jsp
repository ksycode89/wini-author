<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a>장비통계 페이지입니다.</a>
	<table style = "margin-left: 20px;">
		<tr>
			<th>장비명</th>
			<td>
				<select id="eqmn_selectBox" style = "width: 300px; height: 50px; font-size: 20px; margin-left: 20px;"></select>
			</td>
<!-- 			<th>조회기간</th> -->
			<td>
				<button onclick="getStat()">조회</button>
			</td>
<!-- 			<td> -->
<!-- 				<button>1개월</button> -->
<!-- 			</td> -->
<!-- 			<td> -->
<!-- 				<button>3개월</button> -->
<!-- 			</td> -->
		</tr>
	</table>
	
   <div style = "width: 90%;
    		margin: 10px auto;">
        <div id="stat_1" style = "float: left;
								    width:10%;">
        	<select id="stat_selectBox" style = "width: 200px; height: 50px; font-size: 20px;">
				<option value="">전체</option>
			    <option value="M">엔진</option>
			    <option value="W">타이어</option>
			    <option value="W">브레이크</option>
			</select>
		</div>
        <div id = "stat_main" style = "border: 1px solid gray; float: right; width:80%; height:30vh"></div>
    </div>
    
    
	<!-- div 구분을 위한 div태그 -->
	<div style="clear:both; height:50px;"></div>
		

<script>
	$(function() {
		console.log("aaaa");
		getEqmnList();
	});
	function getEqmnList(){
		$.ajax({
			type : 'post',
			url : 'getEqmentList.do',
			success:function(data){
				// 등록 리스트 select 생성
				var html = '';
				for (var i=0; i<data.length; i++){
					html += '<option value='+data[i].eqpmnSn+'>'+
								data[i].eqpmnNm+'/'+data[i].eqpmnPin+'-'+
								data[i].orgnztId+'</option>'
				}
				$("#eqmn_selectBox").append(html);
			},
			error:function(err){
				console.log("err : ",err);
			}
		});
	}
	function getStat(){
		var chckSn = $("#eqmn_selectBox option:selected").val()
		console.log(chckSn);
		$.ajax({
			type : 'post',
			url : 'getStat.do',
			data : {chckSn : chckSn},
			success:function(data){
				console.log(data);
				console.log(data.data);
				var html = '<div style=" border: 1px solid gray; margin: 10px 10px 10px 10px;">';
				html += '<table style=" border: 1px solid gray;"><thead>';
				var cnt = 0;
				for (var i=0; i<data.data.length; i++){
					if (cnt == 0){
						html += '<tr><th>'+data.data[i].chckNm+'</th>';
					}
					if(data.data[i].chckNm == '날짜'){
						html += '<td>'+data.data[i].chckDay+'</td>';
						cnt+=1;
					}else{
						html += '<td>'+data.data[i].chckResult+'</td>'
						cnt+=1;
					}
					if (cnt >= data.cnt){
						html += '</tr>';
						cnt =0;
					}
				}
				html += '</tbody></table>';
				html += '</div>';
				var html2='<div style=" border: 1px solid gray; margin: 10px 10px 10px 10px;">';
				for (var i=0; i<data.chckResult.length; i++){
					html2 += '<a>'+data.chckResult[i].chckNm+' : '+data.chckResult[i].chckResult+' / '+data.cnt+'</a><br>'
				}
				html2 += '</div>';
				$("#stat_main").html(html);
				$("#stat_main").append(html2)
				
			},
			error:function(err){
				console.log("err : ",err);
			}
		});
	}
</script>
</body>
</html>