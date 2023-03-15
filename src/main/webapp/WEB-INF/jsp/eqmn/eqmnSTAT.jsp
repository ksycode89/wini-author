<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id = "main">
  
	<div style="overflow:auto; width:45%; height:400px; border:2px solid; float:left; margin-left:3%">
		<div style = "border :1px solid;"> 
			<h3>등록 장비 현황</h3>
			<select id="eqmn_selectBox" style = "width: 200px; height: 50px; font-size: 20px;" onchange="eqmnChange();">
			</select>
		</div>
		<div>
			<table border="1" style ="width:70%;">
				<colgroup>
					<col width="20%"/>
					<col width="30%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th>분류</th>
						<th>장비이름</th>
						<th>등록현황</th>
					</tr>
				</thead>
				<tbody id = "eqmnList">
				</tbody>
			</table>
		</div>
	</div>
		
	<div style="overflow:auto; width:45%; height:400px; border:2px solid; float:Right;margin-right:3%">
		<div style = "border :1px solid;"> 
			<h3>등록 상세 현황</h3>
		</div>
		<div id = "userList">
			<table border="1" style ="width:100%;">
				<colgroup>
					<col width="10%"/>
					<col width="10%" />
					<col width="15%" />
					<col width="15%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th>분류</th>
						<th>장비번호</th>
						<th>장비이름</th>
						<th>등록부서</th>
						<th>식별번호</th>
						<th>구입일</th>
					</tr>
				</thead>
				<tbody id = "eqmnListD">
				</tbody>
			</table>
		</div>
	</div>
	
<!-- 	<table style = "margin-left: 20px;"> -->
<!-- 		<tr> -->
<!-- 			<th>장비명</th> -->
<!-- 			<td> -->
<!-- 				<select id="eqmnD_selectBox" style = "width: 300px; height: 50px; font-size: 20px; margin-left: 20px;" onchange="eqmnChange();"></select> -->
<!-- 			</td> -->
<!-- 			<td> -->
<!-- 				<button onclick="getStat()">조회</button> -->
<!-- 			</td> -->
<!-- 			<td> -->
<!-- 				<button>1개월</button> -->
<!-- 			</td> -->
<!-- 			<td> -->
<!-- 				<button>3개월</button> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
	
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
	var eqpmnList = {};
	var eqpnmListD = {};
	$(function() {
		getEqmnList();
	});
	function getEqmnList(){
		$.ajax({
			type : 'post',
			url : 'getEqmentList.do',
			data : {chk : "1"},
			success:function(data){
				// 등록 리스트 select 생성
				var html = '<option value="empty">선택해주세요</option>';
				for (var i=0; i<data.length; i++){
					html += '<option value='+data[i].eqpmnId+'>'+
								data[i].eqpmnNm+'</option>'
				}
				$("#eqmn_selectBox").html(html);
			},
			error:function(err){
				console.log("err : ",err);
			}
		});
	}
	function eqmnChange(){
		var chckId = $("#eqmn_selectBox option:selected").val()
		$("#eqmnList").html("");
		$("#eqmnListD").html("");
		$("#stat_main").html("");
		if(chckId =="empty"){
			// html 삭제
		}else{
			// ajax
			$.ajax({
				type : 'post',
				url : 'getEqmentList.do',
				data : {chk : "2", eqpmnId : chckId},
				success:function(data){
					// 등록 리스트 select 생성
					eqpmnList = data;
					var html = '';
					for (var i=0; i<data.length; i++){
						html +='<tr id = "eqpmn_'+i+'" '+ 'onclick="geteqmnD('+i+');">';
						html += '<td>'+data[i].id+'</td>';
						html += '<td>'+data[i].eqpmnNm+'</td>';
						html += '<td>개수</td>';
						html += '</tr>';
					}
					$("#eqmnList").html(html);
				},
				error:function(err){
					console.log("err : ",err);
				}
			});
		}
	}
	function geteqmnD(index){
		$("#stat_main").html("");
		for (i=0; i<eqpmnList.length; i++){
			// 전체 항목 색깔 초기화
			$('#eqpmn_'+i).removeAttr("style");	
		}
		// 항목 선택시 색깔 변경
		$('#eqpmn_'+index).css('background-color','slategray');
		console.log(index);
		console.log(eqpmnList[index].eqpmnId);
		// ajax
		$.ajax({
			type : 'post',
			url : 'getEqmentList.do',
			data : {chk : "3", eqpmnId : eqpmnList[index].eqpmnId},
			success:function(data){
				eqpmnListD = data;
				// 등록 리스트 select 생성
				var html = '';
				for (var i=0; i<data.length; i++){
					console.log(data[i]);
					html +='<tr id = "eqpmnD_'+i+'" '+ 'onclick="getStat('+data[i].eqpmnSn+','+i+');">';
					html += '<td>'+eqpmnList[index].eqpmnNm+'</td>';
					html += '<td>'+data[i].eqpmnSn+'</td>';
					html += '<td>'+data[i].eqpmnNm+'</td>';
					html += '<td>'+data[i].orgnztId+'</td>';
					html += '<td>'+data[i].eqpmnPin+'</td>';
					html += '<td>'+data[i].buyDay+'</td>';
					html += '</tr>';
				}
				$("#eqmnListD").html(html);
			},
			error:function(err){
				console.log("err : ",err);
			}
		});
		
		
	}
	function getStat(chckSn,index){
		console.log(chckSn);
		for (i=0; i<eqpmnListD.length; i++){
			// 전체 항목 색깔 초기화
			$('#eqpmnD_'+i).removeAttr("style");	
		}
		// 항목 선택시 색깔 변경
		$('#eqpmnD_'+index).css('background-color','slategray');
		$.ajax({
			type : 'post',
			url : 'getStat.do',
			data : {chckSn : chckSn},
			success:function(data){
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