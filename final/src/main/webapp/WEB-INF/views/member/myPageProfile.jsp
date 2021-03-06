<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../common/menubar1.jsp" />

<jsp:include page="../member/myPageAside.jsp" />

            <div class="my_content">
                <div class="warp" style="font-family: 'Sunflower', sans-serif;">
                    <div class="signup-form" id="signUp_Form">
                        <form id="enrollForm" action="" method="post" class="form-horizontal">
                            <div class="text-center col-xs-8 col-xs-offset-4" id="text-signUp">
                                <h2>개인정보</h2>
                            </div>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">아이디</label>
                                <input type="text" class="form-control" id="info-text" name="userId" value="${ loginUser.memberId }" readonly>                    
                            </div>
                            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">이름</label>
                                <input type="text" class="form-control" id="info-text" name="username" value="${ loginUser.memberName }" readonly>
                            </div>
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">이메일</label>
                                <input type="email" class="form-control" id="info-text" name="email" value="${ loginUser.email }" readonly>
                            </div>
                            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">성별</label>
                                <input type="text" class="form-control" id="info-text" name="gender" value="${ loginUser.gender }" readonly>
                            </div>
                            <br>
            
                            <div class="form-group" id="insert-info">
                                <label class="control-label col-xs-4" id="info-label">전화번호</label>
                                <input type="tel" class="form-control" id="info-text" name="phone" value="${ loginUser.phone }" readonly>
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
                                <label class="control-label col-xs-4" id="info-label">주소</label>
                                <input type="text" class="form-control postcodify_address" id="info-text" name="address1" value="[${ post }] ${ address1 }" readonly>
                                <input type="text" class="form-control postcodify_extra_info" id="info-text" name="address2" value="${ address2 }" readonly>
                            </div>
            
                            <div class="form-group" id="insert-info"></div>
                            
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
    
<jsp:include page="../common/footer.jsp" />