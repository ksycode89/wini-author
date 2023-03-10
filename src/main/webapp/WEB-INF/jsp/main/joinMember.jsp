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
		  		<div style="width:12%; background-color: #3CB371;" class='join-button' onclick="reset();">초기화</div>
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
		for (var count=1940; count<2023; count++){
			var option = '<option value="'+count+'">'+count+'</option>';
			$('#birth_year').append(option);
		}
		for (var count=1; count<=12; count++){
			var option = '<option value="'+count+'">'+count+'</option>';
			$('#birth_month').append(option);
		}
		for (var count=1; count<=31; count++){
			var option = '<option value="'+count+'">'+count+'</option>';
			$('#birth_day').append(option);
		}
		$("#user_nm").keyup(function (event) {
            regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
            v = $(this).val();
            if (regexp.test(v)) {
                alert("한글만 입력가능 합니다.");
                $(this).val(v.replace(regexp, ''));
            }
        });
		$("#user_pw").keyup(function (event) {
			$('#user_pw2').val("");
			if($('#user_pw').val().length < 4){
				$("input:checkbox[id='chk_pw']").prop("checked", false);
				$('#chk_pw_txt').text("*4자리 이상의 비밀번호를 입력하세요.");
				$('#user_pw2').attr("readonly", true);
				$('#chk_pw2_txt').text("*비밀번호를 먼저 입력하세요.");
			}else{
				console.log("d");
				$("input:checkbox[id='chk_pw']").prop("checked", true);
				$('#user_pw2').attr("readonly", false);
				$('#chk_pw_txt').text("*비밀번호를 입력 완료.");
				$("input:checkbox[id='chk_pw2']").prop("checked", false);
				$('#chk_pw2_txt').text("*비밀번호가 일치하는지 확인하세요.");
			}
        });
		$("#user_pw2").keyup(function (event) {
			if($('#user_pw2').val().trim().length==0){
				$('#chk_pw2_txt').text("*비밀번호를 먼저 입력하세요.");
			}else if($('#user_pw').val()==$('#user_pw2').val()){
				$("input:checkbox[id='chk_pw2']").prop("checked", true);
				$('#chk_pw2_txt').text("*비밀번호 일치 확인.");
			}else{
				$("input:checkbox[id='chk_pw2']").prop("checked", false);
				$('#chk_pw2_txt').text("*비밀번호가 일치하는지 확인하세요.");
			}
        });
	});
	function changeMonthSelect(){
		$('#birth_day').empty();
		var list=[31,28,31,30,31,30,31,31,30,31,30,31];
		var month = $("#birth_month option:selected").val();
		for (var count=1; count<=list[month-1]; count++){
			var option = '<option value="'+count+'">'+count+'</option>';
			$('#birth_day').append(option);
		}
	}
	function changeSelect(){
		var email = $("#email_selectBox option:selected").val();
		console.log($("#email_selectBox option:selected").val());
		if (email == "empty"){
			$("#user_email2").val("");
			$('#user_email2').attr("readonly", false);
		}else{
			$("#user_email2").val(email);
			$('#user_email2').attr("readonly", true);
		}
	}
	
	function cancel(){
		var text = "입력한 내용이 사라집니다. 창을 닫으시겠습니까?"
		if(confirm(text)){
			window.close();
		}else{
			return;
		}
	}
	function reset(){
		var text = "입력한 내용이 초기화합니다."
		if(confirm(text)){
			location.reload();
		}else{
			return;
		}
	}

// 아이디 중복 체크 & 아이디 재등록
	function duplicateCheck(yn){
		if (yn=='y'){
			$.ajax({
				type : 'post',
				url : 'duplicateCheck.do',
				data : {userId : $("#user_id").val()},
				success:function(data){
					console.log(data);
					if (data==0){
						alert("사용가능한 아이디입니다.");
						// 중복체크 선택
						$("input:checkbox[id='chk_id']").prop("checked", true);
						// id 수정불가
						$('#user_id').attr("readonly", true);
						$('#chk_id_txt').text("중복 체크 완료");
						$("#user_id_chkBtn").attr("disabled", "disabled");
						$('#user_id_retry').show();
						$('#user_id_chkBtn').hide();
					}else{
						alert("중복된 아이디입니다.")
						// id 초기화
						$('#user_id').val("");
					}
				}
			});
		}else{
			$('#user_id').val("");
			$('#user_id').attr("readonly", false);
			$("#user_id_chkBtn").removeAttr("disabled");
			$("input:checkbox[id='chk_id']").prop("checked", false);
			$('#chk_id_txt').text("*5~20자리의 영문,숫자를 입력하세요.");
			$('#user_id_retry').hide();
			$('#user_id_chkBtn').show();
		}
		
	}
	
	function submit(){
		if ($("#user_nm").val().trim() ==0){
			alert("사용자명을 입력하세요.");
			return;
		}else if($('#chk_id').is(':checked')==false){
			alert("아이디 중복체크를 하세요.");
			return;
		}else if($('#chk_pw2').is(':checked')==false){
			alert("비밀번호 입력 확인을 하세요.");
			return;
		}else if(($('#phone_1').val().length<3) || ($('#phone_2').val().length<3) || ($('#phone_3').val().length<4)){
			alert("전화번호를 올바른 형식으로 입력하세요.");
			return;
		}else if(($('#user_email').val().trim()==0) || ($('#user_email2').val().trim()==0)){
			alert("이메일을 올바른 형식으로 입력하세요.");
			return;
		}
		if(confirm("등록하시겠습니까?")){
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
