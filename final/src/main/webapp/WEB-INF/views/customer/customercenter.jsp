<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<title>고객센터</title>


</head>
<style>
* {
	box-sizing: border-box;
}

select {
	width: 200px;
	height: 50px;
}

body {
	margin: 0 auto;
	color: #3f464d;
	font-family: 'Spoqa Han Sans Neo', 'Sans-serif';
}

hr {
	margin-top: -1rem;
	margin-bottom: 50px;
}
form {
	width: 100%;
	border: 0;
	display: flex;
	flex-wrap: wrap;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
textarea::placeholder {
 
  font-weight: bold;
}
/* a 링크 태그 스타일 초기화 */
a {
	all: unset;
	text-decoration: none;
	color: black;
	display: inline-block;
	padding: 10px 20px;
	box-sizing: border-box;
}

a:link {
	text-decoration: none;
	color: #3f464d;
}

a:visited {
	text-decoration: none;
	color: #3f464d;
}

a:active {
	text-decoration: none;
	color: #3f464d;
}

a:hover {
	text-decoration: none;
	color: #3f464d;
}

.inner {
	width: 1000px; /* 가로 사이즈가 1200px 넘는 해상도에서는 max-width 설정 */
	height: 100%; /* align-items 등으로 수직 가운데 정렬을 위해, 알맞은 height 설정이 필요함 */
	margin: 0 auto; /* 가운데 정렬: 동일 요소에 width 가 설정되어 있을 때에만 적용 */
	padding: 0rem 2rem; /* 좌우 padding 을 살짝 주어서, 좌우에 딱 붙지 않도록 함 */
	overflow: hidden; /* 넘치는 영역에 대해서는 표시안되도록 작성해야 함 */
}


.banner {
	width: 100%;
	height: 70px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: xx-large;
	text-align: center;
	margin-bottom: 2rem;
}

.link3 {
	position: relative;
}

.link3::after {
	margin-bottom: -0.29rem;
	padding-bottom: 1rem;
	position: absolute;
	bottom: 0;
	left: 0;
	display: block;
	content: '';
	width: 100%;
	border-bottom: 4px solid yellow;
	height: 1px;
	transform: translateY(-30px);
	opacity: 0;
	transition: all 0.5s;
}

.link3:hover::after {
	opacity: 1;
	transform: translateY(-5px);
}

.nav_content {
	margin-top: 1rem;
	display: flex;
	justify-content: center;
	margin-bottom: 0rem;
}



.formarea {
	width: 900px;
	margin: 0 auto;
	overflow: hidden;
	display: flex;
	justify-content: center;
	border: none;
	background:lightgrey;
	padding:3rem;
	border: 1px;
}

.select_area {
	width: 100%;
	margin-top: 1rem;
	margin-bottom: 1rem;
}

.category {
	width: 100%;
	padding-left: 0.5;
	padding-top: 0.5rem;
	padding-bottom: 0.5rem;
	padding-right: 3rem;
	border-radius: 5px;
}

.textarea1 {
	width: 100%;
	height:3rem;
	margin-bottom: 0.5rem;
	resize: none;
	border-radius: 5px;
	margin-bottom: 0.5rem;
	padding-right:-3rem;
}

.textarea2 {
	width: 100%;
	margin-bottom: 3rem;
	border-radius: 5px;
	resize: none;
}

.submit_area {
	margin-bottom: 3rem;
}

#writer {
	visibility: hidden;
}
</style>
<body>
	<jsp:include page="../common/menubar1.jsp" />
	<br>
	<br>
	<br>
	<br>
	<div class="inner">
		<div class="banner">고객센터</div>
	</div>
	<div class="inner">
		<div class="nav_content">
			<ul class="nav">
				<li class="nav-item"><a class="nav-link link3" href="#">문의하기</a>
				</li>
				<li class="nav-item"><a class="nav-link link3" href="#">문의확인</a>
				</li>
				<li class="nav-item"><a class="nav-link link3" href="#">신고하기</a>
				</li>
				<li class="nav-item"><a class="nav-link link3"
					href="customernotice.cu">공지사항</a></li>
			</ul>
		</div>
		<hr />
	</div>
	<div class="formarea">
		
			<form id="questionForm" method="post" action="insert.cu">
				<div class="select_area">
					<select class="select1" name="category" id="category">
						<option selected>질문 유형</option>
						<option>회원신고</option>
						<option>게시글신고</option>
						<option>개선사항</option>
					</select>
				</div>
				<div class="textarea1">
					<textarea class="textarea1" name="questionTitle" id="questionTitle"
						cols="50" rows="1" placeholder="제목을 입력해주세요"></textarea>
				</div>
				<textarea class="textarea2" name="questionContent"
					id="questionContent" cols="50" rows="15"
					placeholder="문의 사항을 입력해주세요."></textarea>
				<div class="submit_area">
					<input type="submit" class="btn btn-primary" value="문의하기" />
					<button type="reset" class="btn btn-danger">취소하기</button>

			<input type="hidden" id="memberNo" name="memberNo value="${ sessionScope.loginUser.memberNo }">
				</div>
			</form>



	
	</div>


	<jsp:include page="../common/footer.jsp" />
</body>
</html>
