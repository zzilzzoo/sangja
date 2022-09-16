<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>
	<label>제목</label> ${view.title}
	<br />
	<label>작성자</label> ${view.writer}
	<br />
	<label>내용</label> ${view.content}
	<br />

	<div>
		<a href="/board/modify?bno=${view.bno}">게시물 수정</a>, <a
			href="/board/delete?bno=${view.bno}">게시물 삭제</a>
	</div>

	<hr />

	<ul>
		<li>첫번째 댓글</li>
		<li>두번째 댓글</li>
		<li>세번째 댓글</li>
	</ul>
	<c:forEach items="${reply}" var="reply">
		<li>
			<div>
				<p>${reply.writer}/
					<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" />
				</p>
				<p>${reply.content }</p>
			</div>
		</li>
	</c:forEach>
	<div>
		<form method="post" action="/reply/write">
			<p>
				<label>댓글 작성자</label> <input name="writer" type="text">
			</p>
			<p>
				<textarea rows="5" cols="50" name="content"></textarea>
			</p>
			<p>
			<input type="hidden" name="bno" value="${view.bno}">
			
				<button type="submit">댓글 작성</button>
			</p>
		</form>

	</div>
</body>
</html>