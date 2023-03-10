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

	<!-- <style type="text/css">
	#asdf{
		background-image: 
	}
	#bodyContainer{
		background-image: url("./images/wini_logo.png");
		background-color: black;
	}
	</style>

 -->${eqmnList}

	<div id='bodyContainer'>
		<!-- 공통코드 테이블 시작 ---------------------------------------------------->
		<div class='divitme'>
			<form id='eqmn_search_frm' action="">
				<!-- 공통코드 검색 div ------------------------------------------------------>
				<div class='eqmn_search'>
					<input id='eqpmnNmSer' name='eqpmnNm' value="" placeholder="장비구분명" >
					<button>검색</button>
					<button>등록</button>
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
			<form id='eqmn_commn_frm' action="">
				<label for="eqpmnId">장비구분ID</label>
				<input id= 'eqpmnId' name='eqpmnId' readonly="readonly"><br>
				<label for="eqpmnNm">장비코드이름</label>
				<input id= 'eqpmnNm' name='eqpmnNm' readonly="readonly"><br>
				<label for="upperEqpmnId">상위장비구분ID</label>
				<input id= 'upperEqpmnId' name='upperEqpmnId' readonly="readonly"><br>
				<label for="frstRegistDt">최초등록일시</label>
				<input id= 'frstRegistDt' name='frstRegistDt' readonly="readonly"><br>
				<label for="frstRegisterSn">최초등록자</label>
				<input id= 'frstRegisterSn' name='frstRegisterSn' readonly="readonly"><br>
				<label for="updtDt">수정일시</label>
				<input id= 'updtDt' name='updtDt' readonly="readonly"><br>
				<label for="updusrSn">수정자</label>
				<input id= 'updusrSn' name='updusrSn' readonly="readonly"><br>
			</form>
		</div>
		<!-- 공통코드 상세내역 끝 ------------------------------------------------------>
	</div>
	<form action="" id= "detailData">
		<div>
			<input name='a' value="aa">
			<input name='b' value="bb">
			<input name='c' value="cc">
		</div>
	</form>
	<button onclick="testA();">aa</button>
	
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
				
					console.log($('#eqpmnNm'))
				 $('#eqpmnId').val($(data)[0]['eqpmnId'])
				 
				 $('#eqpmnNm').val($(data)[0]['eqpmnNm'])
				 $('#upperEqpmnId').val($(data)[0]['upperEqpmnId'])
				 $('#frstRegistDt').val($(data)[0]['frstRegistDt'])
				 $('#frstRegisterSn').val($(data)[0]['frstRegisterSn'])
				 $('#updtDt').val($(data)[0]['updtDt'])
				 $('#updusrSn').val($(data)[0]['updusrSn'])
				   
				  }
			}) 
			  
	}
	
	/* --------------------------------------------------------------------- */
	function testA(){
		
		setTimeout(function(){
			callOneEqmn()
		} , 2000);
		
	}
	function asdf(a){
		console.log(a)
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