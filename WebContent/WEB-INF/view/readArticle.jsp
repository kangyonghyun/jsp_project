<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	// 줄바꿈 
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%> 
<!DOCTYPE html>
<html>
<title>ReadArticle</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<!-- table Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">	
<style>
body,h1 {font-family: "Raleway", Arial, sans-serif}
h1 {letter-spacing: 6px}
.w3-row-padding img {margin-bottom: 12px}
</style>

<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />

<script>
	${ctxPath = pageContext.request.contextPath;''}

	$(document).on('click', 
					'#btnList', 
					function(e) {
						e.preventDefault();
						location.href = "${ctxPath}/article/list.do?pageNo=${pageNo}";
	});
	$(document)
			.on(
					'click',
					'#btnModify',
					function(e) {
						e.preventDefault();
						location.href = "${ctxPath}/article/modify.do?no=${articleData.article.number}";
					});
	$(document)
			.on(
					'click',
					'#btnDelete',
					function(e) {
						if(confirm("Are you sure you want to delete?")==true){
							e.preventDefault();
							location.href = "${ctxPath}/article/delete.do?no=${articleData.article.number}";
				        }
					});
</script>

<body>
	<!-- !PAGE CONTENT! -->
	<div class="w3-content" style="max-width: 650px">
		<!-- Header -->
		<jsp:include page="loginHeader.jsp"></jsp:include>
		<!-- content  -->
		<div class="w3-row-padding w3-grayscale" style="margin-bottom: 50px">
			<div class="ctable-responsive" role="main">
				<h1>Read Form</h1>
				<hr />
				<table border="1" class="table table-striped table-sm">
					<colgroup>
						<col style="width: 20%;" />
						<col style="width: auto;" />
					</colgroup>
					<tr>
						<th>NO</th>
						<td>${articleData.article.number}</td>
						<th style="width: 120px">WHO</th>
						<td>${articleData.article.writer.name}</td>
					</tr>
					<tr>
						<th>TITLE</th>
						<td colspan="3"><c:out value='${articleData.article.title}' /></td>
					</tr>
					<tr>
						<th style="background-color: white">CONTENT</th>
						<td colspan="3" style="background-color: white">${fn:replace(articleData.content, cn, br)}</td>
					</tr>
					<tr>
					<!-- button  -->
						<td colspan="4">
							<button type="button" class="btn btn-sm btn-primary" 
							id="btnList">List</button>
							<!-- 글쓴이와 맞을 경우 버튼 보임 -->
							<c:if test="${authUser.id == articleData.article.writer.id}">
								<button type="button" class="btn btn-sm btn-primary"
									id="btnModify">Modify</button>
								<button type="button" class="btn btn-sm btn-primary"
									id="btnDelete">Delete</button>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- 댓글 없을 경우-->
	<div class="w3-content" style="max-width: 650px">
		<table border="1" class="table table-striped table-sm">
		<!-- 댓글이 없을경우 -->
		<c:if test="${commentPage.hasNoComments()}">
				<tr>
					<td colspan="5">댓글이 없습니다.</td>
				</tr>
		</c:if>
		</table>
	</div>
	<!-- 댓글 있을 경우 -->
	<div class="w3-content" style="max-width: 650px; word-break:break-all;">
		<table border="1" class="table table-striped table-sm" style="max-width: 650px">
			<colgroup>
				<col style="width: 20%;" />
				<col style="width: auto%;" />
				<col style="width: 21%;" />
			</colgroup>
				<c:forEach var="comment" items="${commentPage.getCommentList() }">
				<tr>
					<td>${comment.comment_id}</td>
					<td>${fn:replace(comment.comment_content, cn, br)}</td>
					<td><fmt:formatDate value="${comment.moddate}" pattern="MM.dd hh:HH:ss"/></td>
				</tr>
				<c:if test="${authUser.id == articleData.article.writer.id}">
				<tr>
					<td colspan="3">
						<div style="text-align: right">
							<a href="${ctxPath}/comment/modify.do?no=${articleData.article.number}"
								style="text-decoration: underline">Modify</a> <a
								href="${ctxPath}/comment/deleteComment.do?no=${articleData.article.number}&cNo=${comment.comment_no}"
								style="text-decoration: underline">Delete</a>
						</div>
					</td>
				</tr>
				</c:if>	
			</c:forEach>
			<!-- 댓글 페이지 -->
			<%-- <c:if test="${commentPage.hasComments()}">
				<tr>
					<td colspan="4">
						<c:if test="${commentPage.startPage > 5}">
						<p>${commentPage.startPage}</p>
							<a href="read.do?no=${articleData.article.number}&cNo=${commentPage.startPage - 5}">[이전]</a>
						</c:if> 
						
						<c:forEach var="cNo" begin="${commentPage.startPage }" end="${commentPage.endPage }">
							<a href="read.do?no=${articleData.article.number}&cNo=${cNo}">[${cNo}]</a>
						</c:forEach> 
						
						<c:if test="${commentPage.endPage < commentPage.totalPages}">
							<a href="read.do?no=${articleData.article.number}&cNo=${commentPage.startPage + 5}">[다음]</a>
						</c:if>
					</td>
				</tr>
			</c:if> 	 --%>		
		</table>
	</div>
	<!-- 댓글 폼 -->
	<div class="w3-content" style="margin-bottom: 140px; max-width: 650px">
		<form method="post" action="${pageContext.request.contextPath}/comment/writeComment.do">
			<div class="mb-3">
				<label for="content"></label>
				<input type="hidden" name="article_no" value="${articleData.article.number}"/>
				<textarea class="form-control" rows="5" name="comment" id="content"></textarea>
			</div>
			<div>
				<button type="submit" class="btn btn-sm btn-primary" id="btnSave" style="float:right">Save</button>
			</div>
		</form>
	</div>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>

