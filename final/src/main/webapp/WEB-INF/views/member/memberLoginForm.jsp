<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../common/menubar1.jsp" />

<div class="login-form">
	<form action="/examples/actions/confirmation.php" method="post">
		<h2 class="text-center">Drommetur</h2>
		<br>
		<div class="form-group">
			<div class="input-group">
				<input type="text" class="form-control" name="username"
					placeholder="아이디" required="required">
			</div>
		</div>
		<div class="form-group">
			<div class="input-group">
				<input type="password" class="form-control" name="password"
					placeholder="비밀번호" required="required">
			</div>
		</div>
		<div class="form-group">
			<button type="submit" class="btn btn-success btn-block login-btn">로그인</button>
		</div>
		<div class="clearfix">
			<a href="#" class="hint-text small">아아디/비밀번호 찾기</a>
		</div>
		<br>
		<div class="or-seperator"></div>
		<div class="text-center social-btn">
			<a href="#" class="btn btn-primary btn-lg"><i
				class="fa fa-facebook"></i>facebook</a> <a href="#"
				class="btn btn-danger btn-lg"><i class="fa fa-google"></i>google</a>
		</div>
		<br>
		<div class="hint-text small">
			아직 회원이 아니신가요? <a href="joinChoose.html" class="text-success">회원가입!</a>
		</div>
	</form>

</div>

<jsp:include page="../common/footer.jsp" />