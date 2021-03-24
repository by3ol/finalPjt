<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<jsp:include page="../common/menubar1.jsp" />

<jsp:include page="../member/myPageAside.jsp" />

<div class="myPage-from content">
	<div class="myPage-form header">
		<h1>여행 조회</h1>
	</div>	
	<div>
		
		<div class="card">
		
			<c:forEach items="">
			
			</c:forEach>
		
		
		
		
		</div>
		
		
		
		
		
		
		
		
			<form id="moveForm" action="selectList.tr" method="get">
				<input type="hidden" name="pageNo" value='<c:out value="${cri.pageNo }"/>'>
				<input type="hidden" name="amount"  value='<c:out value="${cri.amount }"/>' />
				<input type="hidden" name="travelNo" value='<c:out value="${travel.travelNo }"/>' />
 			</form>
	</div>
	
	
</div>



<jsp:include page="../common/footer.jsp" />