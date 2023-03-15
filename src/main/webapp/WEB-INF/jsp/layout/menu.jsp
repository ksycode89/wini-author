<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<div class="mainHeader" style="display:flex;">
	 <div id = "headerLogo" style="width:75%;">
		<a href="<c:url value='/'/>">
		 	<img style = "width:150px; margin:20px 0px 20px 40px;" src = "<c:out value="${pageContext.request.contextPath}/images/wini_logo.png"/>"/>
		</a>
	 </div>
	 <div id="loginInfo" align="right" style="width:25%;">
	 	<span id="LoginUser"><c:out value = "${userInfo.userNm}"/></span>
	 	님 환영합니다.
	 	<a href="<c:url value='/logout.do'/>"  class="mainBtn" style="background-color: #d2322d;">로그아웃</a>
  	 	<a class = "mainBtn" style="background-color: #428bca;" onclick="chagePw();">비번변경</a>
	 </div>
</div>

<div class="manuBar_outer">
	<div class="manuBar_inner">
		<nav class='menu_nav'>
		</nav>
	</div>
</div>
<script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}/js/common/jquery1.9/jquery-1.9.1.js"/>"></script>
<script type="text/javascript" src="<c:out value="${pageContext.request.contextPath}/js/common/jquery1.9/jquery.form.js"/>"></script>


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/ui/themes/metro/easyui.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/ui/themes/icon.css"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ui/jquery.easyui.min.js"></script>
<script>
	$(function(){
		// menu list 조회
		$.ajax({
    		type: 'post',
    		url : "getMenu.do",
    		success:function(data){
    			var html = '<ul>';
    			if("${userInfo.userSn}"==1){ // 관리자일 경우 메뉴
    				// 1계층 for문 
        			for (var i=0; i<data.length; i++){
        				if (data[i].upperMenuId == "MENU"){
        					html += '<li><a href = "'+data[i].menuUrl+'">'+data[i].menuNm+'</a><ul>'
        					// 2계층 for문 
        	    			for (var j=i; j<data.length; j++){
        	    				if (data[j].upperMenuId == data[i].menuId){
        	    					html += '<li><a href = "'+data[j].menuUrl+'">'+data[j].menuNm+'</a></li>';
        	    				}
        	    			}html += '</ul></li>';
        				}
        			}
    			}else{ // 관리자가 아닐 경우 메뉴
    				// 1계층 for문 
        			for (var i=0; i<data.length; i++){
        				if (data[i].upperMenuId == "MENU" && data[i].menuRght == "N"){
        					html += '<li><a href = "'+data[i].menuUrl+'">'+data[i].menuNm+'</a><ul>'
        					// 2계층 for문 
        	    			for (var j=i; j<data.length; j++){
        	    				if (data[j].upperMenuId == data[i].menuId && data[i].menuRght == "N"){
        	    					html += '<li><a href = "'+data[j].menuUrl+'">'+data[j].menuNm+'</a></li>';
        	    				}
        	    			}html += '</ul></li>';
        				}
        			}
    			}
				
				html += '</ul>';
				$(".menu_nav").append(html);
    		}
    	});
	});
	// ajax로 menu_bar를 그린 후 hover 이벤트 함수
   $(document).on({
        mouseenter: function () {
			$('ul', this).stop().slideDown(200);
        },
        mouseleave: function () {
        	$('ul', this).stop().slideUp(200);
        }
    }, 'nav li');
    </script>