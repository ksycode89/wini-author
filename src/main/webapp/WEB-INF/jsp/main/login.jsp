<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- jQuery -->
	<script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}/js/common/jquery1.9/jquery-1.9.1.js"/>"></script>
<!-- CSS -->
	<link type="text/css" rel="stylesheet" href="<c:out value="${pageContext.request.contextPath}/css/member.css"/>"/>
</head>
<body>

	<div class="login">
	  <div class="login-header">
<!-- 	    <h1>Login</h1> -->
	  	<img style = "width:400px;" src = "<c:out value="${pageContext.request.contextPath}/images/wini_logo.png"/>"/>
	  </div>
	  <div class="login-form">
	    <h3>Username:</h3>
	    <input type="text" placeholder="Username"/><br>
	    <h3>Password:</h3>
	    <input type="password" placeholder="Password"/>
	    <br>
	    <input type="checkbox" value="remember"/>아이디 저장
	    <br>
	    <input type="button" value="Login" class="login-button"/>
	    <br>
	    <a class="sign-up" onclick="joinMember();">회원가입</a>
	    <br>
	    <a class="sign-up">아이디/비밀번호 찾기</a>
	    <br>
	  </div>
	</div>
	
</body>
<script>
	// 회원가입 popup창 띄우기
	function joinMember(){
		var url = "${pageContext.request.contextPath}"+"/goJoinMember.do";
		window.open(url, '회원가입', 'width=700px,height=800px,scrollbars=yes');
	}
</script>
</html>
