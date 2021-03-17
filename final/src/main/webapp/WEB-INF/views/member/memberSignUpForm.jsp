<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<jsp:include page="../common/menubar1.jsp" />
	
	<div class="warp">
        <div class="signup-form" id="signUp_Form_1">
		<br><br><br>
            <form action="insert.mem" method="post" class="form-horizontal" id="signUp_Form_2">
                <div class="text-center col-xs-8 col-xs-offset-4" id="text-signUp">
                    <h2>회원가입</h2>
                </div>

                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">아이디</label>
                    <input type="text" class="form-control" id="info-text" name="userId" required="required">
                </div>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">비밀번호</label>
                    <input type="password" class="form-control" id="info-text" name="password" required="required">
                </div>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="info-text" name="confirm_password"
                        required="required">
                </div>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">이름</label>
                    <input type="text" class="form-control" id="info-text" name="username" required="required">
                </div>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">이메일</label>
                    <input type="email" class="form-control" id="info-text" name="email" required="required">
                </div>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">성별</label>
                    <label class="gender-radio" id="info-gender1">
                        <input name="gender" type="radio" value="Unknown" checked>
                        알수없음 </label>
                    <label id="info-gender">
                        <input name="gender" type="radio" value="Male" checked>
                        남자 </label>    
                    <label id="info-gender">
                        <input name="gender" type="radio" value="Female" checked>
                        여자 </label>
                </div>

                <div class="form-group" id="insert-info">
                    <div class="text-center col-xs-8 col-xs-offset-4" id="bottom-insert-info">
                        <p><label class="checkbox-inline" id="agree-checkBox"><input type="checkbox"
                                    required="required"><a href="#"> 이용약관</a> 및 <a href="#">개인정보 보호 정책에</a>
                                동의합니다.</label></p>
                        <button type="submit" class="btn btn-primary btn-lg" id="join-btn">가입하기</button>
                        <button type="submit" class="btn btn-danger btn-lg" id="cancel-btn">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
	<jsp:include page="../common/footer.jsp" />