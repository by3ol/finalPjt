<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>고객센터</title>
      
       <link rel="stylesheet" href="resources/css/junghun/customercenter.css" />
       <link rel="stylesheet" href="resources/css/junghun/nomalize.css" />
</head>
<body>
<jsp:include page="../common/menubar1.jsp"/>

    <div class="inner">
      <div class="banner">고객센터</div>
    </div>
    <div class="inner">
      <div class="nav_content">
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link link3" href="#">문의하기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link link3" href="#">문의확인</a>
          </li>
          <li class="nav-item">
            <a class="nav-link link3" href="#">신고하기</a>
          </li>
          <li class="nav-item">
            <a class="nav-link link3" href="#">공지사항</a>
          </li>
        </ul>
      </div>
      <hr />
    </div>
    <div class="inner">
      <div class="content">
        <section>
          <div class="select_area">
            <select class="select1">
              <option selected>질문 유형</option>
              <option value="1">회원신고</option>
              <option value="2">게시글신고</option>
              <option value="3">개선사항</option>
            </select>
            <select class="select2">
              <option selected>카테고리 유형</option>
              <option value="1">여행추천</option>
              <option value="2">맛집</option>
              <option value="3">코스</option>
            </select>
          </div>
          <div class="text1">
            <textarea
              class="textarea1"
              name="content"
              id="questionTitle"
              cols="50"
              rows="1"
              placeholder="제목을 입력해주세요"
            ></textarea>
          </div>
          <textarea
            class="textarea2"
            name="content"
            id="questionContent"
            cols="50"
            rows="15"
            placeholder="문의 사항을 입력해주세요."
          ></textarea>
          <div class="submit_area">
            <input type="submit" value="보내기" class="btn btn-primary" />
          </div>
        </section>
      </div>
    </div>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>
