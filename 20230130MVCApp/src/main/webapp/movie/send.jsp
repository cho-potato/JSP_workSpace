<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send() {
		// 서버에 폼 전송하기 
		// window.document.form1.action=""; => window.document가 한 몸이니까 써줄 필요 없음
		// form1.action="/blood/result.jsp";
		form1.action="/movie.do"; // web.xml에서 매핑할 때 /blood라고 했으므로
		form1.method="post";
		form1.submit();
	}
</script>
</head>
<body>
	<form name="form1">
		<select name="movie">
			<option value="해리포터">해리포터</option>
			<option value="리포터해">리포터해</option>
			<option value="포터해리">포터해리</option>
			<option value="터해리포">터해리포</option>
		</select>
	</form>
	<p>
	<button type="button" onClick="send()">분석요청</button>
</body>
</html>