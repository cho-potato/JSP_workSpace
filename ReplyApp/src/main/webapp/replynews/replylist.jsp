<%@page import="reply.util.PageManager"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	PageManager pm = new PageManager();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/replyinc/replyheader_link.jsp"%>
</head>
<body>

	<div class="container">
		<h2>기ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ사ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ</h2>
		<table class="table mt-3 border text-center">
			<thead class="thead-dark">
				<tr>
					<th>No</th>
					<th width="50%">제목</th>
					<th>성자</th>
					<th>록일</th>
					<th>회수</th>
				</tr>
			</thead>
			<tbody>
			<%
				int num = pm.getNum();
				int curPos = pm.getCurPos();
			%>
			<%for(int i =1; i<=pm.getPageSize(); i++) { %>
			<%if(num < 1) break; %>
				<tr>
					<td><%=num-- %></td>
					<td>john</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
					<td>john@example.com</td>
				</tr>
				<%} %>
				<tr>
					<td colspan="5">
					<!-- 페이지 넘버 -->
						<ul class="pagination justify-content-center">
							<li class="page-item"><a class="page-link" href="#">PREV</a></li>
							<%for(int i=pm.getFirstPage(); i<=pm.getLastPage(); i++) { %>
							<%if(i>pm.getTotalPage()) break; %>
							<li class="page-item<%if(i==pm.getCurrentPage()) { %> active<%}%>"><a class="page-link" href="/replynes/replylist.jsp?currentPage=<%=i%>"><%=i%></a></li>
							<%} %>
							<li class="page-item"><a class="page-link" href="#">NEXT</a></li>
						</ul>
					</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="btn btn-success justify-content-center">등록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>