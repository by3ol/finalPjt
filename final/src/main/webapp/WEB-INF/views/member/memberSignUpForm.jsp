<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<jsp:include page="../common/menubar1.jsp" />
	
	<div class="warp">
        <div class="signup-form" id="signUp_Form">
            <form id="enrollForm" action="insert.mem" method="post" class="form-horizontal">
                <div class="text-center col-xs-8 col-xs-offset-4" id="text-signUp">
                    <h2>회원가입</h2>
                </div>

                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">아이디</label>
                    <input type="text" class="form-control" id="info-text" name="memberId" required="required">
                </div>

                <div id="checkResult"></div>
                <br>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">비밀번호</label>
                    <input type="password" class="form-control" id="info-text" name="memberPwd" required="required">
                </div>
                
                <div id="checkPwdResult"></div>
                <br>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">비밀번호 확인</label>
                    <input type="password" class="form-control" id="info-text" name="confirm_password"
                        required="required">
                </div>
                
                <div id="checkPwdResult"></div>
                <br>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">이름</label>
                    <input type="text" class="form-control" id="info-text" name="memberName" required="required">
                </div>
                
                <div id="checkNameResult"></div>
                <br>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">이메일</label>
                    <input type="email" class="form-control" id="info-text" name="email" required="required">
                </div>
                <br>
                <div id="checkEmailResult"></div>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">성별</label>
                    <label class="gender-radio" id="info-gender1">
                        <input name="gender" type="radio" value="U" checked>
                        알수없음 </label>
                    <label id="info-gender">
                        <input name="gender" type="radio" value="M" checked>
                        남자 </label>    
                    <label id="info-gender">
                        <input name="gender" type="radio" value="F" checked>
                        여자 </label>
                </div>
                <br>

                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">전화번호</label>
                    <input type="tel" class="form-control" id="info-text" name="phone" required="required">
                </div>
				<br>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">우편번호</label>
                    <input type="text" class="form-control mr-2 postcodify_postcode5" id="info-text-address" name="post" value="${ post }">
                    <button type="button" class="btn btn-primary" id="postcodify_search_btn">검색</button>
                </div>
				<br>
                <div class="form-group" id="insert-info">
                    <label class="control-label col-xs-4" id="info-label">주소</label>
                    <input type="text" class="form-control postcodify_address" id="info-text" name="address1" value="${ address1 }">
                    <input type="text" class="form-control postcodify_extra_info" id="info-text" name="address2" value="${ address2 }">
                </div>
				
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				<script>
					
					$(function(){
						$("#postcodify_search_btn").postcodifyPopUp();
					});
				</script>
				
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
   
    <script>
        function idCheckValidate(num){ 
    		
    		if(num == 0){
    			$("#checkResult").hide();
    			$("#join-btn").attr("disabled", true);
    			
    		}else if(num == 1){ 
    			$("#checkResult").css("color", "red").text("이미 사용 중인 아이디입니다.");
    			$("#checkResult").show();
    			$("#join-btn").attr("disabled", true);
    			
    			
    		}else if(num == 2){
    			$("#checkResult").css("color", "green").text("사용 가능한 아이디입니다.");
    			$("#checkResult").show();
    			$("#join-btn").removeAttr("disabled");
    			
    		}else if(num == 3){ 
    			$("#checkResult").css("color", "red").text("5자 이상 입력해주세요.");
    			$("#checkResult").show();
    			$("#join-btn").attr("disabled", true);
    			
    		}
    		
    	}
  
    	$(function(){
    		
    		var $idInput = $("#enrollForm input[name=memberId]");
    		
    		$idInput.keyup(function(){
    			    			
    			if($idInput.val().length >= 5){
    				
   					$.ajax({
   						url:"idCheck.me",
   						data:{memberId:$idInput.val()},
   						type:"post",
   						success:function(result){
   							if(result > 0){
   								idCheckValidate(1);
   							}else {
   								idCheckValidate(2);
   							}
   						},error:function(){
   							console.log("아이디 중복체크용 ajax 통신 실패");
   						}
   					});
   					
    			}else if($idInput.val().length <= 4){
    				idCheckValidate(3);
    				
    			}else {
    				idCheckValidate(0);
    			}
    		});
    	});
    	
    	
    </script>
     
	<jsp:include page="../common/footer.jsp" />