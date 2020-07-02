<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<title>Write Form</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- input bootstrap  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">	
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- summer note -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<style>
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>
<script>
	${ctxPath = pageContext.request.contextPath;''}
	$(document).on('click', '#btnList', function(e) {
		e.preventDefault();
		location.href = "${ctxPath}/article/list.do";
	});
</script>
<body>
	<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 650px">
		<!-- Header -->
		<jsp:include page="articleHeader.jsp"></jsp:include>
		<!-- content -->
		<div class="w3-content" style="margin-bottom: 140px">
				<h1>Board Form</h1>
				<hr>
				<form method="post" action="write.do">
					<!-- title -->
					<div class="mb-3">
						<label for="title">TITLE</label> 
						<input type="text" class="form-control" name="title" id="title" style= ""placeholder="title...">
					</div>
					<!-- summer note -->
					<textarea name="content" id="summernote" class="summernote"></textarea>
					<script>
						$('#summernote').summernote({
							placeholder : 'write...',
							tabsize : 2,
							height : 200,
							onImageUpload: function(files, editor, welEditable) {
								sendFile(files[0], editor, welEditable)
								}
						});
					</script>
					<!-- button -->
					<div>
						<br>
						<button type="submit" class="btn btn-sm btn-primary" id="btnSave" style="margin-bottom: 3px">Save</button>
						<button type="button" class="btn btn-sm btn-primary" id="btnList" style="margin-bottom: 3px">List</button>
					</div>
				</form>
		</div>
	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

