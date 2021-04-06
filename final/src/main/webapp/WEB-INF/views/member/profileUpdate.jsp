<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/menubar1.jsp" />

<jsp:include page="../member/myPageAside.jsp" />

			<div class="my_content">
                <div class="warp" style="font-family: 'Sunflower', sans-serif;">
                    <div class="signup-form" id="signUp_Form">
                        <form id="enrollForm" action="profileUpdate.me" method="post" class="form-horizontal">
                            <div class="text-center col-xs-8 col-xs-offset-4" id="text-signUp">
                                <h2>개인정보 변경</h2>
                            </div>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">아이디</label>
                                <input type="text" class="form-control" id="info-text" name="memberId" value="${ loginUser.memberId }" readonly>                    
                            </div>
                            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">이름</label>
                                <input type="text" class="form-control" id="info-text" name="memberName" value="${ loginUser.memberName }" readonly>
                            </div>
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">이메일</label>
                                <input type="email" class="form-control" id="info-text" name="email" value="${ loginUser.email }">
                            </div>
                            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">성별</label>
                                <input type="text" class="form-control" id="info-text" name="gender" value="${ loginUser.gender }" readonly>
                            </div>
                            <br>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">전화번호</label>
                                <input type="tel" class="form-control" id="info-text" name="phone" value="${ loginUser.phone }">
                            </div>

            				<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
								<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
									<c:set var="post" value="${ addr }"/>
								</c:if>
								<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
									<c:set var="address1" value="${ addr }"/>
								</c:if>
								<c:if test="${ status.index eq 1 }">
									<c:set var="address1" value="${ addr }"/>
								</c:if>
								<c:if test="${ status.index eq 2 }">
									<c:set var="address2" value="${ addr }"/>
								</c:if>
							</c:forTokens>

                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">우편번호</label>
                                <input type="text" class="form-control" id="info-text-address" name="post" value="${ post }">
                    			<button type="button" class="btn btn-primary" id="postcodify_search_btn">검색</button>
                            </div>

							<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
							<script>
								
								$(function(){
									$("#postcodify_search_btn").postcodifyPopUp();
								});
							</script>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">주소</label>
                                <input type="text" class="form-control postcodify_address" id="info-text" name="address1" value="${ address1 }">
                                <input type="text" class="form-control postcodify_extra_info" id="info-text" name="address2" value="${ address2 }">
                            </div>
            
                            <div class="form-group" id="insert-info-profileUp">
                                <div class="text-center col-xs-8 col-xs-offset-4" id="bottom-insert-info">
                                    <button type="submit" class="btn btn-primary btn-lg" id="update-btn">수정하기</button>
                                    <button type="button" onclick="$('#postForm').submit();" class="btn btn-danger btn-lg" id="delete-btn">탈퇴하기</button>
                                    <button type="submit" class="btn btn-danger btn-lg" id="cancel-btn_1">취소</button>
                                </div>
                            </div>                            
                        </form>
                        
                        	<form action="delete.mem" method="post" id="postForm" style="display: none;">
								<input type="hidden" name="memberId" value="${ loginUser.memberId }">
							</form>
                        
                    </div>
                </div>

            </div>
        </div>
    </div>
    
<jsp:include page="../common/footer.jsp" />