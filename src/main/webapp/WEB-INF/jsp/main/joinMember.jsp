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
	  
	  <div class="Join-form">
	  	<table>
	  		<colgroup>
				<col width="140"/>
				<col width="140"/>
				<col width="80"/>
				<col width="40"/>
			</colgroup>	
			<tbody>
		  		<tr>
		  			<th>사용자명</th>
		  			<td>
		  				<input type="text" id="user_nm" name="user_nm" class="join-input" style="ime-mode:active;" maxlength="25"/> 
		  			</td>
		  		</tr>
		  		<tr>
		  			<th rowspan="2">아이디</th>
		  			<!-- 		  			<td colspan="3"> -->
		  			<td>
		  				<input type="text" id="user_id" name="user_id" class="join-input" style="ime-mode:active;" maxlength="25"/>
		  			</td>
		  			<td>
		  				<button>중복체크</button>
		  			</td>
		  			<td>
		  				<input type="checkbox" id="chk_id"/>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td colspan="3">*5~20자리의 영문,숫자</td>
		  		</tr>
		  		<tr>
		  			<th rowspan="2">비밀번호</th>
		  			<!-- 		  			<td colspan="3"> -->
		  			<td>
		  				<input type="password" id="user_pw" name="user_pw" class="join-input" style="ime-mode:active;" maxlength="25"/> 
		  			</td>
		  		</tr>
		  		<tr>
		  			<td colspan="3">*비밀번호 입력!</td>
		  		</tr>
		  		<tr>
		  			<th rowspan="2">비밀번호 확인</th>
		  			<!-- 		  			<td colspan="3"> -->
		  			<td>
		  				<input type="password" id="user_pw_confirm" name="user_pw_confirm" class="join-input" style="ime-mode:active;" maxlength="25"/> 
		  			</td>
		  		</tr>
		  		<tr>
		  			<td colspan="3">*비밀번호 재입력!</td>
		  		</tr>
		  		<tr>
		  			<th>전화번호</th>
		  			<td>
		  				<input type="text" id="phone_1" class="join-input" style="width:50px; ime-mode:active;" maxlength="3"/>-
		  				<input type="text" id="phone_2" class="join-input" style="width:50px; ime-mode:active;" maxlength="4"/>-
		  				<input type="text" id="phone_3" class="join-input" style="width:50px; ime-mode:active;" maxlength="4"/>
		  			</td>
		  		</tr>
		  		<tr>
		  			<th>이메일</th>
		  			<td>
		  				<input type="text" id="user_email" class="join-input" style="width:70px; ime-mode:active;" maxlength="30"/>@
		  				<input type="text" id="user_email" class="join-input" style="width:70px; ime-mode:active;" maxlength="30"/>
		  			</td>
		  			<td colspan="2">
		  				<select name="pets" id="pet-select">
						    <option value="">choose</option>
						    <option value="dog">naver.com</option>
						    <option value="cat">nate.com</option>
						    <option value="hamster">daum.net</option>
						    <option value="parrot">gmail.com</option>
						    <option value="spider">직접입력</option>
						</select>
		  			</td>
		  		</tr>
			</tbody>
	  	</table>
	    <h3>Username:</h3>
	    <input type="text" placeholder="Username"/><br>
	    <h3>Password:</h3>
	    <input type="password" placeholder="Password"/>
	    <br>
	    <input type="checkbox" value="remember"/>아이디 저장
	    <br>
	    <input type="button" value="Join" class="Join-button"/>
	    <br>
	  </div>
	</div>
</body>
</html>