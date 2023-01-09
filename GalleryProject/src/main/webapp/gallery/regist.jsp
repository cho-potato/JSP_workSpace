<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리 등록</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	function regist() {
		// 서버에 파일(바이너리 형식의 파일)을 포함한 폼을 전송한다
		$("form").attr({
			"action" : "/gallery/upload.jsp",
			"method" : "post",
			// 폼 양식에 바이너리 파일이 포함된 경우 반드시 !!!!!! 지정 !! 암기사항 ("enctype" : "multipart/form-data")
			"enctype" : "multipart/form-data"
		});
		$("form").submit(); // 서버에 전송되려면 전송변수가 있어야 함 
	}

	$(function() {
		$($("input[type='button']")[0]).click(function() {
			regist();
		});
		$($("input[type='button']")[1]).click(function() {

		});
	});
</script>
</head>
<body>
	<form>
		<table>
			<tr>
				<td><input type="text" placeholder="제목" name="title"></td>
			</tr>
			<tr>
				<td><input type="text" placeholder="작성자" name="writer"></td>
			</tr>
			<tr>
				<td><textarea placeholder="내용" name="content"></textarea></td>
			</tr>
			<tr>
				<td><input type="file" name="file"></td>
			</tr>
			<tr>
				<td><input type="button" value="등록"> <input
					type="button" value="목록"></td>
			</tr>
		</table>
	</form>
</body>
</html>