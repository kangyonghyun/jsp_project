<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="article.model.Article"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<title>ListArticle</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- table bootsrap  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- css -->	
<link rel="stylesheet" type="text/css" href="<%=application.getContextPath()%>/css/aa.css">	
<script>
	${ctxPath = pageContext.request.contextPath;''}
	$(document).on('click', '#btnWriteForm', function(e) {
		e.preventDefault();
		location.href = "${ctxPath}/article/write.do";
	});
</script>

<body>
	<u:isLogin>
		<!-- !PAGE CONTENT! -->
		<div class="w3-content" style="max-width: 750px">
			<!-- Header -->
			<jsp:include page="loginHeader.jsp"></jsp:include>
			<!-- Content -->
			<div class="container" style="margin-bottom: 140px">
				<div class="table-responsive">
					<h1>Board list</h1>
					<hr>
					<table border="1" class="table table-striped table-sm">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: auto;" />
							<col style="width: 15%;" />
							<col style="width: 10%;" />
							<col style="width: 30%;" />
						</colgroup>
						<tr>
							<th>NO</th>
							<th>TITLE</th>
							<th>WHO</th>
							<th>VIEWS</th>
							<th>DATE</th>
						</tr>
						<!-- 게시글이 없을 경우  -->
						<c:if test="${articlePage.hasNoArticles()}">
							<tr>
								<td colspan="5">NO. Board Message</td>
							</tr>
						</c:if>
						<!-- 게시글이 있을 경우 게시글 나열-->
						<c:forEach var="article" items="${articlePage.content}">
							<tr>
								<td>${article.number}</td>
								<td>
									<a href="read.do?no=${article.number}&pageNo=${articlePage.currentPage}">
										<c:out value="${article.title}" />
									</a>
								</td>
								<td>${article.writer.name}</td>
								<td>${article.readCount}</td>
								<td><fmt:formatDate var="resultRegDt"
										value="${article.modifiedDate}" pattern="MM.dd hh:mm" />
									${resultRegDt}</td>
							</tr>
						</c:forEach>
						<!-- 페이지수 -->
						<c:if test="${articlePage.hasArticles()}">
							<tr>
								<td colspan="5">
									<c:if test="${articlePage.startPage > 5}">
										<a href="list.do?pageNo=${articlePage.startPage - 5}">[pre]</a>
									</c:if>
									<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage}">
										<a href="list.do?pageNo=${pNo}">[${pNo}]</a>
									</c:forEach> 
									<c:if test="${articlePage.endPage < articlePage.totalPages}">
										<a href="list.do?pageNo=${articlePage.startPage + 5}">[next]</a>
									</c:if>
								</td>
							</tr>
						</c:if>
						<!-- 쓰기 버튼 -->
						<tr>
							<td colspan="5">
								<button class="btn btn-sm btn-primary" id="btnWriteForm">Write</button>
							</td>
						</tr>
					</table>
				</div>
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
				<h1 style="text-align: center">Login please!</h1>
			</div>
		</div>
	</u:notLogin>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
