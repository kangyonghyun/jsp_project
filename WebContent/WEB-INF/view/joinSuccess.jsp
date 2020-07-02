<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/css/aa.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script>
	$(document).on('click', '#btnLogin', function(e) {
		e.preventDefault();
		location.href = "login.do";
	});
</script>

<body>
	<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 500px;margin-bottom: 140px">
		<!-- Header -->
		<jsp:include page="logoutHeader.jsp"></jsp:include>
		<!-- Content  -->
		<div class="container">
			<h1 style="text-align: center">Hello~Login please!</h1>
			<br><br><br>
			<button type="button" class="btn btn-sm btn-primary" id="btnLogin">Login</button>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</html>
