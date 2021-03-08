<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
    <title>고객센터</title>
      <!-- CSS Reset(1), 아이콘 폰트, 웹페이지 사용폰트, style.css -->
      <link rel="stylesheet" href="css/nomalize.css" />
      <!-- https://fontawesome.com/start -->
      <script src="https://kit.fontawesome.com/f1def33959.js" crossorigin="anonymous"></script>
      <!-- Spoca Han Sans Neo: https://spoqa.github.io/spoqa-han-sans/ko-KR/ -->
      <link rel="stylesheet" href="css/customercenter.css" />
</head>
<body>
    <header>

    </header>
    <nav>
<ul class="nav flex-column">
    <li class="nav-item">
        <a class="nav-link active" href="#">질문하기</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="#">문의내역 확인</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="#">신고하기</a>
    </li>
    <li class="nav-item">
        <a class="nav-link active" href="#">회원정보</a>
    </li>

</ul>
    </nav>
    <section>
        <table>
            <thead>
                <tr class="table100-head" align="center">
                    <th class="column1">글번호</th>
                    <th class="column2">제목</th>
                    <th class="column3">작성자</th>
                    <th class="column4">작성일</th>
                    <th class="column5">조회수</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        if (list.isEmpty()) {
                    %>
                
                <tr>
                    <td colspan="5">존재하는 공지사항이 없습니다.</td>
                </tr>
                <%
                    } else {
                %>
                <%
                    for (AdminNotice n : list) {
                %>
                <td class="num"><%=n.getNoticeNo()%></td>
                <td class="tit"><a
                    href="noticeDetail.mem?nno=<%=n.getNoticeNo()%>"> <%=n.getNoticeTitle()%></td>
                <td class="nWriter"><%=n.getNoticeWriter()%></td>
                <td class="date"><%=n.getCreateDate()%></td>
                <td class="view"><%=n.getCount()%></td>
                </tr>
                <%
                    }
                %>
                <%
                    }
                %>
            </tbody>
        </table>
        <div class="pagingArea">
            <!-- 맨 처음으로 -->
            <button class="pageBt"
                onclick="location.href='<%=contextPath%>/noticeList.ad?currentPage=1'">&lt;&lt;</button>

            <!-- 이전페이지로(<) -->
            <%
                if (currentPage == 1) {
            %>
            <button disabled>&lt;</button>
            <%
                } else {
            %>
            <button class="pageBt"
                onclick="location.href='<%=contextPath%>/noticeList.ad?currentPage=<%=currentPage - 1%>'">
                &lt;</button>
            <%
                }
            %>

            <!-- 페이지 목록 -->
            <%
                for (int p = startPage; p <= endPage; p++) {
            %>

            <%
                if (p == currentPage) {
            %>
            <button disabled>
                <%=p%>
            </button>
            <%
                } else {
            %>
            <button class="pageNum"
                onclick="location.href='<%=contextPath%>/noticeList.ad?currentPage=<%=p%>'">
                <%=p%>
            </button>
            <%
                }
            %>

            <%
                }
            %>

            <!-- 다음페이지로(>) -->
            <%
                if (currentPage == maxPage) {
            %>
            <button disabled>&gt;</button>
            <%
                } else {
            %>
            <button class="pageBt"
                onclick="location.href='<%=contextPath%>/noticeList.ad?currentPage=<%=currentPage + 1%>'">
                &gt;</button>
            <%
                }
            %>

            <!-- 맨 끝으로  -->
            <button class="pageBt"
                onclick="location.href='<%=contextPath%>/noticeList.ad?currentPage=<%=maxPage%>'">
                &gt;&gt;</button>
        </div>
    </section>
    <footer>

    </footer>
</body>
</html>
