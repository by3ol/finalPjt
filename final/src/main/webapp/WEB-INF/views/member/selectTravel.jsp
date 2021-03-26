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
			<div class="card-body">
				<h4 class="card-title"><c:out value="${travel.travelName}"/></h4>
				<br><br>
				
				<h5 class="card-title">여행 일정</h5>
				<div>
				<c:forEach items="${travel.travelDetailList}" varStatus="status" var="travelDetail">
					
					<p style="color:#61a134"><fmt:formatDate pattern="yyyy-MM-dd" value="${travelDetail.travelDate }"/></p>
					
					<ul style="color:#2d7fc7">
					<c:forEach items="${travelDetail.travelPlaces }" var="place">
						
						<li><c:out value="${place.placeName }"/> </li>
					</c:forEach>
					</ul>
				</c:forEach>
				</div>
				<br><br>
				<h5 class="card-title">여행 메모</h5>
				<p class="card-text"><c:out value="${travel.travelMemo }"/></p>
				
				<br><br>
				<h5 class="card-title">여행 등록 날짜</h5>
				<p class="card-text"><fmt:formatDate pattern="yyyy-MM-dd" value="${travel.travelRegDate }"/></p>
			</div>
		
		</div>
		
		<div class="float-right">
			<button class="btn btn-success " id="modifyBtn">수정하기</button>
			<button class="btn btn-danger " id="deleteBtn">삭제하기</button>
			<button class="btn btn-secondary " id="listBtn">목록으로</button>
		</div>
		
		
		
		
			<form id="moveForm" action="selectList.tr" method="get">
				<input type="hidden" name="pageNo" value='<c:out value="${cri.pageNo }"/>'>
				<input type="hidden" name="amount"  value='<c:out value="${cri.amount }"/>' />
				<input type="hidden" name="travelNo" value='<c:out value="${travel.travelNo }"/>' />
 			</form>
	</div>
	
	
</div>
<script>
	
	$moveForm=$("#moveForm");
	
	$("#listBtn").on("click",function(){
		
		$moveForm.submit();
		
		
	});
	
	
	$("#deleteBtn").on("click",function(){
		
		if(confirm("정말로 삭제하시겠습니까?")){
			$moveForm.attr("method","post");
			$moveForm.attr("action","delete.tr");
			$moveForm.submit();
		}
	});
	
	
	$("#modifyBtn").on("click",function(){
		
		
		$moveForm.attr("action","modifyForm.tr");
		$moveForm.submit();
		
	});


</script>


<jsp:include page="../common/footer.jsp" />