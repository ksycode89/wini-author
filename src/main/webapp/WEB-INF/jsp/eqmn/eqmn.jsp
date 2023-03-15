<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장비 공통 코드</title>
<script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}/js/common/jquery1.9/jquery-1.9.1.js"/>"></script>
</head>
<body>

	<div class='hiddenInput'>
		<input type="hidden" id='eqpmnIdHd' name='eqpmnIdHd' ><br>
		<!--계층체크용  -->
		<input type="hidden" id='eqmnObjHd' name='eqmnObjHd' ><br>
	</div>				
	<div id='bodyContainer'>
		<!-- 공통코드 테이블 시작 ---------------------------------------------------->
		<div class='divitme'>
			<form id='eqmn_search_frm' action="">
				<!-- 공통코드 검색 div ------------------------------------------------------>
				<div class='eqmn_search' >
					<!-- <input id='eqpmnNmSer' name='eqpmnNm' value="" placeholder="장비구분명" >
					<button class= 'eqmnSeaerch' >검색</button> -->
					<c:if test="${userInfo.rght eq 'Y'}">
						<button type="button" class= 'doAddFormR'  onclick="goAddFormR()">root등록</button>
						<button type="button" class='doAddR'  onclick="doAddR()" style="display: none;">등록확정</button>
						<button type="button" class='doAddR' onclick="doAddCancel()" style="display: none;">등록취소</button>
						<button type="button" class= 'doAddForm'  onclick="goAddForm()">등록</button>
						<button type="button" class='doAdd'  onclick="doAdd()" style="display: none;">등록확정</button>
						<button type="button" class='doAdd' onclick="doAddCancel()" style="display: none;">등록취소</button>
					</c:if>
				</div>
				<!-- 공통코드 검색 div 끝 ------------------------------------------------------>
				<!-- 계층구조 공통코드 시작  ------------------------------------------------------>
				<div class='eqmnTree'>
				
				</div>
				<!-- 계층구조 공통코드 끝 - ----------------------------------------------------->
			</form>
			<div id='eqmn_table'></div>
		</div>
		<!-- 공통코드 테이블 끝------------------------------------------------------>
		<!-- 공통코드 상세내역 시작- ----------------------------------------------------->
			
		<div class='divitme'>
			<div style="float: right; display: block;">
			<c:if test="${userInfo.rght eq 'Y'}">
				<button id='eqmnModi' style="display: none" onclick="eqpmnModiForm();">수정</button>
				<button class='doModi' style="display: none" id='eqmnModiDo' style="display: none" onclick="eqpmnModiDo();">수정확정</button>
				<button class='doModi' style="display: none"id='eqmnModiCel' style="display: none" onclick="eqpmnModiCel();">수정취소</button>
				<button id='eqmnDel' style="display: none" onclick="eqpmnDelAjax();">삭제</button>
			</c:if>	
			</div><br>
			<div>
				<form id='eqmn_commn_frm' action="">
					<label for="eqpmnId">장비구분ID</label>
					<input id= 'eqpmnId' name='eqpmnId' readonly="readonly"><br>
					<label for="eqpmnNm">장비코드이름</label>
					<input id= 'eqpmnNm' name='eqpmnNm' readonly="readonly"><br>
					<label for="upperEqpmnId">상위장비구분ID</label>
					<input id= 'upperEqpmnId' name='upperEqpmnId' readonly="readonly" ><br>
					<div style="display: none" id='dqmnObjDiv'>
					<label  for="eqpmnObj">[계층N][장비Y]</label>
					<input  type="radio" class='eqpmnObj' id='eqpmnObj' name='eqpmnObj' value="Y" checked>Y
					<input  type="radio" class='eqpmnObj' id='eqpmnObj' name='eqpmnObj' value="N" >N
					</div>
				</form>
					<label  class='getday' for="frstRegistDt">최초등록일시</label>
					<input class='getday' id= 'frstRegistDt' name='frstRegistDt' readonly="readonly"><br>
					<label  class='getday' for="frstRegisterSn">최초등록자</label>
					<input  class='getday' id= 'frstRegisterSn' name='frstRegisterSn' readonly="readonly"><br>
					<label class='getday'  for="updtDt">수정일시</label>
					<input  class='getday' id= 'updtDt' name='updtDt' readonly="readonly"><br>
					<label  class='getday' for="updusrSn">수정자</label>
					<input  class='getday' id= 'updusrSn' name='updusrSn' readonly="readonly"><br>
					
			</div>	
		</div>
		<!-- 공통코드 상세내역 끝 ------------------------------------------------------>
	</div>
	
	<script type="text/javascript">
	
	$(function(){
		callEqmnList(); 
		
	})
	//div에 넣어주기
	function callEqmnList(){
		$.ajax({
			  url: './ajaxEqmnList.do', // 요청이 전송될 URL 주소
			  type: 'post', // http 요청 방식 (default: ‘GET’)
			  dataType : "json",
			  success : function(data){
			    mktrTree(data,'#eqmn_table'); //테이블 생성 
			  }
		})
	}
	//클릭이벤트용 변수
	var delay=100, timer=null,clickCnt=0;
	//테이블 짜주는 메서드
	function mktrTree(data,table){
		//delmainT();
		//mapping시킬 tr이름 가져옴
		$(data).each((index,val)=>{
				
			//console.log($(val)[0]["upperEqpmnId"])
			//계층 level로 정리해서 가져온뒤 상위 메뉴부터 생성후 상속하기
					if($(val)[0]["level"] == 1){
						//ul태그  생성
						let ul = $('<ul>');
						//ul에 레벨넣기
						ul.prop('class',$(val)[0]["level"])
						//i 아이콘 태그  생성
						let i = $('<i>');
						//li안에 값넣을 div
						let div = $('<div>');
						let span = $('<span>');
						i.prop('class','material-symbols-outlined')
						i.text('folder_open')
						
						//li태그 생성
						let li = $('<li>');
						//li클래스에 id값저장 추후 계층 append시킬때 이용
						li.prop('class',$(val)[0]["eqpmnId"])
						//li클래스에 내용
						span.text($(val)[0]["eqpmnNm"]);
						//이밴트 등록: 아이콘클릭시
						i.on('click',function(){
							$(this).parent().parent().find('.2').toggle();
						})
						/* //목차 더블클릭시
						span.on('dblclick',function(){
							$(this).parent().parent().find('.2').toggle();
						}) */
						//목차클릭시
						span.on('click',function(){
							//더블클릭인지 단일클릭인지 확인
							clickCnt++;
					        if (clickCnt === 1) {
					            timer = setTimeout(function(){
					    			callOneEqmn($(val)[0]['eqpmnId'])
					    		},200);
					        } else {
					        	clearTimeout(timer);
					        	clickCnt = 0;
					        	$(this).parent().parent().find('.2').toggle();
					        }
						});
						//호버색
						 $(div).hover(
					        function() {
					            $(div).css('backgroundColor', '#AFEEEE')
					        },
					        function() {
					        	$(div).css('backgroundColor', 'transparent')
					        }
					    );
						
						//메인 div에 상속
						$('.eqmnTree').append(ul);
						ul.append(li);
						li.append(div);
						div.append(i)
						div.append(span)
					}else{
						
						let ul = $('<ul>');
						let li = $('<li>');
						//폴더이미지
						//ul설정
						ul.prop('class',$(val)[0]["level"])
						//--------------------------------
						ul.css('display','none')
						//--------------------------------
						//li안에 값넣을 div
						let div = $('<div>');
						let span = $('<span>');
						
						//li클래스에 내용
						span.text($(val)[0]["eqpmnNm"]);
						let Prelevel = Number(val['level'])+1;
						let level = '.'+Prelevel;
					//i태그 관련 모음 //
					if($(val)[0]['eqpmnObj'] == 'N'){
						let i = $('<i>');
						i.prop('class','material-symbols-outlined')
						i.text('folder_open')
						
						//li클래스에 id값저장 추후 계층 append시킬때 이용
						li.prop('class',$(val)[0]["eqpmnId"])
						//이밴트 등록: 아이콘클릭시
						i.on('click',function(){
							$(this).parent().parent().find(level).toggle();
						})
						div.append(i)
					}	
					//i태그 관련 끝//
						//목차클릭시
						span.on('click',function(){
							//더블클릭인지 단일클릭인지 확인
							clickCnt++;
					        if (clickCnt === 1) {
					            timer = setTimeout(function(){
					    			callOneEqmn($(val)[0]['eqpmnId'])
					    		},200);
					        } else {
					        	clearTimeout(timer);
					        	clickCnt = 0;
					        	$(this).parent().parent().find(level).toggle();
					        }
						});
						
						//호버색
						 $(div).hover(
					        function() {
					            $(div).css('backgroundColor', '#AFEEEE')
					        },
					        function() {
					        	$(div).css('backgroundColor', 'transparent')
					        }
					    );
						
						$('.'+$(val)[0]["upperEqpmnId"]).append(ul);
						//메인 div에 상속
						ul.append(li);
						li.append(div);
						div.append(span)
					}	
		
		//최상위 data	
		})
	}

	//ul클릭이벤트 단일정보출력
	function callOneEqmn(eqpmnId){
		console.log(eqpmnId)
		 clickCnt = 0;
		 $.ajax({
			  url: './callOneEqmnAjax.do' // 요청이 전송될 URL 주소
			 ,data : {"eqpmnId": eqpmnId}
			 ,type: 'post' // http 요청 방식 (default: ‘GET’)
			 ,dataType : "json"
			 ,success : function(data){
				 doAddCancel()
				 //상황용 input hidden에 등록
				 $('#eqpmnIdHd').val($(data)[0]['eqpmnId'])
				 $('#eqmnObjHd').val($(data)[0]['eqpmnObj'])
				 
				 //input박스에 등록 : 
				 $('#eqpmnId').val($(data)[0]['eqpmnId'])
				 $('#eqpmnNm').val($(data)[0]['eqpmnNm'])
				 $('#upperEqpmnId').val($(data)[0]['upperEqpmnId'])
				 $('#frstRegistDt').val($(data)[0]['frstRegistDt'])
				 $('#frstRegisterSn').val($(data)[0]['frstRegisterSn'])
				 $('#updtDt').val($(data)[0]['updtDt'])
				 $('#updusrSn').val($(data)[0]['updusrSn'])
				  
				 //수정 삭제버튼 on
				 $('#eqmnModi').show();
				 $('#eqmnDel').show();
				 //등록버튼 숨기기
				 $('.doAdd').hide();
				 //등록버튼 숨기기
				 $('.doAddR').hide();
				 //등록폼가기 on
				 $('.doAddForm').show();
				 //수정폼 닫기
				  $('.doModi').hide();
				 
				  }
			}) 
			
			  
	}
	//등록폼이동
	function goAddForm(){
		console.log( $('#eqmnObjHd').val())
		console.log(123)
		if(  $('#eqpmnIdHd').val() != '' ){
			if($('#eqmnObjHd').val()=='N') {
				
			//Y N 값가져오기
			$('#dqmnObjDiv').show();
			//등록 확정/취소버튼 on
			$('.doAdd').toggle();
			$('.doAddForm').toggle();
			//수정 삭제 버튼 숨기기
			 $('#eqmnModi').hide();
			 $('#eqmnDel').hide();
			 //input박스 초기화
			 resetInput();
			 //상위 input에 현제 id넣어주기
			 $('#upperEqpmnId').val( $('#eqpmnIdHd').val());
			 //ready only off 
			 inputReadonly();
			 //날자인풋지우기
			 $('.getday').hide()
			 //root등록 
			 $('.doAddFormR').hide();
			}else{
				alert('최하위 계층 코드입니다.')
			}
		}
		else{
			alert('등록한 상위 코드를 선택해주세요')
		}
	}
	//등록확정
	function doAdd(){
		let di="menu";
		//유효성
		if(getVaild(di)){
		//등록실행
			 $.ajax({
				  url: './doAddAjax.do' // 요청이 전송될 URL 주소
				 ,data : $('#eqmn_commn_frm').serialize()
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,success : function(data){
					 if(data=='succ'){
						//검색초기화
					    $('.eqmnSeaerch').val('');
					    // input hidden에 초기화
					    $('#eqpmnIdHd').val('');
						//input box 초기화
						reset()
						 $('.getday').show();
						//obt숨기기
						$('#dqmnObjDiv').hide();
						//계층구분지우기
						$('#eqpmnObj').prop('checked',true)
						//테이블비우고 다시 읽어오기
						 $('.eqmnTree').empty();
						 callEqmnList();
						 //root등록
						 $('.doAddFormR').show();
					 }else{
						 alert('이미 존재하는 코드입니다.') 
					 }
				 }
			 });
		}
	 
	}
	//등록취소
	function doAddCancel(){
		//등록취소
		resetInput();
		// input hidden에 초기화
	    $('#eqpmnIdHd').val('');
		//등록버튼 on off
		$('.doAdd').toggle();
		$('.doAddForm').toggle();
		//root등록 off
		$('.doAddR').hide();
		//
		//수정삭제버튼 on off
		 $('#eqmnModi').hide();
		 $('#eqmnDel').hide();
		 //
		 $('.getday').show();
		 //root등록
		 $('.doAddFormR').show();
		 //
		 //검색초기화
	    $('.eqmnSeaerch').val('');
	    // input hidden에 초기화
	    $('#eqpmnIdHd').val('');
		//input box 초기화
		reset()
		 $('.getday').show();
		//obt숨기기
		$('#dqmnObjDiv').hide();
		//input read
		 $('#eqpmnId').prop('readonly',true);
		 $('#eqpmnNm').prop('readonly',true);
		
	}
	//root등록폼
	function goAddFormR(){
		
		//input box 초기화+hidden
		resetInput();
		//input box
		inputReadonly();
		//
		$('.doAddForm').hide();
		//수정 삭제 버튼 숨기기
		 $('#eqmnModi').hide();
		 $('#eqmnDel').hide();
		 //날자인풋지우기
		 $('.getday').hide();
		 $('#upperEqpmnId').prop('placeholder','최상위계층입니다.')
		 
		 //root등록업
		 $('.doAddR').show();
		 //root버튼 하이드
		 $('.doAddFormR').hide();
		 //alert
		 alert('최상위 계층등록입니다.')
		
	}
	//root등록
	function doAddR(){
		let di = 'root';
		//유효성
		if(getVaild(di)){
		//등록실행
			 $.ajax({
				  url: './doAddRAjax.do' // 요청이 전송될 URL 주소
				 ,data : $('#eqmn_commn_frm').serialize()
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,success : function(data){
					 console.log(data)
		/* 			 if(data=='succ'){
						//검색초기화
					    $('.eqmnSeaerch').val('');
					    // input hidden에 초기화
					    $('#eqpmnIdHd').val('');
						//input box 초기화
						reset()
						 $('.getday').show();
						//obt숨기기
						$('#dqmnObjDiv').hide();
						//계층구분지우기
						$('#eqpmnObj').prop('checked',true)
						//테이블비우고 다시 읽어오기
						 $('.eqmnTree').empty();
						 callEqmnList();
					 }else{
						 alert('이미 존재하는 코드입니다.') 
					 }
					 */
				 } 
			 });
		}
	}
	
	//input box 초기화+hidden
	function resetInput(){
		 //input박스에 등록 : 
		 $('#eqpmnId').val('');
		 $('#eqpmnNm').val('');
		 $('#upperEqpmnId').val('');
		 $('#frstRegistDt').val('');
		 $('#frstRegisterSn').val('');
		 $('#updtDt').val('');
		 $('#updusrSn').val('');
	}
	//초기화
	function reset(){
		//input box 초기화
		resetInput();
		//검색초기화
	   	$('.eqmnSeaerch').val('');
		 // input hidden에 초기화
		 $('#eqpmnIdHd').val('');
		 //버튼초기화
		 //등록하기버튼
		 $('.doAddForm').show();
		 //등록버튼
		 $('.doAdd').hide();
		 //수정삭제버튼
		//수정 삭제 버튼 숨기기
		 $('#eqmnModi').hide();
		 $('#eqmnDel').hide();
		
	}
	function inputReadonly(){
		 //input박스 read only off : 
		 $('#eqpmnId').prop('readonly',false);
		 $('#eqpmnNm').prop('readonly',false);
		 //$('#upperEqpmnId').prop('readonly',false);
		 //$('#frstRegistDt').prop('readonly',false);
		 //$('#frstRegisterSn').prop('readonly',false);
		 //$('#updtDt').prop('readonly',false); //세션에서 읽어오기
		 //$('#updusrSn').prop('readonly',false);
	}
	//수정폼이동
	function eqpmnModiForm(){
		if( $('#eqpmnIdHd').val() != '' ){
		//intput풀기
		inputReadonly();
		//수정폼등장
		$('.doModi').show()
		//수정등록폼 숨김
		$('#eqmnModi').hide()
		$('#eqmnDel').hide()
		}
	}
	//수정등록
	function eqpmnModiDo(){
		//intput풀기
		inputReadonly();
		//수정폼등장
		$('.doModi').show();
		//수정등록
		if(true){
			let eqpmnId = $('#eqpmnId').val();//장비구분id
			let eqpmnNm =  $('#eqpmnNm').val(); //장비구분 이름
			
			//아작스//세션완료휴 가져가기 수정자
			 $.ajax({
				  url: './eqpmnModiDo.do' // 요청이 전송될 URL 주소
				 ,data : {"eqpmnId": eqpmnId,"eqpmnNm":eqpmnNm}
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,success : function(data){
					 resetInput()
					 $('.eqmnTree').empty();
					 callEqmnList();
					 $('.doModi').hide()
				 }
			 });
		}
		
	}
	//수정취소
	function eqpmnModiCel(){
		 $('.doModi').hide()
		 $('#eqmnModi').show();
		 $('#eqmnDel').show();
		 //수정전 정보 불러오기
		 callOneEqmn( $('#eqpmnIdHd').val())
		 //인풋잠금
		 $('#eqpmnId').prop('readonly',true);
		 $('#eqpmnNm').prop('readonly',true);
		 
		 
	}
	//삭제
	function eqpmnDelAjax(){
		//삭제
		if(true){
			let eqpmnId = $('#eqpmnId').val();//장비구분id
		
			//아작스//세션완료휴 가져가기 수정자
			console.log('123'+eqpmnId);
			 $.ajax({
				  url: './eqpmnDelAjax1.do' // 요청이 전송될 URL 주소
				 ,data : {"eqpmnId": eqpmnId}
				 ,type: 'post' // http 요청 방식 (default: ‘GET’)
				 ,success : function(data){
					 console.log(data);
					 if(data == 'succ'){
						 doAddCancel();
					//테이블비우고 다시 읽어오기
					 $('.eqmnTree').empty();
					 callEqmnList();
					 alert(eqpmnId+'삭제성공')
					 }else if(data=='fail'){
						 alert(eqpmnId,'삭제실패')
					 }else if (data=='child'){
						 alert('하위요소가 존재합니다.')
					 }else{
						 alert('error : 관리자에게 문의하세요')
					 }
				 }
			 });
		}
		
	}
	/* --------------------------------------------------------------------- */
	//유효성검사 + 빈칸제거
	 /*  $('#eqpmnId').val('');
		 $('#eqpmnNm').val('');
		 $('#upperEqpmnId').val(''); */
	function getVaild(di){
		if(!$.trim($('#eqpmnId').val())){
			alert('장비구분을 입력해주세요')
			return false;
		}
		if(!$.trim($('#eqpmnNm').val())){
			alert('장비코드 이름을 입력해주세요')
			return false;
		}
		//di에 값이 들어오면 
		if(di != 'root'){
			if(!$.trim($('#upperEqpmnId').val())){
				alert('장비 상위 코드를 입력해주세요')
				return false;
			}
		}
		//radio는 같은 아이디를 가져야 함/ 구분을 주기보단 기본값을 줘서 무조건 고르게 할것
		/* if(!$('.eqpmnObj').prop('checked')){
			alert('계층구분을  선택 해주세요')
			return false;
		} */
		return true;
	}
	/* --------------------------------------------------------------------- */
	
	
	
	
	
	function testA(){
		getVaild();
		console.log($('#eqpmnObj').prop('checked'))
	}
	function asdf(a){
		console.log(a)
		 $.ajax({
			  url: './callOneEqmnAjax.do' // 요청이 전송될 URL 주소
			 ,data : {"eqpmnId": eqpmnId}
			 ,type: 'post' // http 요청 방식 (default: ‘GET’)
			 ,dataType : "json"
			 ,success : function(data){}
		 });
	}
	
	/* function 장비계층테이블(){
		//if+반복문으로 처리하기 : 실패 추후 한번더 생각해보기
		if($(val)[0]["level"] == level){
			let li = $('<li>');
			li.prop('class',$(val)[0]["eqpmnId"])
			li.text($(val)[0]["eqpmnId"]);
			$('.eqmnTree').append(li);
			
		}else if($(val)[0]["level"] == level+1){
			let ul = $('<ul>')
			let li = $('<li>');
			li.text($(val)[0]["eqpmnId"]);
			li.prop('class',$(val)[0]["eqpmnId"])
			ul.append(li);
			$('.'+$(val)[0]["upperEqpmnId"]).append(ul);
			level=level+1;
		}
		else {
			level = level+1;
			let ul = $('<ul>')
			let li = $('<li>');
			li.text($(val)[0]["eqpmnId"]);
			li.prop('class',$(val)[0]["eqpmnId"])
			ul.append(li);
			$('.'+$(val)[0]["upperEqpmnId"]).append(ul);
		} 
	}*/
	</script>
</body>
</html>