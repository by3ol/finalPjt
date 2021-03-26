<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="../common/menubar1.jsp" />

<jsp:include page="../member/myPageAside.jsp" />

            <div class="my_content">
                <div class="warp" style="font-family: 'Sunflower', sans-serif;">
                    <div class="signup-form" id="signUp_Form">
                        <form id="enrollForm" action="/examples/actions/confirmation.php" method="post" class="form-horizontal">
                            <div class="text-center col-xs-8 col-xs-offset-4" id="text-signUp">
                                <h2>개인정보</h2>
                            </div>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">아이디</label>
                                <input type="text" class="form-control" id="info-text" name="userId" required="required">                    
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
                                <input type="text" class="form-control" id="info-text" name="gender" required="required">
                            </div>
                            <br>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">전화번호</label>
                                <input type="tel" class="form-control" id="info-text" name="email" required="required">
                            </div>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">우편번호</label>
                                <input type="text" class="form-control" id="info-text-address" name="email">
                            </div>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">주소</label>
                                <input type="text" class="form-control postcodify_address" id="info-text" name="email">
                                <input type="text" class="form-control postcodify_extra_info" id="info-text" name="email">
                            </div>
            
                            <div class="form-group" id="insert-info">
   
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    
<jsp:include page="../common/footer.jsp" />