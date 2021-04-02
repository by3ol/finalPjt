<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<jsp:include page="../common/menubar1.jsp" />


	<div class="container-fluid myContainer"  style="margin-top:70px">
	
		
		<div class="row">
			<div class="col-xl-7" style="margin-left:20%;margin-right:20%" >
				<div class="card-body" id="reviewCard">
					<h4 class="card-title"><c:out value="${review.reviewTitle}"/></h4>
					<hr>
					
					<label>작성자 </label><span ><c:out value="${review.member.memberName}"/></span>
					<label>장소 </label><span ><c:out value="${review.place.placeName}"/></span>
					<br>
					<label>지역 </label><span ><c:out value="${review.regionObj.regionName}"/></span>
					<label>카테고리 </label><span ><c:out value="${review.place.placeGroup}"/></span>
					<label>등록날짜 </label><span ><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewRegDate }" /></span>
					<hr>
					
					<p><c:out value="${review.reviewContent}"/></p>
				
					<hr>
					
					<c:forEach items="#{attachList}" var="attach">
						
						<img src="<c:out value="${attach.attachPath}" />/<c:out value="${attach.attachChange}" />"    />
					
					</c:forEach>
					
				</div>
			
			
			
			</div>
			
			
		</div>

	
	
	
	</div>
	<jsp:include page="../common/footer.jsp"/>