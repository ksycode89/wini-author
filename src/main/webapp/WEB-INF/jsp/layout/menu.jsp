<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:out value='${pageContext.request.contextPath}'/>/js/common/jquery1.9/jquery-1.9.1.js"></script>
  <style>

        body {
            background: #fafafa;
            margin: 0;
        }

        a { text-decoration: none; }



        nav { background: #2ba0db; }

        nav ul {
            margin: 0;
            padding: 0;
        }

        nav ul li {
            display: inline-block;
            position: relative;
           
        }

        nav ul li a {
            color: #fff;
            display: block;
       		 padding: 15px 15px;
        }

        nav ul li:hover { background: #126d9b; }

        nav ul li ul {
            display: none;
            position: absolute;
            width: 150px;
        }

        nav ul li ul li {
            display: block;
        }


        nav ul li ul li a {
            background: #373737;
            display: block;
            padding: 15px 15px;
        }

        nav ul li ul li a:hover { background: #126d9b; }

    </style>
</head>

<body>
<nav>
    <div class="container">
        <ul>
        <!-- main으로 보낼방법 생각하기 -->
            <li><a href="./">메인</a></li>
            <li> <a href="">시스템관리</a>
                <ul>
                    <li><a href="">사용자관리</a></li>
                    <li><a href="">메뉴관리</a></li>
                    <li><a href="">사원관리</a></li>
                </ul>
            </li>
            <li > <a href="">장비관리</a>
                <ul>
                    <li><a href="">장비관리</a></li>
                    <li><a href="">장비점검</a></li>
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
</body>
</html>