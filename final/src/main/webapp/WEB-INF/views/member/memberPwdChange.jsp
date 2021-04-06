<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/menubar1.jsp" />

<jsp:include page="../member/myPageAside.jsp" />

<div class="my_content">

                <div class="warp" style="font-family: 'Sunflower', sans-serif;">
                    <div class="signup-form" id="signUp_Form">
                        <form id="enrollForm" action="changePwd.me" method="post"
                            class="form-horizontal">
                            <div class="text-center col-xs-8 col-xs-offset-4" id="text-signUp">
                                <h2>비밀번호 변경</h2>
                            </div>

			                <div class="form-group" id="insert-info">
			                    <label class="control-label col-xs-4" id="info-label">아이디</label>
			                    <input type="text" class="form-control" id="info-text" name="memberId" required="required">
			                </div>
			
			                <div id="checkResult"></div>

                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">현재 비밀번호</label>
                                <input type="password" class="form-control" id="info-text" name="oldPwd" required="required">
                            </div>
                            <div id="checkPwdResult"></div>

                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">새 비밀번호</label>
                                <input type="password" class="form-control" id="info-text" name="newPwd" required="required">
                            </div>
                            <div id="checkPwdResult"></div>

                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">새 비밀번호 확인</label>
                                <input type="password" class="form-control" id="info-text" name="confirm_newPwd"
                                    required="required">
                            </div>
                            <div id="checkPwdResult"></div>

                            <div class="form-group" id="insert-info-profileUp">
                                <div class="text-center col-xs-8 col-xs-offset-4" id="bottom-insert-info">
                                    <button type="submit" class="btn btn-primary btn-lg" id="join-btn">변경하기</button>
                                    <button type="submit" class="btn btn-danger btn-lg" id="cancel-btn">다음에 하기</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                
            </div>
        </div>
    </div>                

<jsp:include page="../common/footer.jsp" />