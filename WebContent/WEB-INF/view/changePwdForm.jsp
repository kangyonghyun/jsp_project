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
		<!-- !PAGE CONTENT! -->
		<div class="w3-content" style="max-width: 500px">
			<!-- Header -->
			<jsp:include page="loginHeader.jsp"></jsp:include>
		<!-- Content -->
		<div class="w3-row-padding w3-grayscale" style="margin-bottom: 140px">
			<form class="modal-content" action="changePwd.do" method="post">
				<div class="container">
					<h1>Password Change</h1>
					<hr>
					<label for="curPsw"><b>Current Password</b></label> 
					<input type="password" placeholder="Enter Current Password" name="curPwd" required>
					<br> 
					<c:if test="${errors.curPwd}">Input current password</c:if>
					<c:if test="${errors.badCurPwd}">Passwords do not match</c:if>
					<br>
					<label for="newPsw"><b>New Password</b></label> 
					<input type="password" placeholder="Enter New Password" name="newPwd" required>
					<div class="clearfix">
					<button type="button" onclick="document.getElementById('id01').style.display='none'"
						class="cancelbtn">Cancel</button>
					<button type="submit" class="signupbtn">Save</button>
					</div>
				</div>
			</form>
		</div>
		</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

