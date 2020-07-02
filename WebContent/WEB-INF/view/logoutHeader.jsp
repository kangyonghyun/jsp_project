<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogoutHeader</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<header class="w3-panel w3-center w3-opacity" style="padding: 30px 16px 20px">
		<h1 class="w3-xlarge">PHOTOGRAPHER</h1>
		<h1>John Doe</h1>
		<br>
		${ctxPath = pageContext.request.contextPath ; ''}
		<div style= "text-align: center; border-style: none">
			<a href="${ctxPath}/join.do" style="border-style: none">Sign up</a> |
			<a href="${ctxPath}/login.do">Login</a> |	
			<a href="${ctxPath}/logout.do">Logout</a> |
			<a href="${ctxPath}/login.do">Password Change</a>
		</div>
		<div class="w3-padding-32">
			<div class="w3-bar w3-border">
				<a href="${ctxPath}/index.jsp" class="w3-bar-item w3-button">Home</a>
				<a href="${ctxPath}/#" class="w3-bar-item w3-button w3-light-grey">Photo</a>
				<a href="list.do" class="w3-bar-item w3-button w3-hide-small">Board</a>
			</div>
		</div>
	</header>
</body>
</html>