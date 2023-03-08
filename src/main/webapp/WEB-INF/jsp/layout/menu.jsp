<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
 
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
    </script>