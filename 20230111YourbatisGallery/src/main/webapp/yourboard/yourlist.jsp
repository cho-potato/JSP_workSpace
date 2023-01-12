<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/yourinc/yourheader_link.jsp"%>
</head>
<body>
	<div class="container-fluid mt-2">
		<table class="table table-dark table-hover">
			<thead>
				<tr>
					<th>No</th>
					<th>이미지</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<%for (int i = 1; i <= 10; i++) {%>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
				</tr>
				<%} %>
				<tr>
					<td colspan="6">
						<button class="btn btn-warning">글등록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>