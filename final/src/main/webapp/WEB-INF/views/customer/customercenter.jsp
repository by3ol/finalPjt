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
<link rel="stylesheet" href="resources/customercenter.css">

</head>

<body>
	<jsp:include page="../common/menubar1.jsp" />
	<br>
	<br>
	<br>
	<br>
		<div class="banner">문의하기</div>
	<jsp:include page="../common/customerbar.jsp" />

	<div class="formarea">

		<form id="questionForm" method="post" action="insertquestion.cu">
			<div class="select_area">
				<select class="select1" name="category" id="category">
					<option selected>질문 유형</option>
					<option>회원신고</option>
					<option>게시글신고</option>
					<option>개선사항</option>
				</select>
			</div>
			<input class="inputwriter" type="text" id="writer" value="${loginUser.memberId }" name="writer"/>
			<div class="textarea1">
				<textarea class="textarea1" name="questionTitle" id="questionTitle"
					cols="50" rows="1" placeholder="제목을 입력해주세요"></textarea>
			</div>
			<textarea class="textarea2" name="questionContent"
				id="questionContent" cols="50" rows="15"
				placeholder="문의 사항을 입력해주세요."></textarea>
				<div class="submit_area">
				<button type="submit" class="btn btn-primary" >문의하기</button>
				<button type="reset" class="btn btn-danger">취소하기</button>

			</div>
		</form>
		
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>
