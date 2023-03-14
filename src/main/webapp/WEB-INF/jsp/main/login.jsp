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
	  	<img style = "width:400px;" src = "<c:out value="${pageContext.request.contextPath}/images/wini_logo.png"/>"/>
	  </div>
	  <form id="goLogin-form" name="goLogin-form" method="post">
		  <div class="login-form">
		    <h3>UserID:</h3>
		    <input id="user_id" type="text" placeholder="아이디를 입력하세요." onkeyup="if(window.event.keyCode==13){goLogin()}"/><br>
		    <h3>Password:</h3>
		    <input id="user_pw" type="password" placeholder="패스워드를 입력하세요." onkeyup="if(window.event.keyCode==13){goLogin()}"/>
		    <br>
		    <input id="remember_chk" type="checkbox" value="remember"/>아이디 저장
		    <br>
		    <input type="button" value="Login" class="login-button" onclick="goLogin();"/>
		    <br>
		    <a class="sign-up" onclick="joinMember();">회원가입</a>
		    <br>
		    <a class="sign-up" onclick="findMember();">아이디 찾기/비밀번호 초기화</a>
		    <br>
		  </div>
	  </form>
	</div>
	
</body>
<script>
	$(function() {
		rememberChk();
	});
	// 아이디 기억하기 체크여부확인
    function rememberChk(){
        var cookieId = getCookie("rememberId");
        console.log(cookieId);
        if(cookieId !="" && cookieId != undefined){
            $("input:checkbox[id='remember_chk']").prop("checked", true);
            $('#user_id').val(cookieId);
        }
    }
    // 쿠키 생성하기
    function setCookie(name, value) {
        var date = new Date();
        date.setTime(date.getTime() + 86400e3);
        document.cookie = encodeURIComponent(name) + '=' + encodeURIComponent(value) + ';expires=' + date.toUTCString() + ';path=/';
    }
    // 쿠키 가져오기
    function getCookie(name){
    	if(document.cookie.length>0){
    		var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
    		return value[2];
    	}
    }
  	//쿠키 삭제하기
    function deleteCookie(name) {
  		document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT; path=/;';
    }
	// 회원가입 popup창 띄우기
	function joinMember(){
		var url = "${pageContext.request.contextPath}"+"/goJoinMember.do";
		window.open(url, '회원가입', 'width=700px,height=800px,scrollbars=yes');
	}
	// 아이디/비밀번호 찾기 popup창 띄우기
	function findMember(){
		var url = "${pageContext.request.contextPath}"+"/goFindMember.do";
		window.open(url, '아이디&비밀번호 찾기', 'width=700px,height=800px,scrollbars=yes');
	}
	// 로그인 실행
	function goLogin(){
		// ID와 PW 입력되어있는지 chk
		if($('#user_id').val().trim()==0){
			alert("아이디를 입력하세요.")
			return;
		}else if($('#user_pw').val().trim()==0){
			alert("패스워드를 입력하세요.")
			return;
		}
		// ajax
		$.ajax({
			type : 'post',
			url : 'userLogin.do',
			data : {
					userId : $('#user_id').val(),
					userPw : $('#user_pw').val()
					},
			success:function(chk){
				if (chk=="Y"){
					alert("로그인 성공");
					// cookie
					if($('#remember_chk').is(':checked')==true){
						setCookie("rememberId", $('#user_id').val());
					}else{
						deleteCookie("rememberId");
					}
					location.href="${pageContext.request.contextPath}"; // 로그인 성공시 main페이지 호출
				}else{
					alert("로그인 실패");
				}
			},
			error:function(err){
				console.log("err : ",err);
			}
		});
	}
</script>
</html>
