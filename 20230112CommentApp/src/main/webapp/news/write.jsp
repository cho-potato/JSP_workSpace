<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/inc/header_link.jsp"%>
<script type="text/javascript">
	$(function () {
		// 버튼에 이벤트 연결
		$($("button")[0]).click(function() { // 등록버튼
			$("#form1").attr({
				"action" : "/news/regist",
				"method" : "post"				
			});
		$("#form1").submit();
		});
		$($("button")[1]).click(function() { // 목록버튼
			alert("목록할 예정");
		});
	});
</script>
</head>
<body>
	<div class="container mt-5">
		<form id="form1" class="was-validated">
			<h3>뉴ㅠㅠㅠㅠㅠㅠㅠㅠㅠ스ㅡㅡㅡㅡㅡㅡㅡ기ㅣㅣㅣㅣㅣㅣㅣㅣㅣ사ㅏㅏㅏㅏㅏㅏㅏㅏ</h3>
			<div class="row mt-5">
				<label for="title">제목</label> <input type="text" class="form-control" id="title" placeholder="Enter title" name="title" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="row mt-5">
				<label for="writer">작성자</label> <input type="text" class="form-control" id="writer" placeholder="Enter writer" name="writer" required>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="row mt-5">
				<label for="content">내용입력</label>
				<textarea  class="form-control" style="width:100%; height:300px" placeholder="Enter contents" id="content" name="content" required></textarea>
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Please fill out this field.</div>
			</div>
			<div class="row mt-5">
				<div class="col text-center">
						<button type="button" class="btn btn-danger">글등록</button>
						<button type="button" class="btn btn-warning">글목록</button>
				</div>
			</div>
		</form>
	</div>

</body>
</html>