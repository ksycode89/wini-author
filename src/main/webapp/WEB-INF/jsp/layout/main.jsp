<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<page:applyDecorator name="common"/>
</head>
<body>
<page:applyDecorator name="defaultHeader"/>
<decorator:body/> 
<page:applyDecorator name="defaultFooter"/>
</body>
</html>