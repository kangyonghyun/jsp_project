<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<title>Logout</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<body>

	<u:isLogin>

		<!-- !PAGE CONTENT! -->
		<div class="w3-content" style="max-width: 1500px">

			<!-- Header -->
			<jsp:include page="loginHeader.jsp"></jsp:include>

		</div>

	</u:isLogin>

	<u:notLogin>

		<!-- !PAGE CONTENT! -->
		<div class="w3-content" style="max-width: 1500px">

			<!-- Header -->
			<jsp:include page="logoutHeader.jsp"></jsp:include>

			<div class="w3-row-padding w3-grayscale" style="margin-bottom: 140px">
				<h2 style="text-align: center">${authUser.name},ByeBye!!</h2>
			</div>

		</div>

	</u:notLogin>

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
