<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap')
	; /*로고*/
@import
	url('https://fonts.googleapis.com/css2?family=Indie+Flower&family=Sunflower:wght@300;500&display=swap')
	; /*전체적인*/
@media screen and (min-width : 360px) {
	.mmContainer {
		display: none;
	}
	.mm2Container {
		display: block;
	}
}

@media screen and (min-width : 960px) {
	.mmContainer {
		display: block;
	}
	.mm2Container {
		display: none;
	}
}

.headerContainer {
	width: 100%;
}

.logoContainer {
	width: 15%;
	margin: 0%;
	padding: 0%;
	float: left;
}

a {
	font-size: 13px;
}

.logo {
	margin-left: 80px;
	color: rgba(120, 180, 255, 1.0);
	font-size: 32px;
	text-decoration: none;
}

.mmContainer {
	width: 80%;
	margin-top: 10px;
	float: right;
}

.myPageContainer {
	width: 100%;
}

.myPageContainer .myPage {
	width: 30px;
	height: 30px;
}

.menuContainer {
	float: right;
	margin-right: 120px;
}

.mmContainer .menu li {
	list-style: none;
	float: left;
	margin-left: 15px;
}

.mmContainer .menu li a {
	text-decoration: none;
	color: black;
}

.myPageContainer {
	float: right;
	margin-right: 120px;
}

.menu {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
}

.mm2Container li {
	list-style: none;
	float: right;
	margin-top: 20px;
	margin-right: 120px;
	border: none;
	background-color: white;
}

.mm2Container li ul li {
	float: right;
}

.mm2Container li ul li {
	display: none;
}

.mm2Container li:hover ul li {
	display: block;
}

.myPageBar li {
	float: right;
	list-style: none;
	padding-left: 20px;
}

.myPageBar li a {
	text-decoration: none;
	color: black;
}

.menuBar {
	top: 5px;
	width: 100%;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- bootstrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css -->
<link rel="stylesheet" href="resources/byeol.css">

<!-- member css -->
<link rel="stylesheet" href="resources/memberStyle/loginForm.css">
<link rel="stylesheet" href="resources/memberStyle/joinChoose.css">

<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>

<!--지도 api  -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=171ba9799c4dc95de3884a540e75210c"></script>




</head>
<body>
	<!-- 
    <header id="header">
        <div class="headerContainer">
            <div class="logoContainer">
            <h1 class="logo"><a class="logo" href="">
                Drommetur</a>
            </h1>
        </div>
        <div class="mmContainer">
            <div class="myPageContainer">
                <ul class="myPageBar">
            <li><a href="">MyPage</a></li>
            <li class="login"><a href="">Login</a></li>
        </ul>
            </div>
            
            <div class="menuContainer">
                <ul class="menu">
                <div class="menuBar">
                <li id=""><a href="${ pageContext.servletContext.contextPath }/view.tr">여행</a></li>
                <li id=""><a href="">맛집</a></li>
                <li id=""><a href="">숙박</a></li>
                <li id=""><a href="">명소/액티비티</a></li>
                <li id=""><a href="">이동수단</a></li>
                <li id=""><a href="">리뷰</a></li>
                <li id=""><a href="">공지사항</a></li>
                <li id=""><a href="">고객센터</a></li>
                </div>
            </ul>
            </div>
            
        
        </div>
        <div class="mm2Container">
            <ul>
                <li><img src="images/3.PNG">
                <ul>
                <li id=""><a href="${ pageContext.servletContext.contextPath }/view.tr">MyPage</a></li>
                <li id=""><a href="">Login</a></li>
                <li id=""><a href="">여행</a></li>
                <li id=""><a href="">맛집</a></li>
                <li id=""><a href="">숙박</a></li>
                <li id=""><a href="">명소/액티비티</a></li>
                <li id=""><a href="">이동수단</a></li>
                <li id=""><a href="">리뷰</a></li>
                <li id=""><a href="">공지사항</a></li>
                <li id=""><a href="">고객센터</a></li>
                </ul>
            </li>
            </ul>
        </div>
        </div>
    </header>
 
  -->


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
				<li class="nav-item"><a class="nav-link" href="#">맛집</a></li>
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

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> 관리 게시판 </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="#">공지사항</a> <a
							class="dropdown-item" href="#">Q&A</a>
					</div></li>
			</ul>
		</div>

		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/login.mem">로그인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/join.mem">회원가입</a></li>

			</ul>
		</div>
	</nav>