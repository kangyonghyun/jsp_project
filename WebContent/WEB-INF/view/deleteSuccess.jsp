<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<title>ListArticle</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
	<link rel="stylesheet" type="text/css"
	href="<%=application.getContextPath()%>/css/aa.css">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script>
	${ctxPath = pageContext.request.contextPath;''}
	$(document).on('click', '#btnList', function(e) {
		e.preventDefault();
		location.href = "${ctxPath}/article/list.do";
	});


</script>


<body>
	<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 500px; margin-bottom: 140px">

		<!-- Header -->
		<jsp:include page="articleHeader.jsp"></jsp:include>

		<h1 style="text-align: center">Delete success!!</h1>
		<br><br><br>
		<button type="button" class="btn btn-sm btn-primary" id="btnList">List</button>

	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
