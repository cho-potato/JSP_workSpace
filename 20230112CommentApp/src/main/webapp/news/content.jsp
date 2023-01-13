<%@page import="news.repository.CommentsDAO"%>
<%@page import="news.domain.Comments"%>
<%@page import="news.domain.News"%>
<%@page import="news.repository.NewsDAO"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	NewsDAO newsDAO = new NewsDAO();
	CommentsDAO commentsDAO = new CommentsDAO();
%>
<%
	String news_idx = request.getParameter("news_idx");
	News news = newsDAO.select(Integer.parseInt(news_idx));
	out.print(news);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/header_link.jsp"%>
<script type="text/javascript">
	$(function() {
		// 버튼에 이벤트 연결
		$($("button")[0]).click(function() { // 등록버튼
			$("#form1").attr({
				"action" : "/news/regist",
				"method" : "post"
			});
			$("#form1").submit();
		});
		$($("button")[1]).click(function() { // 목록버튼
			location.href="/news/list.jsp";
		});
		// 댓글 등록 버튼 이벤트 연결(form2 밑에 있는 ~)
		$("#form2 button").click(function() {
			$("#form2").attr({
				"action" : "/comments/regist",
				"method" : "post"
			});
			$("#form2").submit();
		});
	});
</script>
</head>
<body>
	<div class="container border mt-5">
		<form id="form1" class="was-validated">
			<input type="hidden" name="news_idx" value="<%=news.getNews_idx()%>">
			<h3>뉴ㅠㅠㅠㅠㅠㅠㅠㅠㅠ스ㅡㅡㅡㅡㅡㅡㅡ기ㅣㅣㅣㅣㅣㅣㅣㅣㅣ사ㅏㅏㅏㅏㅏㅏㅏㅏ</h3>
				<div class="row mt-5">
					<label for="title">제목</label> <input type="text" class="form-control" id="title" value="<%=news.getTitle() %>" name="title" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="row mt-5">
					<label for="writer">작성자</label> <input type="text" class="form-control" id="writer" value="<%=news.getWriter() %>" name="writer" required>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="row mt-5">
					<label for="content">내용입력</label>
					<textarea class="form-control" style="width: 100%; height: 300px" placeholder="Enter contents" id="content" name="content" required><%=news.getContent() %></textarea>
					<div class="valid-feedback">Valid.</div>
					<div class="invalid-feedback">Please fill out this field.</div>
				</div>
				<div class="row mt-2">
					<div class="col text-center">
						<button type="button" class="btn btn-danger">글등록</button>
						<button type="button" class="btn btn-warning">글목록</button>
					</div>
				</div>
			</form>
			<form id="form2">
				<input type="hidden" name="news_idx" value="<%=news.getNews_idx()%>">
				<div class="form-group row mt-5 justify-content-center">
					<div class="col-md-7">
						<input type="text" class="form-control" id="msg" placeholder="Enter re:msg" name="msg" required>
					</div>
					<div class="col-md-3 justify-content-center">
						<input type="text" class="form-control" id="author" placeholder="Enter re:writer" name="author" required>
					</div>
					<div class="col-md-2 justify-content-center">
						<button type="button" class="btn btn-danger">댓글등록</button>
					</div>
				</div>
				<div>
					<table class="table table-dark mt-5 text-center">
						<thead>
							<tr>
								<th width="50%">댓글내용</th>
								<th width="25%">작성자</th>
								<th width="25%">등록일</th>
							</tr>
						</thead>
						<tbody>
							<% for (int i = 0; i < news.getCommentsList().size(); i++) { %>
							<% Comments comments= news.getCommentsList().get(i); %>
							<tr>
								<td><%=comments.getMsg() %></td>
								<td><%=comments.getAuthor() %></td>
								<td><%=comments.getWritedate() %></td>
							</tr>
							<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</div>
</body>
</html>