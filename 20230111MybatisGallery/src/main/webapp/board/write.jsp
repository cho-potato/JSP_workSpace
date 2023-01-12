<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
<%@ include file="/inc/header_link.jsp" %>
<script type="text/javascript">
function regist() {
	$("#form1").attr({
		"action" : "/board/regist",
		"method" : "post",
		// enctype 적용 안할 경우 기본 값 : application/x-www-form-urlencoded
		"enctype" : "multipart/form-data"
		});
	$("#form1").submit();
}
	$(function () {
	    ClassicEditor
        .create( document.querySelector( '#content' ) )
        .catch( error => {
            console.error( error );
        } );
		// 버튼에 이벤트 연결
		$($("button")[0]).click(function() {
			regist();
		});
		$($("button")[1]).click(function() {
			alert("목록할 예정");
		});
	});
</script>

</head>
<body>
	<div class = "container mt-2">
		<form id="form1">
			<div class="row text-center">
				<h3>글등록</h3>
			</div>
			<div class="row mt-2">
				<input type="text" class="form-control" placeholder="제목 입력" name="title">
			</div>
			<div class="row mt-2">
				<input type="text" class="form-control" placeholder="작성자 입력" name="writer">
			</div>
			<div class="row mt-2">
				<textarea style="width:100%" id="content" name="content"></textarea>
			</div>
			<div class="row mt-2">
				<input type="file" class="form-control" name="file">
			</div>
			<div class="row mt-2">
				<div class="col text-center">
					<button class="btn btn-warning">글등록</button>
					<button class="btn btn-warning">글목록</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>