<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
	.mainContainerC{
		border: solid;
		width: 1200px;
		height: 500px;
	}
	.forDetail{
		display: flex;
		justify-content: space-around; 
		width: 1000px;
		height: 300px;
		
	}
	.datail_div{
			flex-basis: 48%;
			border: solid;
	}
	.for_eqmnM{
		border: solid;
		width: 1000px;
		height: 150px;
	}
</style>
<body>

	<div class='mainContainerC'>
		<div class='for_eqmnM'>
			top and search
		</div>
		<div class='forDetail'>
			<div class='datail_div'>collect</div>
			<div class='datail_div'>detail</div>
		</div>
	</div>
</body>
</html>