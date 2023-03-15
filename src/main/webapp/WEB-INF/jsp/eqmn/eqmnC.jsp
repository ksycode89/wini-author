<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	.mainContainerC{
		border: solid;
		width: 1200px;
		height: 500px;
	}
	.forDetail{
		display: flex;
		justify-content: space-around; 
		width: 1100px;
		height: 300px;
		margin-top: 40px;
		
	}
	.datail_div{
			flex-basis: 48%;
			border: solid;
	}
	.for_eqmnM{
		border: solid;
		width: 1000px;
		height: 150px;
	}
</style>
<body>
	<div id='hide_for_id'>
		<input type="hidden" id='forDeleteId' >
		<input type="hidden" id='forEqmn' >
	</div>

	<div class='mainContainerC'>
		<div class='for_eqmnM'>
			<div class='eqmn_search_m'>
				<!-- 선택용 -->			
				<select id='search_menu_select' onchange="mkSearch()">
					<option selected="selected">선택</option>
					<c:forEach var='itme' items='${getListNm }'>
						
						<option value=${itme.upperEqpmnId }>${itme.upperName}</option>
					</c:forEach>
					
				</select>
					
				<select  id='search_menu_selectD'>
					<option selected="selected">선택</option>
				</select>
				<button type="button" onclick="doSearch();">검색</button>
			</div>
			<div style="overflow:auto; width:650px; height:105px;">
				<table border="1" id='eqmn_table' >
					<tr>
						<th class='eqpmnId'>장비번호</th> 
						<th class='eqpmnSn'>장비코드</th> 
						<th class='eqpmnNm'>장비이름</th> 
						<th class='orgnztId'>사용부서</th> 
						<th class='eqpmnModelName'>장비모델</th> 
						<th class='eqpmnPin'>장비식별번호</th> 
					</tr>
					<tr id='emptyEqpmn' style="text-align: center;">
						<td colspan="6">등록된 장비가 없습니다.</td>
					</tr>
				</table>
			</div>
		</div>
		<div class='forDetail'>
			<div class='datail_div'>
			<div>
				<span>점검내역</span>
				<c:if test="${userInfo.rght eq 'Y'}">
				<button type="button" onclick="addEqpmnForm();" class='eqpmnDoF'>등록</button>
				<button type="button" onclick="addEqpmnDo();"  class ='eqpmnDoC' style="display: none" >등록확정</button>
				<button type="button" onclick="addEqpmnCel();" class='eqpmnDoC' style="display: none" >등록취소</button>
				<button type="button" class='eqpmnDel' style="display: none" onclick="eqpmnDel();">삭제</button>
				</c:if>
			</div> 
			<div style="overflow:auto; width:480px; height:250px;" >
				<table border="1" id='eqmn_table_M' >
					<tr>
						<th class='chckSnM'>점검번호</th> 
						<th class='eqpmnSnM'>장비전호</th> 
						<th class='eqpmnSnM'>장비이름</th> 
						<th class='checkDayM'>점검일</th> 
						<th class=frstRegistDt>등록일</th> 
						<th class='frstRegisterSn'>등록자</th> 
					</tr>
					<tr id='emptyEqpmnM' style="text-align: center;">
						<td colspan="6">등록된 점검이 없습니다.</td>
					</tr>
				</table>
			</div>
			</div>
			<div class='datail_div' >
				<div style="overflow:auto; width:550px; height:250px;" id='detail_table'>
					<label for='eqmn_table_D' class='eqmn_table_D'>점검 상세</label>
					<table border="1" id='eqmn_table_D' class='eqmn_table_D'>
						<tr>
							<th class='no'>번호</th> 
							<th class='chckNm'>점검내용</th> 
							<th class='chckResult'>점검결과</th> 
							<th class='frstRegistDt'>등록일</th> 
							<th class='frstRegisterSn'>등록자</th> 
							<th class=chckCn>비고</th> 
						</tr>
						<tr id='emptyEqpmnD' style="text-align: center;">
							<td colspan="6">등록된 점검이 없습니다.</td>
						</tr>
					</table>
					<div id='check_table' style="display: none;">
						<h4>점검목록</h4>
						<label for='eqpmnSn' >장비번호</label>	
						<input id='eqpmnSn' name='eqpmnSn' readonly="readonly"><br>
						<label for='eqpmnNm' >장비이름</label>	
						<input id='eqpmnNm' name='eqpmnNm' readonly="readonly"><br>
						<label for='chckDay'>점검일</label>
						<input type="date" id='chckDay' name = chckDay><br>
						<input type="checkbox" id='eng'>엔진
						<input type="checkbox" id='tire'>타이어
						<input type="checkbox" id='break'>브레이크<br>
						<div>비고</div>
						<textarea rows="6;" cols="40" id='chckCnH'></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(function(){
		//중복 셀렉트 삭제
		removeSelectM();
	});
	
	//중복 셀렉트 삭제
	function removeSelectM(){
		let check ='';
		$('#search_menu_select').children().each((index,val)=>{
			if(check==$(val).val()){
				$(val).remove()
			}
			check=$(val).val();
		})
	}
	function mkSearch(){
		
		//셀렉트된 값으로 data 가져오기		
		  $.ajax({
		  url: './mkSearchAjax.do' // 요청이 전송될 URL 주소
		 ,data : {"upperEqpmnId": $('#search_menu_select option:selected').val()}
		 ,type: 'post' // http 요청 방식 (default: ‘GET’)
		 ,dataType : "json"
		 ,success : function(data){
			 $('#search_menu_selectD option:gt(0)').remove();  
			 console.log( $('#search_menu_selectD').find('optoin'))
			 console.log( $('#search_menu_selectD').find('optoin'))
			//데이터가있으면
			 if(data){
				$(data).each((index,val)=>{
					let op = $('<option>');
					op.text(val.eqpmnNm);
					op.val(val.eqpmnId);
					$('#search_menu_selectD').append(op)
				})
				
			}else{
				$('#search_menu_selectD').empty();
				let op = $('<option>');
				op.text('없음');
				$('#search_menu_selectD').append(op)
			}
		}
		 });
	}
		function doSearch(){
			//검색조건
		let id =$('#search_menu_selectD option:selected').val();
		//해당 테이블 가져오기
			$.ajax({
				  url: './doSearchAjaxC.do' // 요청이 전송될 URL 주소
				 ,data : {"eqpmnSeCode": id}
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,dataType : "json"
				 ,success : function(data){
					 //배열이있으면
					if(data.length >0){
						$('#eqmn_table tr:gt(1)').remove();  
						//장비없음 td 숨기기
						$('#emptyEqpmn').hide();
						//헤드
						let trName = ['eqpmnSn','eqpmnSeCode','eqpmnNm','eqpmnModelName','eqpmnModelName','eqpmnPin'];
						//ㅌㅔ이블 찍기
						mktr(data,'#eqmn_table',trName);
						//없으면 없다고 뜨기
						//디테일지우기
						$('#eqmn_table_D tr:gt(1)').remove();  
						$('#emptyEqpmnD').show();
						//마스터비우기ㅜ
						$('#eqmn_table_M tr:gt(1)').remove();  
						$('#emptyEqpmnM').show();
					}else{
						$('#eqmn_table tr:gt(1)').remove();  
						$('#emptyEqpmn').show();
						//디테일 지우기
						$('#eqmn_table_D tr:gt(1)').remove();  
						$('#emptyEqpmnD').show();
						//마스터 비우기
						$('#eqmn_table_M tr:gt(1)').remove();  
						$('#emptyEqpmnM').show();
					}
				 }
			 }); 
		}
	
		//데이터//넣을 테이블 // 헤더
		function mktr(data,table,trName){
		
			$(data).each((index,val)=>{
				let tr = $('<tr>'); //tr생성
			  //메인테이블일때만 이벤트를 걸어줌
			  if(table=='#eqmn_table'){
				  console.log('do master')
				  $(tr).on('click',function(){ //tr에 클릭이벤트걸기
						let key = $(this).children('.eqpmnSn').text(); //키값가져오기
						//마스터 테이블 불러오기
						CheckMasterAJax(key);
						let sn =$(this).children('.eqpmnSn').text();
						let name =$(this).children('.eqpmnNm').text();
						$('#eqpmnSn').val(sn);
						$('#eqpmnNm').val(name);
						//삭제버튼지우기
						$('.eqpmnDel').hide()
					})
			  }
				//마스터 테이블일때-> 디테일
			  if(table=='#eqmn_table_M'){
				  $(tr).on('click',function(){ //tr에 클릭이벤트걸기
						let key = $(this).children('.chckSn').text(); //키값가져오기
						let nm = $(this).children('.eqpmnSn').text(); //키값가져오기
						//삭제버튼온 등록폼이아닐때만
						if($('.eqpmnDoC').css('display')=="none"){
							$('.eqpmnDel').show()
						}
						
						//삭제용 히든 테이블
						$('#forDeleteId').val(key);
						$('#forEqmn').val(nm);
						$('.eqpmnDel').text(key+'번글 삭제')
						//디테일부르기
						CheckMasterDAJax(key);
					})
			  }
				
					//호버색
					 $(tr).hover(
				        function() {
				            $(tr).css('backgroundColor', '#AFEEEE')
				        },
				        function() {
				        	$(tr).css('backgroundColor', 'transparent')
				        }
				    );
					//클릭유지
					  $(tr).on('click',function(){
						  $(tr).css('backgroundColor', 'red')
						  
					  })
			  //테이블명과 vo의 key로 맵핑시켜서 맞는 열에 값을 넣어줌
			  $(trName).each((index2,val2)=>{
				  let td = $('<td>').text($(val)[0][val2])//tr값입력
				  $(td).attr('class',val2) //class로 vo객체 이름 주기
				  $(tr).append(td) //tr에 td 상속
			  })
				$(table).append(tr);  //table에 tr상속
			})
		}	
		
		//점검 마스터 테이블
		function CheckMasterAJax(id){
			console.log(id)
			$.ajax({
				  url: './CheckMasterAJax.do' // 요청이 전송될 URL 주소
				 ,data : {"eqpmnSn": id}
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,dataType : "json"
				 ,success : function(data){
					 if(data.length >0){
						 console.log(data)
							$('#eqmn_table_M tr:gt(1)').remove();  
							//장비없음 td 숨기기
							$('#emptyEqpmnM').hide();
							//헤드
							let trName = ['chckSn','eqpmnSn','eqpmnNm','chckDay','frstRegistDt','frstRegisterSn'];
							//ㅌㅔ이블 찍기
							mktr(data,'#eqmn_table_M',trName);
							//없으면 없다고 뜨기
							//디테일 지우기
							$('#eqmn_table_D tr:gt(1)').remove();  
							$('#emptyEqpmnD').show();
						}else{
							
							$('#eqmn_table_M tr:gt(1)').remove();  
							$('#emptyEqpmnM').show();
							//디테일 비우기
							$('#eqmn_table_D tr:gt(1)').remove();  
							$('#emptyEqpmnD').show();
						}
				 }
			 }); 
		}
		
		//점검 마스터 디테일 테이블
		function CheckMasterDAJax(id){
			console.log('ddd',id)
			$.ajax({
				  url: './CheckMasterDAJax.do' // 요청이 전송될 URL 주소
				 ,data : {"chckSn": id}
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,dataType : "json"
				 ,success : function(data){
					 console.log(data)
				 if(data== null){
						//없으면 없다고 뜨기
							$('#eqmn_table_D tr:gt(1)').remove();  
							$('#emptyEqpmnD').show();
						}else if(data.length>0){
							console.log(data)
							$('#eqmn_table_D tr:gt(1)').remove();  
							//장비없음 td 숨기기
							$('#emptyEqpmnD').hide();
							//헤드
							let trName = ['rownum','chckNm','chckResult','frstRegistDt','frstRegisterSn','chckCn'];
							//ㅌㅔ이블 찍기
							mktr(data,'#eqmn_table_D',trName);
							
						}else{
							$('#eqmn_table_D tr:gt(1)').remove();  
							$('#emptyEqpmnD').show();
						} 
				 }
			 }); 
		}
		
		//등록폼
		function addEqpmnForm(){
			
			$('.eqpmnDoC').show();
			$('.eqpmnDoF').hide();
			
			//td지우기//key제외
			$('#eqmn_table_D').hide();
			$('.eqmn_table_D').hide();
			
			//테이블시작
			$('#check_table').show();
			//삭제버튼지우귀
			$('.eqpmnDel').hide();
			
			
			
		}
		//등록시작
		function addEqpmnDo(){
			console.log(123)
			//유효성검사
			if(vaild()){
				console.log(123)
			//두개이상의 vo받기 : 실패 추후 다시 시도
				let cvo =  [{"eqpmnSn" : $('#eqpmnSn').val() ,"chckDay": $('#chckDay').val()}]
				let cdvo = 	[{"chckCn" :$('#chckCnH').val()}]
				 //우선 map형식으로 보내기
				let  data1 = {
						    "chckCn" :$('#chckCnH').val()
						 	,"eqpmnSn" : $('#eqpmnSn').val() 
							 ,"chckDay": $('#chckDay').val()
							 ,"end": $('#eng').prop('checked')
							 ,"tire": $('#tire').prop('checked')
							 ,"bre": $('#break').prop('checked')}
				  
				  $.ajax({
					  url: './addEqpmnDo.do' // 요청이 전송될 URL 주소
					 ,data : data1
					 ,type: 'post' // http 요청 방식 (default: ‘GET’)
					 ,dataType : "json"
					 ,success : function(data){
						//화면들 취소
							 addEqpmnCel();
						//마스터 다시부르기
							 CheckMasterAJax(data)
						//버튼
							$('.eqpmnDoC').hide();
							$('.eqpmnDoF').show();
							alert(data+'번 장비 점검등록 완료')
					 }
				 });  
			}
		}
		
		function vaild(){
			if(!$.trim($('#eqpmnSn').val())){
				alert('장비를 선택해주세요');
				return false;
			}
			if(!$.trim($('#chckDay').val())){
				alert('점검일을 선택해주세요');
				return false;
			}
			
			return true;
		}
		
		//등록취소
		function addEqpmnCel(){
			$('.eqpmnDoC').hide();
			$('.eqpmnDoF').show();
			//
			//td지우기//key제외
			$('#eqmn_table_D').show();
			$('.eqmn_table_D').show();
			
			//테이블시작
			$('#check_table').hide();
			//점검목록 비워주기
			$('#check_table input').each((index,val)=>{
				$(val).val('');
				if($(val).prop('type')=='checkbox'){
					$(val).prop('checked',false)
				}
			})
		}
		function eqpmnDel(){
	 		if($('#forDeleteId').val() !=''){
				$.ajax({
					  url: './eqpmnCDDelAjax.do' // 요청이 전송될 URL 주소
					 ,data : {"chckSn": $('#forDeleteId').val()}
					 ,type: 'post' // http 요청 방식 (default: ‘GET’)
					 ,dataType : "json"
					 ,success : function(data){
						
							//삭제버튼지우기
							$('.eqpmnDel').hide()
							//마스터 다시부르기
							 CheckMasterAJax($('#forEqmn').val())
							 $('#forEqmn').val('')
							//다시로딩
							//리셋
							addEqpmnCel()
							 alert(data+"번 점검 삭제완료")
					 }
				 });  
			}
				
		}
	/*  $.ajax({
		  url: './callOneEqmnAjax.do' // 요청이 전송될 URL 주소
		 ,data : {"eqpmnId": eqpmnId}
		 ,type: 'post' // http 요청 방식 (default: ‘GET’)
		 ,dataType : "json"
		 ,success : function(data){}
	 }); 
	*/
	</script>
</body>
</html>