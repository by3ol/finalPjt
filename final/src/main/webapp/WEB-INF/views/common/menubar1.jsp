<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- css -->


<link rel="stylesheet" href="resources/memberStyle/loginForm.css">
<link rel="stylesheet" href="resources/memberStyle/joinChoose.css">
<link rel="stylesheet" href="resources/memberStyle/signUpForm.css">


<link rel="stylesheet" href="resources/map.css">
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>

<!--지도 api   -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=171ba9799c4dc95de3884a540e75210c"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 




</head>
<body>


	<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top">


		<!-- Brand -->
		<a class="navbar-brand"
			href="${ pageContext.servletContext.contextPath }">drommetur</a>

		<!-- Toggler/collapsibe Button -->
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#collapsibleNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>


		<!-- Navbar links -->
		<div class="collapse navbar-collapse " id="collapsibleNavbar">
			<ul class="navbar-nav navbar-right">
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/view.tr">여행</a></li>
				<li class="nav-item"><a class="nav-link" href="list.ta">맛집</a></li>
				<li class="nav-item"><a class="nav-link" href="#">숙박</a></li>

				<li class="nav-item"><a class="nav-link" href="#">명소/액티비티</a></li>
				<li class="nav-item"><a class="nav-link" href="#">이동수단</a></li>


				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> 사용자 게시판 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">리뷰</a> <a class="dropdown-item"
							href="#">여행코스 추천</a>
					</div></li>

				<li class="nav-item"><a class="nav-link" href="customercenter.cu">고객센터</a></li>
			</ul>
		</div>

		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/loginFrom.mem">로그인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/joinChoose.mem">회원가입</a></li>

			</ul>
		</div>
	</nav>