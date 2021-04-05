<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <div class="myPage_warp">
        <div class="my_container" id="my_content">
            <div class="aside">
                <div class="nav_subject" id="aside_subject">
                    <a href="myPage.mem" class="myPageHome">myPage</a>
                </div>
                <div class="nav" id="aside_nav">
                    <div class="nav_title" id="aside_title_1">
                        <a href="selectList.tr">여행</a>
                    </div>
                    <div class="nav_title" id="aside_title_1">
                        <a href="taste.mem">맛집</a>
                    </div>
                    <div class="nav_title" id="aside_title_1">
                        <a href="accommodation.mem">숙박</a>
                    </div>
                    <div class="nav_title" id="aside_title_1">
                        <a href="activity.mem">엑티비티</a>
                    </div>
                    <div class="nav_title" id="aside_title_1">
                        <a href="mylist.re">리뷰</a>
                    </div>
                    <div class="nav_title" id="aside_title_2">
                        <a href="info.mem">개인정보</a>
                    </div>
                    <ul class="nav_sub g_list" id="aside_sub_1">
                        <li class>
                            <a href="infoUpdate.mem">개인정보 수정</a>
                        </li>
                        <li class>
                            <a href="pwdUpdate.mem">비밀번호 변경</a>
                        </li>
                    </ul>
                    <div class="nav_title" id="aside_title_3">
                        <a href="deleteForm.mem">회원탈퇴</a>
                    </div>

                    <c:if test="${ sessionScope.loginUser.memberId eq 'admin' }">
                        <div class="nav_title" id="aside_title_4">
                            관리자메뉴
                        </div>
                        <ul class="nav_sub g_list" id="aside_sub_2">
                            <li class>
                                <a href="member.ad">회원관리</a>
                            </li>
                        </ul>
                    </c:if>             
                </div>
            </div>