<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	

<div class="myPage-warp">
	<div class="myPage-from aside">
		<div class="nav_subject">
			<a href="${ pageContext.servletContext.contextPath }" class="myPage">MyPage</a>
		</div>
		<div class="nav">
			<div class="nav_title travel">
				<a href="travel.mem">여행</a>
			</div>
			<div class="nav_title taste">
				<a href="taste.mem">맛집</a>
			</div>
			<div class="nav_title accommodation">
				<a href="accommodation.mem">숙박</a>
			</div>
			<div class="nav_title activity">
				<a href="activity.mem">엑티비티</a>
			</div>
			<div class="nav_title reply">
				<a href="reply.mem">리뷰</a>
			</div>

			<div class="nav_title Info">
				<a href="info.mem">개인정보</a>
			</div>
			<ul class="nav_sub m_list">
			<li class=""><a href="infoUpdate.mem">개인정보 수정</a></li>
			<li class=""><a href="pwdUpdate.mem">비밀번호 변경</a></li>
			</ul>

			<div class="nav_title m_Delete">
				<a href="delete.mem">회원탈퇴</a>
			</div>

			<c:if test="${ sessionScope.loginUser.memberId eq 'admin' }">
				<div class="nav_title admin">관리자 메뉴</div>
				<ul class="nav_sub admin-list">
				<li class=""><a href="member.ad">회원관리</a></li>
				<li class=""><a href="report.bo">신고게시판 관리</a></li>
				<li class=""><a href="#"></a></li>
				</ul>
			</c:if>
		</div>
	</div>		