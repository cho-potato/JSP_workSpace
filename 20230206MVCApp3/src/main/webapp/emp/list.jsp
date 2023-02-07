<%@page import="com.mvc3.domain.Emp"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%
	List<Emp> empList = (List)request.getAttribute("empList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
function del() {
	if(confirm("삭제?")) {
		// 입력 양식(체크박스)이 있으니까 POST로 가자
		$("#form1").attr({
			action : "/emp/delete.do",
			method : "POST"
		});
		$("#form1").submit();
	}
}

$(function() {
	$("#bt_del").click(function() {
		del();
	});
});

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th></th>
							<th>부서명</th>
							<th>사원명</th>
							<th>급ㅂ여</th>
						</tr>
					</thead>
					<tbody>
					<form id="form1">
					<%for(Emp emp : empList) { %>
						<tr>
						<td>
						<!-- <input type="checkbox"> -->
							<input type="checkbox" name="empno" value="<%=emp.getEmpno()%>">
							
						</td>
							<td><%=emp.getDept().getDname() %></td>
							<td><%=emp.getEname() %></td>
							<td><%=emp.getSal() %></td>
						</tr>
						<%} %>
						</form>
						<tr>
							<td>
								<button type="button" class="btn btn-warning" id="bt_del">Warning</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>