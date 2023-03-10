<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<style>
#loginInfo{
	align-self: center;
}
.mainBtn{
  margin-right:10px;
  text-decoration: none;
  color: white;
  padding: 5px 10px;
  display: inline-block;
  position: relative;
  border: 1px solid rgba(0,0,0,0.21);
  border-radius: 4px;
  text-shadow: 0 1px 0 rgba(0,0,0,0.15);
  cursor: pointer;
}
.manuBar_outer{
 background-color: #2ba0db; width:100vw; height:50px
}
.manuBar_inner{
 background-color: #2ba0db; width:60%; height:50px; margin:auto;
}
</style>
<div class="mainHeader" style="display:flex;">
	 <div id = "headerLogo" style="width:75%;">
		 <img style = "width:150px; margin:20px 0px 20px 40px;" src = "<c:out value="${pageContext.request.contextPath}/images/wini_logo.png"/>"/>
	 </div>
	 <div id="loginInfo" align="right" style="width:25%;">
	 	<span id="LoginUser"><c:out value = "${userNm}"/></span>
	 	님 환영합니다.
	 	<a href="<c:url value='/logout.do'/>"  class="mainBtn" style="background-color: #d2322d;">로그아웃</a>
<!-- 	 	<a class="mainBtn" style="background-color: #d2322d;" onclick="logout();">로그아웃</a> -->
  	 	<a class = "mainBtn" style="background-color: #428bca;" onclick="chagePw();">비번변경</a>
	 </div>
</div>
<div class="manuBar_outer">
	<div class="manuBar_inner">
		<nav class='menu_nav'>
			<ul>
			 	<li><a href="./">메인</a></li>
	            <li><a href="">시스템관리</a>
	            <li><a href="">장비관리</a>
	            <li><a href="">장비관리</a>
			</ul>
		</nav>
	</div>
</div>
<nav class='menu_nav'>
    <div class="container">
        <ul>
        <!-- main으로 보낼방법 생각하기 -->
            <li><a href="./">메인</a></li>
            <li> <a href="">시스템관리</a>
                <ul>
                    <li><a href="<c:out value="${pageContext.request.contextPath }"/>/userMgmt.do">>사용자관리</a></li>
                    <li><a href="">메뉴관리</a></li>
                    <li><a href="">사원관리</a></li>
                </ul>
            </li>
            <li > <a href="">장비관리</a>
                <ul>
                    <li><a href="./goEqment.do">장비공통코드</a></li>
	                <li><a href="./goEqment.do">장비관리</a></li>
                </ul>
            </li>
            <li > <a href="">통계</a>
                <ul>
                    <li><a href="">장비통계(K)</a></li>
                    <li><a href="">장비점검(J)</a></li>
                    <li><a href="">장비점검(P)</a></li>
                </ul>
            </li>
        </ul>
    </div>
</nav>
<script>
    $('nav li').hover(
        function() {
            $('ul', this).stop().slideDown(200);
        },
        function() {
            $('ul', this).stop().slideUp(200);
        }
    );
//     function logout(){
//     	$.ajax.
//     }
    </script>