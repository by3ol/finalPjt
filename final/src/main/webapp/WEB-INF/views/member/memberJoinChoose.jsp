<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../common/menubar1.jsp"/>

<div class="login-form">

	<form action="/examples/actions/confirmation.php" method="post">
		<h2 class="text-center">Welcome</h2>
		<h5 class="text-center">Drommetur!!</h5>

		<br>

		<div class="text-center social-btn2">
			<a href="#" class="btn btn-info btn-block"><b>Drommetur</b> 가입하기</a>
		</div>


		<div class="or-seperator"></div>
		<div class="text-center social-btn">
			<a href="#" class="btn btn-primary btn-lg"><i
				class="fa fa-facebook"></i>facebook</a> <a href="#"
				class="btn btn-danger btn-lg"><i class="fa fa-google"></i>google</a>
		</div>
		<br>
		<div class="hint-text small">
			이미 아이디가 있으신가요? <a href="LoginForm.html" class="text-success">로그인</a>
		</div>
	</form>
	
</div>

<jsp:include page="../common/footer.jsp"/>