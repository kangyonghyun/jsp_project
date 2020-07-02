<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<title>Index</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/css/index.css">
</head>
<body>
 <!-- login -->
	<u:isLogin>
		<!-- !PAGE CONTENT! -->
		<div class="w3-content" style="max-width: 500px">
			<!-- Header -->
			<jsp:include page="WEB-INF/view/loginHeader.jsp"></jsp:include>
			<!-- Content -->
			<div class="w3-content" style="margin-bottom: 140px">
				<h1>${authUser.name}, Welcome to Homepage!!</h1>
			</div>
		</div>
	</u:isLogin>
	
 <!-- logout -->
	<u:notLogin>
		<!-- !PAGE CONTENT! -->
		<div class="w3-content" style="max-width: 500px">
			<!-- Header -->
			<jsp:include page="WEB-INF/view/logoutHeader.jsp"></jsp:include>
			<!-- Content -->
			<div class="w3-row-padding w3-grayscale" style="margin-bottom: 140px">
				<h1>Login please!</h1>
			</div>
		</div>
	</u:notLogin>

	<!-- Footer -->
	<jsp:include page="WEB-INF/view/footer.jsp"></jsp:include>

</body>
</html>
