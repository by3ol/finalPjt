<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../common/menubar1.jsp" />

	<div class="join-choose-from_1">
        <form action="/examples/actions/confirmation.php" method="post" class="join-choose-from_2">
            <h2 class="text-center" id="join-text">Welcome</h2>
            <h5 class="text-center" id="join-text">Drommetur!!</h5>

            <br>

            <div class="text-center social-btn2">
                <a href="signUpFrom.mem" class="btn btn-info btn-block" id="signUp_btn"><b>Drommetur</b> 가입하기</a>
            </div>

            <div class="or-seperator" id="or-line"></div>
            <div class="text-center social-btn">
                <a href="#" class="btn btn-primary btn-lg" id="facebook_btn"><i class="fab fa-facebook-f" id="social-fab"></i>facebook</a>
                <a href="#" class="btn btn-danger btn-lg" id="google_btn"><i class="fab fa-google" id="social-fab"></i>google</a>
            </div>
            <br>
            <div class="hint-text small" id="check-loginId">이미 아이디가 있으신가요? <a href="loginFrom.mem" class="text-success">로그인</a></div>
        </form>
    </div>

<jsp:include page="../common/footer.jsp" />