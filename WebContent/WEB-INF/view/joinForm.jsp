<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<title>Sign Up</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/css/aa.css">
	
<body>
<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 500px">
		<!-- Header -->
		<jsp:include page="logoutHeader.jsp"></jsp:include>
		<!-- Content -->
		<div class="w3-row-padding w3-grayscale" style="margin-bottom: 140px">
			<form action="join.do" method="post">
				<div class="container">
					<h1>Sign Up</h1>
					<p>Please fill in this form to create an account.</p>
					<hr>
					<label for="id"><b>ID</b></label> 
					<input type="text" placeholder="Enter ID" name="id" value="${param.id}" required>
					<c:if test="${errors.id}">Input ID.</c:if>
					<c:if test="${errors.duplicateId}">This ID is already in use. Please enter a different ID.</c:if>
					<br>
					<label for="name"><b>Name</b></label> 
					<input type="text" placeholder="Enter Name" name="name" value="${param.name}" required>
					<c:if test="${errors.name}">Input name.</c:if>
					<br>
					<label for="psw"><b>Password</b></label> 
					<input type="password" placeholder="Enter Password" name="password" required>
					<c:if test="${errors.password}">Input password</c:if>
					<br>
					<label for="psw-confirm"><b>Repeat Password</b></label> 
					<input type="password" placeholder="Repeat Password" name="confirmPassword" required>
					<c:if test="${errors.confirmPassword}">Please confirm your password again.</c:if>
					<c:if test="${errors.notMatch}">Passwords do not match.</c:if>
					<br>	
					<label for="email"><b>Email</b></label> 
					<input type="text" placeholder="Enter Email" name="email" required>
					<c:if test="${errors.email}">Input email.</c:if>
					<br>
					<label> <input type="checkbox" checked="checked"
							name="remember" style="margin-bottom: 15px"> Remember me
					</label>
					<div class="clearfix">
						<button type="button"
							onclick="document.getElementById('id01').style.display='none'"
							class="cancelbtn">Cancel</button>
						<button type="submit" class="signupbtn">Sign Up</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>



