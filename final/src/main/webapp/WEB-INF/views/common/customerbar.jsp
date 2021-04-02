<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
ul{
cursor:pointer;
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
	border-bottom: 4px solid purple;
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

</style>
<body>
<br>

	<div class="nav_content">
		<ul class="nav">
			<li class="nav-item"><a class="nav-link link3"
				href="customercenter.cu">문의하기</a></li>
			<li class="nav-item"><a class="nav-link link3"
				href="customersaylist.cu">문의확인</a></li>
			<li class="nav-item"><a class="nav-link link3"
				href="customernotice.cu">공지사항</a></li>
		</ul>
	</div>
	<hr />
</body>
</html>