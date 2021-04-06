<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<jsp:include page="../common/menubar1.jsp" />

	    <div class="login-form" id="login-form">
	        <form action="login.mem" method="post">
	            <h2 class="text-center" id="mainText">Drommetur</h2>
	            <br>
	            <div class="form-group" id="form-group">
	                <div class="input-group" id="input-group">
	                    <input type="text" class="form-control" id="text-control" name="memberId" placeholder="아이디" required="required">
	                </div>
	            </div>
	            <div class="form-group" id="form-group">
	                <div class="input-group" id="input-group">
	                    <input type="password" class="form-control" id="text-control" name="memberPwd" placeholder="비밀번호" required="required">
	                </div>
	            </div>
	            <div class="form-group" id="form-group">
	                <button type="submit" class="btn btn-success btn-block login-btn" id="loginBtn">로그인</button>
	            </div>
	            <br>
	            <div class="or-seperator" id="or-line"></div>
	            <br>
	            <div class="hint-text small" id="hint-text">아직 회원이 아니신가요? <a href="joinChoose.mem" class="text-success" id="text-success">회원가입!</a></div>
	        </form>
	        <br><br>
	</div>
	<jsp:include page="../common/footer.jsp" />
