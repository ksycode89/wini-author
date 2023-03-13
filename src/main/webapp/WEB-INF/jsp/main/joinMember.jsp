<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join Member Page</title>
<!-- jQuery -->
	<script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}/js/common/jquery1.9/jquery-1.9.1.js"/>"></script>
<!-- CSS --> 
	<link type="text/css" rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}/css/member.css"/>"/>
</head>
<body>
	<div class="Join">
	  <div class="Join-header">
	    <h1>Join</h1>
	  </div>
	  	<form id = "frm" onsubmit="return false;">
		 <div class="Join-form">
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
			  			<th rowspan="2">아이디</th>
			  			<td>
			  				<input type="text" id="user_id" name="user_id" class="join-input" maxlength="25"/>
			  			</td>
			  			<td>
			  				<button type="button" id = "user_id_chkBtn" onclick="duplicateCheck('y')">중복체크</button>
			  				<button type="button" id = "user_id_retry" onclick="duplicateCheck('n')">ID 재입력</button>
			  			</td>
			  		</tr>
			  		<tr>
			  			<td colspan="3">
			  				<input type="checkbox" id="chk_id" onclick="return false;"/>
			  				<a id="chk_id_txt" >*5~20자리의 영문,숫자를 입력하세요.</a>
			  			</td>
			  		</tr>
			  		<tr>
			  			<th rowspan="2">비밀번호</th>
			  			<td>
			  				<input type="password" id="user_pw" class="join-input" maxlength="25"/> 
			  			</td>
			  		</tr>
			  		<tr>
			  			<td colspan="3">
			  				<input type="checkbox" id="chk_pw" onclick="return false;"/>
			  				<a id="chk_pw_txt">*4자리 이상의 비밀번호를 입력하세요.</a>
			  			</td>
			  		</tr>
			  		<tr>
			  			<th rowspan="2">비밀번호 확인</th>
			  			<td>
			  				<input type="password" id="user_pw2" class="join-input" maxlength="25" readonly="readonly"/> 
			  			</td>
			  		</tr>
			  		<tr>
			  			<td colspan="3">
			  				<input type="checkbox" id="chk_pw2" onclick="return false;"/>
			  				<a id="chk_pw2_txt">*비밀번호를 먼저 입력하세요.</a>
			  			</td>
			  		</tr>
			  		<tr>
			  			<th>성별</th>
			  			<td>
			  				<select id="user_gender">
			  					<option value="">선택안함</option>
							    <option value="M">남자</option>
							    <option value="W">여자</option>
			  				</select>
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
		  	</form>
		  	<div style="display:flex;">
		  		<div style="width:12%; background-color: #3CB371;" class='join-button' onclick="res();">초기화</div>
		  	 	<div style="width:10%; background-color: #DC143C;" class='join-button' onclick="cancel();">취소</div>
		  		<div style="width:68%;"></div>
		  	 	<div style="width:10%; background-color: #87CEEB;" class='join-button' onclick="submit();">등록</div>
		  	</div>
		</div>
	</div>
</body>

<script>
	$(function(){
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
		// 비밀번호 입력 체크
		$("#user_pw").keyup(function (event) { // PW1 입력시 상태확인
			$('#user_pw2').val(""); // PW1을 입력하면 기존에 PW2의 입력값 초기화
			$("input:checkbox[id='chk_pw2']").prop("checked", false); // PW2 체크 해제
			if($('#user_pw').val().trim().length < 4){ // PW1가 4자리 이하일 경우, 함수 실행 
				$("input:checkbox[id='chk_pw']").prop("checked", false); // PW1이 4자리 미만이면 체크X
				$('#chk_pw_txt').text("*4자리 이상의 비밀번호를 입력하세요."); // 4자리 이상 비밀번호 입력하라는 text 출력
				$('#user_pw2').attr("readonly", true); // 아직 PW1을 입력하지 않은 상태라면 PW2를 입력 불가 readonly=true
				$('#chk_pw2_txt').text("*비밀번호를 먼저 입력하세요."); // PW1을 먼저 입력하라는 text를 PW2에 출력
			}else{
				$("input:checkbox[id='chk_pw']").prop("checked", true); // PW1이 4자리 이상이면 체크O
				$('#chk_pw_txt').text("*비밀번호를 입력 완료."); // PW1 비밀번호 입력 완료라는 text 출력
				$('#user_pw2').attr("readonly", false); // PW2를 입력할 수 있도록 readonly=false
				$('#chk_pw2_txt').text("*비밀번호가 일치하는지 확인하세요."); // PW2 TEXT 문구 변경
			}
        });
		$("#user_pw2").keyup(function (event) { // PW2 입력시 상태확인
			if($('#user_pw2').val().trim().length==0){
				$('#chk_pw2_txt').text("*비밀번호를 먼저 입력하세요.");
			}else if($('#user_pw').val()==$('#user_pw2').val()){ // PW1과 PW2의 비밀번호가 일치할 때,
				$("input:checkbox[id='chk_pw2']").prop("checked", true); // 일치여부 체크 O
				$('#chk_pw2_txt').text("*비밀번호 일치 확인."); // PW2 TEXT 문구
			}else{  // PW1과 PW2의 비밀번호가 일치 않을 시,
				$("input:checkbox[id='chk_pw2']").prop("checked", false); // 일치여부 체크 X
				$('#chk_pw2_txt').text("*비밀번호가 일치하는지 확인하세요."); // PW2 TEXT 문구
			}
        });
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
	// 회원가입창 닫기 버튼
	function cancel(){
		var text = "입력한 내용이 사라집니다. 창을 닫으시겠습니까?"
		if(confirm(text)){
			window.close(); // 현재 창 닫기
		}else{
			return;
		}
	}
	// 회원가입창 초기화 버튼
	function res(){
		var text = "입력한 내용이 초기화합니다."
		if(confirm(text)){
			location.reload(); // 새로고침하여 입력값 초기화
		}else{
			return;
		}
	}

	// 아이디 중복 체크 & 아이디 재등록
	function duplicateCheck(yn){
		if (yn=='y'){ // ID 중복체크 버튼 클릭 시 실행
			$.ajax({
				type : 'post',
				url : 'duplicateCheck.do',
				data : {userId : $("#user_id").val()},
				success:function(data){
					if (data==0){
						alert("사용가능한 아이디입니다.");
						$("input:checkbox[id='chk_id']").prop("checked", true); // 중복체크 선택 (사용가능한 ID일 경우, 체크)
						$('#user_id').attr("readonly", true); // 사용가능한 ID일 경우, 입력값 변경 불가! readonly=true
						$('#chk_id_txt').text("중복 체크 완료"); // ID 중복체크 완료시 TEXT 변경
// 						$("#user_id_chkBtn").attr("disabled", "disabled"); // ID 중복체크 버튼 비활성화 
						$('#user_id_retry').show(); // ID 재등록 버튼 보이기
						$('#user_id_chkBtn').hide(); // ID 중복 체크 버튼 숨기기
					}else{
						alert("중복된 아이디입니다.")
						$('#user_id').val(""); // 중복된  ID일 경우, 다시 입력할 수 있도록 ID 입력창 초기화
					}
				}
			});
		}else{ // ID 재등록 버튼 클릭 시 실행 
			$('#user_id').val(""); // ID 입력창 초기화
			$('#user_id').attr("readonly", false); // ID 입력창 입력할 수 있게 변경 readonly=false
// 			$("#user_id_chkBtn").removeAttr("disabled"); // ID 중복체크 버튼 활성화
			$("input:checkbox[id='chk_id']").prop("checked", false); // ID 중복체크 선택 해제
			$('#chk_id_txt').text("*5~20자리의 영문,숫자를 입력하세요."); // ID입력을 요구하는 TEXT로 변경
			$('#user_id_retry').hide(); // ID 재등록 버튼 숨기기
			$('#user_id_chkBtn').show(); // ID 중복 체크 버튼 보이기
		}
	}
	// 회원가입 실행 함수
	function submit(){
		if ($("#user_nm").val().trim() ==0){ // 사용자명 공백확인
			alert("사용자명을 입력하세요.");
			return;
		}else if($('#chk_id').is(':checked')==false){ // ID 중복체크 유무 확인
			alert("아이디 중복체크를 하세요.");
			return;
		}else if($('#chk_pw2').is(':checked')==false){ // PW 일치여부 확인
			alert("비밀번호 입력 확인을 하세요.");
			return;
		}else if(($('#phone_1').val().length<3) || ($('#phone_2').val().length<3) || ($('#phone_3').val().length<4)){ // 전화번호 입력 여부 확인
			alert("전화번호를 올바른 형식으로 입력하세요.");
			return;
		}else if(($('#user_email').val().trim()==0) || ($('#user_email2').val().trim()==0)){ // 이메일 입력 여부 확인
			alert("이메일을 올바른 형식으로 입력하세요.");
			return;
		}
		if(confirm("등록하시겠습니까?")){ // 회원가입 확인창 
			$.ajax({
				type : 'post',
				url : 'userInsert.do',
				// data : {사용자명(userNm),아이디(userId),비밀번호(userPw),성별(userGndr),생년월일(userBrt),전화번호(userPhon),이메일(userEmail)}
				data : {
						userNm : $("#user_nm").val()
						,userId : $("#user_id").val()
						,userPw : $("#user_pw").val()
						,userGndr : $("#user_gender").val()
						,userBrt : $("#birth_year").val()+'.'+$("#birth_month").val().padStart(2,'0')+'.'+$("#birth_day").val().padStart(2,'0')
						,userPhon : $("#phone_1").val()+'-'+$("#phone_2").val()+'-'+$("#phone_3").val()
						,userEmail : $("#user_email").val()+'@'+$("#user_email2").val()
						},
				success:function(data){
					alert("정상적으로 회원가입이 되었습니다.")
					window.close();
				}
				,error:function(data){
				}
			});
		}else{
			return;
		}
	}
</script>
</html>
