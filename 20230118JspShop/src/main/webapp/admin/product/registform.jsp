<%@page import="com.jspshop.domain.Admin"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%
// DB化 해야하는데 product에 해당하는 컬럼이 없어서 
	String[] sizeList = {"XS","S","M","L","XL", "XXL"};
	String[] colorList = {"베이지","네이비","브라운","블랙"};
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>AdminLTE 3 | Dashboard</title>
<%@ include file="/admin/inc/header_link.jsp"%>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">
		<!-- Preloader -->
		<%@ include file="/admin/inc/preloader.jsp"%>
		<!-- Navbar -->
		<%@ include file="/admin/inc/navbar.jsp"%>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<%@ include file="/admin/inc/sidebar_left.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1 class="m-0">Dashboard</h1>
						</div>
						<!-- /.col -->
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="#">Home</a></li>
								<li class="breadcrumb-item active">Dashboard v1</li>
							</ol>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="col">
						<form id="form1">
							<div class="form-group">
	                 		   <select class="form-control" id="category"></select>
	                  		</div>
							<div class="form-group">
	                 		   <input type="text" class="form-control"  id="product_name" placeholder="상품명">
	                  		</div>
							<div class="form-group">
	                 		   <input type="text" class="form-control" id="brand" placeholder="브랜드">
	                  		</div>
	                  		<div class="form-group">
	                 		   <input type="number" class="form-control" id="price" placeholder="가격">
	                  		</div>
							<div class="form-group">
	                 		   <input type="number" class="form-control" id="discount" placeholder="할인가">
	                  		</div>
	                  		<div class="form group">
	                  			<%for (int i = 0; i<sizeList.length; i++) {%>
									<div class="icheck-primary d-inline">
										<input type="checkbox" id="checkboxPrimary<%=i %>"  name="size" value="<%=sizeList[i]%>" >
										<label for="checkboxPrimary<%=i %>"><%=sizeList[i]%></label>
									</div>
								<%} %>
	                  		</div>
	                  		<div class="form group">
	                  			<%for (int i = 0; i<colorList.length; i++) {%>
									<div class="icheck-primary d-inline">
										<input type="checkbox" id="color<%=i %>"  name="size" value="<%=colorList[i]%>" >
										<label for="color<%=i %>"><%=colorList[i]%></label>
									</div>
								<%} %>
	                  		</div>
							<div class="form-group">
	                 		   <textarea id="detail" class="form-control"></textarea>
	                  		</div>
							<div class="form-group">
								<div class="custom-file">
	                 		   		<input type="file" class="custom-file-input" multiple id="file"></input>
	                 		   	<div>
	                 		   		<span class="btn btn-success col-12 fileinput-button" onClick="triggerFile()">
	                 		   		<i class="fas fa-plus"></i>
	                 		   		<span>올려</span>
	                 		   		</span>
	                  		</div>
	                  		<div class="row form-group" id="preview"></div>
							<div class="form-group" >
	                 		   <button type="button" class="btn btn-dark" id="bt_regist" style="display:block; margin : 0 auto;">등록</button>
	                  		</div>
                  		</form>
                  	</div>
				</div>
				<!-- /.container-fluid -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@ include file="/admin/inc/footer.jsp"%>
		<!-- Control Sidebar -->
		<%@ include file="/admin/inc/sidebar_right.jsp"%>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->
	<%@ include file="/admin/inc/footer_link.jsp"%>
	<script type="text/babel">
		function ImageBox(props) {
			return (
				<div className={"col-sm-2 border"}>
					<div>
						<a href="#" onClick={(e)=>removeImg(e, props.index)}>X</a>
					</div>
					<img src = {props.src} width="100px"/>
				</div>
			);
		}

	
	
	</script>
	<script type="text/javascript">

		function triggerFile() {
			// 파일 컴포넌트를 대상으로 클릭 효과를 낸다(간접적 클릭)
			$("#file").trigger("click");
		}
		function regist() {
			// 이미지 미리보기 기능은 단순히 배열처리였을 뿐
			// input type="file" 컴포넌트는 여전히 유저가 선택한 이미지 정보를 그대로 유지하고 있다
			// 따라서, 기존의 폼을 그대로 전송하면 안되고, 개발자가 폼에 들어갈 파일을 직접 제어해야 한다
			// 이 방법을 JQuery가 지원해준다
			let formData = new FormData();
			console.log("전송하기 위한 파일의 수", fileList.length);
			// 파일 뿐만 아니라 파라미터 등을 심을 수 있다
			for (let i = 0; i < fileList.length; i++) {
				let file = fileList[i];
				// formData.append("파라미터 명", 어떤 파일);
				formData.append("file", file);
				formData.append("category_idx", $("#category").val());
				formData.append("product_name", $("#product_name").val());
				formData.append("brand", $("#brand").val());
				formData.append("price", $("#price").val());
				formData.append("discount", $("#discount").val());
			}
			
			// 비동기 방식으로 formData 전송
			// processData : false  title=dd&writer=ddd ...
			$.ajax({
				url : "/admin/product/regist.jsp",
				type : "POST",
				processData : false, // 쿼리스트링화 방지
				contentType : false, // application/x-www 방지
				data : formData,
				success : function(result, status, xhr) {
					alert("상품이 등록 되었습니다");
				}
			});
		}
	</script>
	<script type="text/babel">
	let tag=[]; // <ImageBox>라는 UI 컴포넌트를 누적할 배열
	let previewRoot; // 리액트에 의해 렌더링 될 컨테이너 요소
	let fileList=[]; // 파일 정보를 가진 배열
	let oriFiles; // 원래 유저가 선택한 파일 배열 원본(읽기 전용)
	
	// 시각적인 삭제처리
	function removeImg(e, index) {
		// $(객체.target).remove();
		$(e.target).parent().parent().remove();

		// x자를 누를 때 넘겨받은 고유 번호로. 원본 배열에서 해당 파일을 추출한다
		let file = oriFiles[index]; // 원본 배열에서 해당 파일 추출

		// 배열에서의 삭제
		// 추출한 파일이 삭제정보 배열에서 몇 번째 index인지 조사
		let sel_index = fileList.indexOf(file); // 유저가 선택할 때마다 원본에서 하나씩 꺼내오는거
		fileList.splice(sel_index, 1);
	}
	function createCategoryOption(result) {
		let op = "<option value=0>상품분류</option>";
		for (let i = 0; i<result.length; i++) {
			let category = result[i];
			op+="<option value='"+category.category_idx+"'>"+category.category_name+"</option>";
		} 
		$("#category").html(op);
	}
	
	function getCategoryList() {
		$.ajax({
			type : "GET",
			url : "/admin/category/category_list.jsp",
			success : function(result, status, xhr) {
				createCategoryOption(result);
			}
		});
	}
	// 사용자가 선택한 파일들을 매개변수로 받자
	function previewImg() {
		
		for(let i = 0; i<fileList.length; i++) {
			let reader = new FileReader();

			reader.onload = function(e) { // 파일이 읽혀지면
				// e에는 읽은 파일에 대한 정보가 들어있다
				//$("#preview").html("<img src='"+e.target.result+"' width='100px'>");
				tag.push(<ImageBox key={i} src={e.target.result} index={i}/>);
				
				if(i >= fileList.length-1) { // 마지막 이미지에 도달하면
					previewRoot.render(tag);
				}
			};
			reader.readAsDataURL(fileList[i]); // 읽을 대상 파일
		}
	}
	
	$(function() {
		previewRoot = ReactDOM.createRoot(document.getElementById("preview"));
		getCategoryList();
		
		$("#detail").summernote({
			height : 200
		});
		$("#bt_regist").click(function() {
			regist();
		});
		$("#file").change(function() {
			this.files; // files : 파일 컴포넌트에서 선택한 파일이 보유한 배열
							// 이 배열은 read Only (읽기만 하고 쓸 수는 없음)
			console.log("당신이 선택한 파일 수는 ", this.files.length);
			// 유저가 선택한 파일에 대한 정보를 배열로 얻기
			 oriFiles = this.files;
			// fileList = this.files; // 전역변수로 빼둠
			// this.files는 이미 자바스크립트의 파일배열로, 읽기만 가능하다
			// 따라서 수정 가능한 배열이 되여면, this.files 안에 있는 File 들을 꺼내 일반 배열로 옮겨버리면 된다
			for(let i = 0; i<this.files.length; i++) {
				fileList.push(this.files[i]);
			}

			// previewImg(this.files);
			previewImg();
		});
	});
	</script>
</body>
</html>
