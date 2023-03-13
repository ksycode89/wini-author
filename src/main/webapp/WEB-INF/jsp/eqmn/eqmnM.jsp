<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}/js/common/jquery1.9/jquery-1.9.1.js"/>"></script>
</head>
<body>
<!-- 메인 테이블 시작 -->
	<div id='hiddenInfo'>
		<input type="hidden" id='eqpmnSnHd'>
		<input type="hidden" id=''>
		<input type="hidden" id=''>
	</div>
	<div id='EqpMnMContainer'>
		<div class='EqpMnMdivitme'>
		<!-- 목록 시작 -->
		<!--
			EQPMN_SN 		-장비 일련번호(1부터 생성)
			EQPMN_SE_CODE   -장비 구분코드
			EQPMN_NM   	 	-장비명
			ORGNZT_ID 		-소속부서ID
		  -->
		
			<div>
			<!-- 검색시작  -->
				<div class='seachEqpmnM' style="float: right;">
					<form action="" onclick=false>
						<label for='seachEqpmnMSerach'>검색</label>					
						<input   id='seachEqpmnMSerach'>
						<button>검색</button>
						<button type="button" onclick="addEqpmnForm();" class='eqpmnDoF'>등록</button>
						<button type="button" onclick="addEqpmnDo();"  class ='eqpmnDoC' style="display: none" >등록확정</button>
						<button type="button" onclick="addEqpmnCel();" class='eqpmnDoC' style="display: none" >등록취소</button>
					</form>
				</div>
				<br>
			<!-- 검색끝  -->
			<!-- 장비테이블시작  -->
				<div id='eqpmnDiv'>
					<table  border="1" id="eqpmnMTable">
						
					</table>
				</div>
			<!-- 장비테이블 끝  -->
			</div>
		</div>
		<!-- 목록 끝 -->
		
		<div class='EqpMnMdivitme'>
			<div id='eqpmnDDiv'>
				<div style="float: right;">
						<button type="button" type="button" class='eqpmnModiForm' style="display: none" onclick=";">수정</button>
						<button type="button" class='' style="display: none" onclick=";">수정확정</button>
						<button type="button" class='' style="display: none" onclick=";">수정취소</button>
						<button type="button" class='eqpmnDel' style="display: none" onclick=";">삭제</button>
						
				</div>
				<br>
				<form id='insertFormEqpmnM' action="">
					<table border="1" id='eqpmnMDTable'>
						<tr>
								<th id='eqpmnSn'  >장비 일련번호</th>
								<td rowspan="15">검색 내역이 없습니다.</td>
							
							</tr>
							
							<tr>
								<th id='eqpmnSeCode'> 장비 구분코드</th>
								
							</tr>
							
							<tr>
								<th id='eqpmnNm'>장비명</th>
							</tr>
							<tr>
								<th id='orgnztId'>소속부서ID</th>
							</tr>
							<tr>
								<th id='buyDay'>구매일자</th>
							</tr>
							<tr>
								<th id='eqpmnUnitPrice'>단가</th>
							</tr>
							<tr>
								<th id='eqpmnModelName'>모델명</th>
							</tr>
							<tr>
								<th id='eqpmnMakr'>제조사</th>
							</tr>
							<tr>
								<th id='eqpmnPin'>식별번호</th>
							</tr>
							<tr>
								<th id='eqpmnCn'>비고</th>
							</tr>
							<tr>
								<th id='frstRegistDt'>최초등록일시</th>
							</tr>
							<tr>
								<th id='frstRegisterSn'> 최초등록자 일련번호</th>
							</tr>
							<tr>
								<th id='updtDt'>수정일시</th>
							</tr>
							<tr>
								<th id='updusrSn'>수정자 일련번호</th>
							</tr>
					</table>
				</form>
			</div>
		</div>
	<button onclick="abc()">test</button>
	</div>
	
	<!-- 메인 테이블  끝 -->
	<!-- 모달 -->
	<div class="modalEqmn">
      <div class="modal_body">
      	<div id='mainModal'>
      		<div>
      			<select id='serachSelect' name='serachSelect'>
      				<option value="">검색조건</option>
      				<option value="epqmnId">코드</option>
      				<option value="eqpmnNm">이름</option>
      			</select>
      			<input id='searchReq' placeholder="빈값이면 전체검색">
      			<button type="button" onclick="modalSearchEqpmn();">검색</button>
      		</div>
      		<div >
	      		<table id='modalEqpmn' style="text-align: center;" border="1">
	      			
	      			
	      		</table>
      		</div>
      	</div>
      	<div id='modal_button'>
      	<button onclick="modelSelect();">선택</button>
      	<button onclick="hide();">취소</button>
      	</div>
      </div>
    </div>
	<script type="text/javascript">
	//DOM 로드시 
 	$(function(){
		callEqpmnMain(); 
		
	})	
	
		function callEqpmnMain(){
	 		//테이블비워주기
			$('#eqpmnMTable').empty(); 
			$.ajax({
				  url: './callEqpmnMain.do' // 요청이 전송될 URL 주소
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,dataType : "json"
				 ,success : function(data){
						//mapping시킬 tr이름 가져옴
					let trName = ['eqpmnSn','eqpmnSeCode','eqpmnNm','orgnztId']	;
						
					//데이터//넣을 테이블 // 헤더
					 mktr(data,'#eqpmnMTable',trName)
				 }
			 });
			
		} 
		//데이터//넣을 테이블 // 헤더
		function mktr(data,table,trName){
		
			//헤드만들기
				let trH = $('<tr>');
			$(trName).each((index,thVal)=>{
				let th = $('<th>');
				th.text(thVal);//tr값입력
				//
				$(trH).append(th); //tr에 td 상속
				$(table).append(trH);  //table에 tr상속
			})
			$(data).each((index,val)=>{
				let tr = $('<tr>'); //tr생성
			  //메인테이블일때만 이벤트를 걸어줌
			  if(table=='#eqpmnMTable'){
				  $(tr).on('click',function(){ //tr에 클릭이벤트걸기
						let key = $(this).children('.eqpmnSn').text(); //키값가져오기
						callEqmnMDetail(key); //디테일 테이블 재 실행
						$('.eqpmnModiForm').show();
						$('.eqpmnDel').show();
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
		//상세 mktr
		//테이블 짜주는 메서드
		function mktrD(data,table,trName){
			//mapping시킬 tr이름 가져옴
			//테이블 비워줌 detailT안에서 td를찾아서
			let fordel = $(table).find('td');
			//trname과 같은 td태이블을 지워줌
			 $(fordel).each(function(td){
				 $(fordel[td]).remove();
			 })
			 //테이블만들기
			  $(trName).each((index,val)=>{
				 let td = $('<td>').text(data[0][val]) //td생성
				 let thC = $(table).find('#'+val); //디테일 테이블안 th의 id와 매칭시켜서 맞는 th검색
				 $(thC).after(td) //th와 같은 라인에 td 상속
			  })
		}
		//상세목록
		function callEqmnMDetail(key){
			$.ajax({
				  url: './callEqmnMDetailAjax.do' // 요청이 전송될 URL 주소
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 , data : {"eqpmnSn":key}
				  ,dataType : "json"
				 ,success : function(data){
						//mapping시킬 tr이름 가져옴
					 let trName = ['eqpmnSn','eqpmnSeCode','eqpmnNm','orgnztId','buyDay','eqpmnUnitPrice','eqpmnModelName','eqpmnMakr','eqpmnPin','eqpmnCn','frstRegistDt'
				 			,'frstRegisterSn','updtDt','updusrSn'];
					//데이터//넣을 테이블 // 헤더
					 mktrD(data,'#eqpmnMDTable',trName)
				 }
			 });
		}
		
		function eqpmnDelTable(){
			
			$('#eqpmnMTable').empty();
		}
		//등록폼
		function addEqpmnForm(){
			//버튼활성화
			$('.eqpmnDoC').show();
			$('.eqpmnDoF').hide();
			//td지우기
			$('#eqpmnMDTable').find('td').remove();
			//테이블만들기
			 let trName = ['eqpmnSeCode','eqpmnNm','orgnztId','buyDay','eqpmnUnitPrice','eqpmnModelName','eqpmnMakr','eqpmnPin','eqpmnCn'];
			 //숨기기
			 $('#eqpmnSn').hide();
			 $('#frstRegistDt').hide();
			 $('#frstRegisterSn').hide();
			 $('#updtDt').hide();
			 $('#updusrSn').hide();
			 //숨기기끝
			$(trName).each((index,val)=>{
			if(val=='eqpmnCn'){
				 let td = $('<td>') //td생성
				 let textBox = $('<textarea>');
				 textBox.css('resize','none');
				 textBox.prop('cols','20');	 
				 textBox.prop('rows','2');	
				 textBox.prop('name',val)
				 textBox.prop('id',val+'put')
				 td.append(textBox)
				 $('#eqpmnCn').after(td);
			 }
			else{
			 let td = $('<td>') //td생성
			 let input =$('<input>')//input생성
			 input.prop('name',val); //name
			 input.prop('id',val+'put'); //id
			 if (val=='buyDay'){
				 input.prop('type','date')
			 }
			 let thC = $(eqpmnMDTable).find('#'+val); //디테일 테이블안 th의 id와 매칭시켜서 맞는 th검색
			 td.append(input)
			 $(thC).after(td) //th와 같은 라인에 td 상속
			 }
		  })
		  //홀드시키고 이벤트걸기
		  $('#eqpmnSeCodeput').prop('readonly',true);
		  $('#eqpmnSeCodeput').on('click',function(){
			 $('.modalEqmn').show();
			  
		  }) 
		  $('#eqpmnNmput').prop('readonly',true);
		}
		//등록시작
		function addEqpmnDo(){
			//버튼활성화
			$('.eqpmnDoC').hide();
			$('.eqpmnDoF').show();
			//실행
			
			$.ajax({
				  url: './insertEqpmnMAjax.do' // 요청이 전송될 URL 주소
				 ,data : $('#insertFormEqpmnM').serialize()
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,success : function(data){
					 console.log(123)
					 if(data=='succ'){
						//리셋테이블
						 addEqpmnCel();
						 callEqpmnMain();
						 }else{
							 alert('이미 존재하는 코드입니다.') 
						 }
				 }
			 });
			console.log(1234)
			
			
		}
		//등록취소
		function addEqpmnCel(){
			//버튼활성화
			$('.eqpmnDoC').hide();
			$('.eqpmnDoF').show();
			//디테일 테이블 돌리기
			$('#eqpmnMDTable').find('td').remove();
			//숨진거 돌리기
			 $('#eqpmnSn').show();
			 $('#frstRegistDt').show();
			 $('#frstRegisterSn').show();
			 $('#updtDt').show();
			 $('#updusrSn').show();
			 //input만들기 검색내역없습니다로.
			 let td = $('<td>');
			 td.prop('rowspan','15');
			 td.text('검색 내역이 없습니다.');
			 $('#eqpmnSn').after(td);
			 //hidden 비워주기
			 $('#eqpmnSnHd').val('');
		}
		function hide(){
			$('.modalEqmn').hide();
			//input 디테일 초기화
			$('#eqpmnSeCodeput').val('');
			$('#eqpmnNmput').val('');
		}
		function modelSelect(){
			$('.modalEqmn').hide();
			 $('#modalEqpmn').empty();
			 
		}
		//모달안에서 장비코드조회
		function modalSearchEqpmn(){
			let data ={}
			//검색조건 만들어주기
			if($('#serachSelect').val()==''){
				data={'eqpmnId':'',"eqpmnObj" : 'Y'}
			}else if( $('#serachSelect').val()=='epqmnId') {
				data={'eqpmnId': $('#searchReq').val(),"eqpmnObj" : 'Y'}
			}else if ($('#serachSelect').val()=='eqpmnNm'){
				data={'eqpmnNm': $('#searchReq').val(),"eqpmnObj" : 'Y'}
			}
			$.ajax({
				  url: './callListEqmentAjax.do', // 요청이 전송될 URL 주소
				  type: 'post', // http 요청 방식 (default: ‘GET’)
				  data :data,
				  dataType : "json",
				  success : function(data){
					  //지우기
					 $('#modalEqpmn').empty();
					  //헤드
					 let trName = ['eqpmnId','eqpmnNm','upperEqpmnId'];
					  mktr(data,'#modalEqpmn',trName);
					  //체크확인용 radio 박스 
					  $('#modalEqpmn').find('tr').each((index,val)=>{
						  if(index !=0){
								let td = $('<td>')
								let input = $('<input>');
								input.prop('type','radio');
								input.prop('name','check');
								input.prop('readonly',true);
								td.append(input);
								 $(val).append(td); 
								 //tr눌러도 radio박스 넣기
								$(val).on('click',function(){
									//체크된 radio를 상세/등록 테이블로 넣기
									$(this).find('input').prop('checked',true)
									$('#eqpmnSeCodeput').val($(this).find('.eqpmnId').text());
									$('#eqpmnNmput').val($(this).find('.eqpmnNm').text());
								  }) 						  
							  }
					  });
				  }
			}); 
		}
		
		/* function asdf(a){
		 $.ajax({
			  url: './callOneEqmnAjax.do' // 요청이 전송될 URL 주소
			 ,data : {"eqpmnId": eqpmnId}
			 ,type: 'post' // http 요청 방식 (default: ‘GET’)
			 ,dataType : "json"
			 ,success : function(data){}
		 });
	} */
	</script>
</body>
</html>