<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<title>Login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/css/aa.css">	
<body>
	<u:isLogin>
		<!-- !PAGE CONTENT! -->
		<div class="w3-content" style="max-width: 500px">
			<!-- Header -->
			<jsp:include page="loginHeader.jsp"></jsp:include>
			<!-- Content -->
			<div class="w3-row-padding w3-grayscale" style="margin-bottom: 140px">
				<h1 style="text-align: center">Logout please!!</h1>
			</div>
		</div>
	</u:isLogin>

	<u:notLogin>
		<!-- !PAGE CONTENT! -->
		<div class="w3-content" style="max-width: 500px">
			<!-- Header -->
			<jsp:include page="logoutHeader.jsp"></jsp:include>
			<!-- Content -->
			<div class="w3-row-padding w3-grayscale" style="margin-bottom: 140px">
				<form class="modal-content" action="login.do" method="post">
					<div class="container">
						<h1>Login</h1>
						<hr>
						<label for="id"><b>ID</b></label> 
						<input type="text" placeholder="Enter ID" name="id" required> 
						<label for="psw"><b>Password</b></label> 
						<input type="password" placeholder="Enter Password" name="password" required>
						<c:if test="${errors.idOrPwNotMatch}"><b style ="color:tomato">ID or password does not match.</b></c:if>
						<div class="clearfix">
							<button type="button"
								onclick="document.getElementById('id01').style.display='none'"
								class="cancelbtn">Cancel</button>
							<button type="submit" class="signupbtn">Login</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</u:notLogin>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

