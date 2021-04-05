<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
</head>
<style>
.inner{
       width: 1200px;
       margin: 0 auto;
       overflow: hidden; /* 넘치는 영역에 대해서는 표시안되도록 작성해야 함 */

    }
table {
	
	background: white;
	border-radius: 10px;
	overflow: hidden;
	width: 100%;
	margin: 0 auto;
}


table thead tr {
	height: 40px;
	background: #808080;
	font-size: 14px
	text-align:center;
}

table tbody tr {
	height: 40px;
}

.table100-head th {
	font-family: OpenSans-Regular;
	font-size: 18px;
	color: #fff;
	line-height: 1.2;
	font-weight: unset;
}

tbody tr:nth-child(even) {
	background-color: #f5f5f5;
}

tbody tr {
	font-family: OpenSans-Regular;
	font-size: 15px;
	color: #808080;
	line-height: 1.2;
	font-weight: unset;
}

tbody tr:hover {
	color: #555555;
	background-color: #f5f5f5;
}

.nBtn {
	float: right;
	margin: 25px 190px 10px 0;
}

.nBtn button {
	width: 70px;
	height: 25px;
	background-color: rgb(241, 196, 15);
	border: 1px solid rgb(241, 196, 15);
}

button:hover {
	cursor: pointer;
}

.row>table {
	width: 70%;
	height: 80%;
	margin: 80px 0 0 160px;
}

h2 {
	margin-left: 25px;
}

.bottomarea {
	display: flex;
      flex-wrap: wrap;
      flex-direction: column; /*수직 정렬*/
      align-items: center;
}
</style>
<body>
	<jsp:include page="../common/menubar1.jsp" />
	<div class="container">
		<br> <br> <br>

		<div class="banner">공지사항</div>
<jsp:include page="../common/customerbar.jsp" />
		<div class="inner">
			<table id="noticeList" class="table table100-head table-hover">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					
						<c:choose>
							<c:when test="${ empty list}">
							<tr>
								<td colspan="5">존재하는 공지사항이 없습니다.</td>
								</tr>
							</c:when>

							<c:when test="${!empty list}">
								<c:forEach items="${list}" var="n">
								<tr>
									<td>${n.noticeNo}</td>
									<td>${n.noticeTitle}</td>
									<td>${n.datetime}</td>
								</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					
				</tbody>
			</table>
			<div class="bottomarea">
			<div>
			<c:if test="${ sessionScope.loginUser.memberId=='admin' }">
				<button type="button" onclick="location.href='customernoticeenroll.cu'">공지사항
					등록</button>
					</c:if>
			</div><br><br>
			<div id="pagingArea">
				<ul class="pagination">
					<c:choose>
						<c:when test="${ pi.currentPage ne 1 }">
							<li class="page-item"><a class="page-link"
								href="noticelist.cu?currentPage=${ pi.currentPage-1 }">Previous</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:choose>
							<c:when test="${ pi.currentPage ne p }">
								<li class="page-item"><a class="page-link"
									href="noticelist.cu?currentPage=${ p }">${ p }</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>


					<c:choose>
						<c:when test="${ pi.currentPage ne pi.maxPage }">
							<li class="page-item"><a class="page-link"
								href="noticelist.bo?currentPage=${ pi.currentPage+1 }">Next</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a class="page-link"
								href="noticelist.cu?currentPage=${ pi.currentPage+1 }">Next</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
            </div>
		</div>
	</div>
	    <jsp:include page="../common/footer.jsp" />
	
	<script>
		$(function() {
			$("#noticeList tbody tr").click(
					function() {
						location.href = "detailNotice.cu?noticeNo="
								+ $(this).children().eq(0).text();
					});
		});
	</script>
</body>
</html>