<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<title>게시글 작성</title>
<style>
textarea {
  resize: none;
}
h2 {
	text-align: center;
	vertical-align: middle;
}

.inner {
	width: 1200px; /* 가로 사이즈가 1200px 넘는 해상도에서는 max-width 설정 */
	height: 100%; /* align-items 등으로 수직 가운데 정렬을 위해, 알맞은 height 설정이 필요함 */
	margin: 0 auto; /* 가운데 정렬: 동일 요소에 width 가 설정되어 있을 때에만 적용 */
	padding: 0rem 2rem; /* 좌우 padding 을 살짝 주어서, 좌우에 딱 붙지 않도록 함 */
	overflow: hidden; /* 넘치는 영역에 대해서는 표시안되도록 작성해야 함 */
	display: flexbox;
	justify-content: center;
	
	margin-top: 5rem;
	    background-color: rgb(249, 249, 249);
	    padding-top: 3rem;
}

label {
	font-size: x-large;
}
.buttonarea{
width:300px;
margin:0 auto;
display:flex;
justify-content:space-around;


}
</style>
</head>
<body>
	<jsp:include page="../common/menubar1.jsp" />
	<br>
	<br>
	<br>
	<div class="inner">
		<h2>게시글 작성</h2>
		<hr>


		<div class="container">
			<form action="insertNotice.cu" method="post">
				<div class="form-group">
					<label for="title">제목</label> <input type="text"
						class="form-control" id="title" name="noticeTitle"
						>
				</div>

				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" id="content" name="noticeContent"
						rows="15" ></textarea>
				</div>
				<div class="buttonarea" align="center">

			<input type="submit" class="btn btn-primary" value="등록하기">
			<button type="reset" class="btn btn-danger">취소하기</button>
		</div>
			</form>
		</div>


		

	</div>


</body>
</html>