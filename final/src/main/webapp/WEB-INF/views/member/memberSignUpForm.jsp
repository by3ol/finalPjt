<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../common/menubar1.jsp"/>

<div class="signup-form">
        <form action="/examples/actions/confirmation.php" method="post" class="form-horizontal">
            <div class="text-center col-xs-8 col-xs-offset-4">
                <h2>회원가입</h2>
            </div>
            <div class="form-group">
                <label class="control-label col-xs-4">아이디</label>
                <input type="text" class="form-control" name="userId" required="required">
            </div>
            <div class="form-group">
                <label class="control-label col-xs-4">이메일</label>
                <input type="email" class="form-control" name="email" required="required">
            </div>
            <div class="form-group">
                <label class="control-label col-xs-4">비밀번호</label>
                <input type="password" class="form-control" name="password" required="required">
            </div>
            <div class="form-group">
                <label class="control-label col-xs-4">비밀번호 확인</label>
                <input type="password" class="form-control" name="confirm_password" required="required">
            </div>
            <div class="form-group">
                <label class="control-label col-xs-4">이름</label>
                <input type="text" class="form-control" name="username" required="required">
            </div>
            <div class="form-group">
                <label class="control-label col-xs-4">Gender <span class="text-danger">*</span></label>
                <div class="col-md-8 col-sm-9">
                    <label>
                        <input name="gender" type="radio" value="Male" checked>
                        남자 </label>    
                    <label>
                        <input name="gender" type="radio" value="Female">
                        여자 </label>
                        <label>
                </div>
            </div>
            <div class="form-group">
                <div class="text-center col-xs-8 col-xs-offset-4">
                    <p><label class="checkbox-inline"><input type="checkbox" required="required"> I accept the <a
                                href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>.</label></p>
                    <button type="submit" class="btn btn-primary btn-lg">가입하기</button>
                    <button type="submit" class="btn btn-danger btn-lg">취소</button>
                </div>
            </div>
        </form>
    </div>

<jsp:include page="../common/footer.jsp"/>