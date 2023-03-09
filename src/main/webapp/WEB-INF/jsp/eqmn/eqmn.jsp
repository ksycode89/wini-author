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


${eqmnList}

	<div id='bodyContainer'>
		<div class='divitme'>
			<form id='eqmn_search_frm' action="">
				<div class='eqmn_search'>
					<input id='eqpmnNm' name='eqpmnNm' value="" placeholder="장비구분명">
					<button>검색</button>
					<button>등록</button>
				</div>
				<div>
					<ul class='eqmnTree'>
					</ul>
				
				</div>
			</form>
			<div id='eqmn_table'></div>
		</div>
		<div class='divitme'>
			<form id='eqmn_commn_frm' action="">
				<label for="eqpmnId">장비구분ID</label>
				<input id= 'eqpmnId' name='eqpmnId' value=""><br>
				<label for="eqpmnNm">장비구분명</label>
				<input id= 'eqpmnNm' name='eqpmnNm' value=""><br>
				<label for="upperEqpmnId">상위장비구분ID</label>
				<input id= 'upperEqpmnId' name='upperEqpmnId' value=""><br>
				<label for="frstRegistDt">최초등록일시</label>
				<input id= 'frstRegistDt' name='frstRegistDt' value=""><br>
				<label for="frstRegisterSn">최초등록자</label>
				<input id= 'frstRegisterSn' name='frstRegisterSn' value=""><br>
				<label for="updtDt">수정일시</label>
				<input id= 'updtDt' name='updtDt' value=""><br>
				<label for="updusrSn">수정자</label>
				<input id= 'updusrSn' name='updusrSn' value=""><br>
			</form>
		</div>
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
	
	//테이블 짜주는 메서드
	function mktrTree(data,table){
		//delmainT();
		//mapping시킬 tr이름 가져옴
		
		
		let level = 1;
		let e = 2;
		$(data).each((index,val)=>{
			//console.log($(val)[0]["upperEqpmnId"])
					if($(val)[0]["level"] == 1){
						
						let li = $('<li>');
						li.prop('class',$(val)[0]["eqpmnId"])
						li.text($(val)[0]["eqpmnId"]);
						$('.eqmnTree').append(li);
					}else{
						
						let ul = $('<ul>')
						ul.on('click',function(){
							
						})
						let li = $('<li>');
						li.text($(val)[0]["eqpmnId"]);
						li.prop('class',$(val)[0]["eqpmnId"])
						ul.append(li);
						$('.'+$(val)[0]["upperEqpmnId"]).append(ul);
						
					}	
			
					/* if($(val)[0]["level"] == level){
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
					} */
		//최상위 data	
		})
		
		
	}
	
	
	
	/* --------------------------------------------------------------------- */
	function testA(){
		console.log(12)
		$.ajax({
			  url: './test2.do', // 요청이 전송될 URL 주소2
			  type: 'post', // http 요청 방식 (default: ‘GET’)
			  data : $('#detailData').serialize()
			 ,success : function(data){
			}
		})
	}
	</script>
</body>
</html>