<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>공지사항 상세화면</title>
<link rel="stylesheet" href="resources/customercenter.css">
<link rel="stylesheet" href="resources/notice.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>

</style>
<body>
	<jsp:include page="../common/menubar1.jsp" />
	<br><br><br><br>
	<div class="banner">공지사항</div>
	<jsp:include page="../common/customerbar.jsp" />
	<br><br>

	<div class="inner">
		
<h3 class="bbsTitle" >공지사항 제목</h3>
<table class="bbsView" style="width: 936.02px;">

<tbody>
	<tr>
	<th scope="row">작성자</th>
	<td>관리자</td>
	<th scope="row" data-view="date" colspan="1">등록일</th>
	<td>${n.datetime}</td>
</tr>
	<tr>
		<td class="conts" colspan="4">
			<div class="conts">
			${n.noticeTitle}
			</div>
		</td>
	</tr>
</tbody>
</table>
<c:if test="${sessionScope.loginUser.memberId=='admin' }">
		<div>
			<button class="btn btn-primary" onclick="postFormSubmit(1);">
				수정하기</button>
			<button class="btn btn-danger" onclick="postFormSubmit(2);">
				삭제하기</button>
		</div>
	</div>
	</c:if>
	<form id="postForm" action="" method="post">
	<input type="hidden" name="noticeNo" value="${n.noticeNo }">
	</form>
	<script>
		function postFormSubmit(num) {
			var postForm = $('#postForm');

			if (num == 1) {
				postForm.attr('action', 'updateForm.cu');
			} else {
				postForm.attr('action', 'deleteNotice.cu');
			}
			postForm.submit();
		}
	</script>
	    <jsp:include page="../common/footer.jsp" />
	
</body>
</html>
