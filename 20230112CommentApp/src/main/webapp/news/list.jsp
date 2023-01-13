<%@page import="news.repository.NewsDAO"%>
<%@ page import="news.util.PageManager" %>
<%@page import="news.domain.News"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%!
	PageManager pm = new PageManager();
	NewsDAO newsDAO = new NewsDAO();
%>
<%
	List<News> newsList = newsDAO.selectAll();
	pm.init(newsList, request);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/header_link.jsp"%>
</head>
<body>
	<div class="container">
		<table class="table mt-3 border text-center">
			<thead class="thead-light">
				<tr>
					<th>No</th>
					<th width="50%">뉴스제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<%
				int num = pm.getNum();
				int curPos = pm.getCurPos();
			%>
			<%for(int i = 1; i<=pm.getPageSize(); i++) { %>
			<%if(num<1) break; %>
			<%News news = newsList.get(curPos++); %>
				<tr>
					<td><%=num-- %></td>
					<td ><a href="/news/content.jsp?news_idx=<%=news.getNews_idx()%>">감자에싹이나서잎이나서 [가위바위보]</a></td>
					<td><%=news.getWriter() %></td>
					<td><%=news.getRegdate().substring(0, 10)%></td>
					<td><%=news.getHit() %></td>
				</tr>
				<%} %>
				<tr>
					<td colspan="5">
					<!-- 페이징 넘버 올 곳 -->
			  			<ul class="pagination justify-content-center">
				 		   <li class="page-item"><a class="page-link" href="#">PREV</a></li>
							<%for(int i = pm.getFirstPage(); i<=pm.getLastPage(); i++) {%>
							<%if(i>pm.getTotalPage()) break; %>
						    <li class="page-item<%if(i==pm.getCurrentPage()) { %> active<%}%>"><a class="page-link" href="/board/list.jsp?currentPage=<%=i%>"><%=i %></a></li>
						    <%} %>
					   	 <li class="page-item"><a class="page-link" href="#">NEXT</a></li>
					  </ul>
					</td>
				</tr>
					<tr>
						<td>
						<!-- 버튼 올 곳 -->
						<button type="button" class="btn btn-outline-info justify-content-center">글등록</button>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>