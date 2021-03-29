<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
	
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
<link rel="stylesheet" href="resources/memberStyle/myPage.css">


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
	<c:if test="${ !empty msg }">
			<script>
				alert("${msg}");
			</script>
			<c:remove var="msg" scope="session" />
	</c:if>

	<nav class="navbar navbar-expand-md bg-dark navbar-dark fixed-top" style="font-family: 'Sunflower', sans-serif;">


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
					href="${ pageContext.servletContext.contextPath }/enrollForm.tr">여행</a></li>
				<li class="nav-item"><a class="nav-link" href="list.ta">맛집</a></li>
				<li class="nav-item"><a class="nav-link" href="list.ac">숙박</a></li>

				<li class="nav-item"><a class="nav-link" href="list.at">명소/액티비티</a></li>
				<li class="nav-item"><a class="nav-link" href="#">이동수단</a></li>
				<li class="nav-item"><a class="nav-link" href="#">리뷰</a></li>
				<li class="nav-item"><a class="nav-link" href="course">여행코스 추천</a></li>



				

				<li class="nav-item"><a class="nav-link" href="customercenter.cu">고객센터</a></li>
			</ul>
		</div>

		<div class="collapse navbar-collapse justify-content-end"
			id="collapsibleNavbar">
			<ul class="navbar-nav">
						
			<c:if test="${ empty sessionScope.loginUser }">
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/loginFrom.mem">로그인</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/joinChoose.mem">회원가입</a></li>
			</c:if>
			
			<c:if test="${ !empty sessionScope.loginUser }">
				<li class="nav-link">${ sessionScope.loginUser.memberName }님 환영합니다</li> &nbsp;&nbsp;
				
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/logout.mem">로그아웃</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${ pageContext.servletContext.contextPath }/myPage.mem">마이페이지</a></li>
			</c:if>
			
			</ul>
		</div>
	</nav>