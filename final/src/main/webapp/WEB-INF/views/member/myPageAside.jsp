<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="my-body">
<div class="myPage-warp">
	<div class="myPage-from aside">
		<div class="nav_subject">
			<a href="${ pageContext.servletContext.contextPath }" class="myPage">MyPage</a>
		</div>
		<div class="nav">
			<div class="nav_title travel">
				<a href="selectList.tr">여행</a>
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

				<div class="nav_title Info">
					<a href="info.mem" id="my-a">개인정보</a>
				</div>
				<ul class="nav_sub m_list" id="my-ul">
					<li id="myLi"><a href="infoUpdate.mem" id="list_li">개인정보
							수정</a></li>
					<li id="myLi"><a href="pwdUpdate.mem" id="list_li">비밀번호 변경</a>
					</li>
				</ul>

				<div class="nav_title m_Delete">
					<a href="delete.mem" id="my-a">회원탈퇴</a>
				</div>

				<c:if test="${ sessionScope.loginUser.memberId eq 'admin' }">
					<div class="nav_title admin">관리자 메뉴</div>
					<ul class="nav_sub admin-list" id="my-ul">
						<li id="myLi" id="my-a"><a href="member.ad" id="list_li">회원관리</a>
						</li>
						<li id="myLi" id="my-a"><a href="report.bo" id="list_li">신고게시판
								관리</a></li>
						<li id="myLi"><a href="#"></a></li>
					</ul>
				</c:if>
			</div>
		</div>
	</div>
</div>