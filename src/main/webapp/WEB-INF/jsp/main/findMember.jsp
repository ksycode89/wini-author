<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
	<script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}/js/common/jquery1.9/jquery-1.9.1.js"/>"></script>
<!-- CSS --> 
	<link type="text/css" rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}/css/member.css"/>"/>
</head>
<body>
	<div class="Join">
	  <div class="Join-header">
	    <h1>Find</h1>
	  </div>
		  <div class="Join-form" style = "display: flex;">
		  	<div id = "findIdBtn" style="width:50%; background-color: #87CEEB;  margin: 0 auto;" class='find-button' onclick = 'findId();'>아이디 찾기</div>
		  	<div id = "findPwBtn" style="width:50%; background-color: #3CB371;  margin: 0 auto;" class='find-button' onclick = 'findPw();'>비밀번호 초기화</div>
		  </div>
<!-- 		  ID찾기 -->
		  <form id = "frmId" onsubmit="return false;">
			  <div class = "find-form">
			  	<table>
			  		<colgroup>
						<col width="140"/>
						<col width="220"/>
						<col width="80"/>
						<col width="40"/>
					</colgroup>	
					<tbody>
				  		<tr>
				  			<th>사용자명</th>
				  			<td>
				  				<input type="text" id="user_nm" name="user_nm" class="join-input" maxlength="25"/> 
				  			</td>
				  		</tr>
				  		<tr>
				  			<th>생년월일</th>
				  			<td>
				  				<select name="birth_year" id="birth_year">
				  				</select> 년 
				  				<select name="birth_month" id="birth_month" onchange="changeMonthSelect()">
								</select> 월 
								<select name="birth_day" id="birth_day">
								</select> 일
							</td>
				  		</tr>
				  		<tr>
				  			<th>전화번호</th>
				  			<td>
				  				<input type="text" id="phone_1" class="join-input" style="width:50px;" maxlength="3"/> - 
				  				<input type="text" id="phone_2" class="join-input" style="width:60px;" maxlength="4"/> - 
				  				<input type="text" id="phone_3" class="join-input" style="width:60px;" maxlength="4"/>
				  			</td>
				  		</tr>
					</tbody>
			  	</table>
			  </div>
				<div style="display:flex;">
			  		<div style="width:75%;"></div>
			  	 	<div style="width:25%; background-color: #DC143C;;" class='join-button' onclick="submit('id');">아이디 찾기</div>
			  	</div>
		</form>
<!-- 		PW찾기 -->
  		   <form id = "frmPw" onsubmit="return false;">
			  <div class = "find-form">
			  	<table>
			  		<colgroup>
						<col width="140"/>
						<col width="220"/>
						<col width="80"/>
						<col width="40"/>
					</colgroup>	
					<tbody>
				  		<tr>
				  			<th>아이디</th>
				  			<td>
				  				<input type="text" id="user_id" name="user_id" class="join-input" maxlength="25"/> 
				  			</td>
				  		</tr>
				  		<tr>
			  			<th>이메일</th>
			  			<td>
			  				<input type="text" id="user_email" class="join-input" style="width:85px;" maxlength="30"/> @ 
			  				<input type="text" id="user_email2" class="join-input" style="width:95px;" maxlength="30"/>
			  			</td>
			  			<td colspan="2">
			  				<select id="email_selectBox" onchange="changeSelect()">
							    <option value="empty">직접입력</option>
							    <option value="winitech.com">winitech.com</option>
							    <option value="naver.com">naver.com</option>
							    <option value="nate.com">nate.com</option>
							    <option value="daum.net">daum.net</option>
							    <option value="gmail.com">gmail.com</option>
							</select>
			  			</td>
			  		</tr>
					</tbody>
			  	</table>
			  </div>
				<div style="display:flex;">
			  		<div style="width:75%;"></div>
			  	 	<div style="width:25%; background-color: #DC143C;;" class='join-button' onclick="submit('pw');">비밀번호 초기화</div>
			  	</div>
			</form>	
	 </div>
</body>
<script>
$(function(){
	$('#frmId').hide();
	$('#frmPw').hide();
	$('#user_id_retry').hide();
	// 생년월일 옵션 생성
	for (var count=1940; count<2023; count++){ // 1940년 ~ 2022년
		var option = '<option value="'+count+'">'+count+'</option>';
		$('#birth_year').append(option);
	}
	for (var count=1; count<=12; count++){ // 1월 ~ 12월
		var option = '<option value="'+count+'">'+count+'</option>';
		$('#birth_month').append(option);
	}
	for (var count=1; count<=31; count++){ // 1일 ~ 31일
		var option = '<option value="'+count+'">'+count+'</option>';
		$('#birth_day').append(option);
	}
	// 사용자명 입력창 한글만 입력 정규표현식
	$("#user_nm").keyup(function (event) {
        regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
        v = $(this).val();
        if (regexp.test(v)) {
            alert("한글만 입력가능 합니다.");
            $(this).val(v.replace(regexp, ''));
        }
    });
	// 생년월일 월 선택시 일 옵션 생성
	function changeMonthSelect(){
		$('#birth_day').empty(); // 일 옵션값 초기화
		var list=[31,28,31,30,31,30,31,31,30,31,30,31];
		var month = $("#birth_month option:selected").val(); 
		for (var count=1; count<=list[month-1]; count++){ // 선택한 달의 index를 판단하여 달에 맞는 일 수를 list에서 호출하여 옵션 값 생성
			var option = '<option value="'+count+'">'+count+'</option>';
			$('#birth_day').append(option);
		}
	}

});
// 이메일 주소 선택 함수
function changeSelect(){
	var email = $("#email_selectBox option:selected").val();
	if (email == "empty"){
		$("#user_email2").val(""); // 사용자가 이메일 주소를 입력할 수 있게 이메일 입력창 초기화
		$('#user_email2').attr("readonly", false); // 이메일 입력창 입력할 수 있게 readonly=false
	}else{
		$("#user_email2").val(email); // 선택한 이메일 주소 자동으로 이메일 입력창에 입력
		$('#user_email2').attr("readonly", true); // 이메일 입력창 입력할 수 없게 readonly=true
	}
}
function findId(){
	$('#findIdBtn').css('font-weight','bold');
	$('#findIdBtn').css('border','3px solid gray');
	$('#findIdBtn').css('font-size','16px');
	$('#findPwBtn').css('font-weight','');
	$('#findPwBtn').css('border','');
	$('#findPwBtn').css('font-size','13px');
	$('#frmId')[0].reset();
	$('#frmPw')[0].reset();
	$('#frmId').show();
	$('#frmPw').hide();
}

function findPw(){
	$('#findIdBtn').css('font-weight','');
	$('#findIdBtn').css('border', '');
	$('#findIdBtn').css('font-size','13px');
	$('#findPwBtn').css('font-weight','bold');
	$('#findPwBtn').css('border','3px solid gray');
	$('#findPwBtn').css('font-size','16px');
	$('#frmId')[0].reset();
	$('#frmPw')[0].reset();
	$('#frmId').hide();
	$('#frmPw').show();
}
</script>
</html>