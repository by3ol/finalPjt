<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<jsp:include page="../common/menubar1.jsp" />


	<div class="container-fluid myContainer"  style="margin-top:70px">
	
		
		<div class="row">
			<div class="col-xl-7" style="margin-left:20%;margin-right:20%;" >
				<div class="card-body" id="reviewCard" style="border: 1px solid grey;">
					<h4 class="card-title"><c:out value="${review.reviewTitle}"/></h4>
					<hr>
					
					<label>작성자 </label><span ><c:out value="${review.member.memberName}"/></span>
					<label>장소 </label><span data-group="<c:out value="${review.place.placeGroup}"/>" data-pno="<c:out value="${review.placeNo}"/>" id="placeNameSpan" style="color:#2d7fc7"><c:out value="${review.place.placeName}"/></span>
					<br>
					<label>지역 </label><span ><c:out value="${review.regionObj.regionName}"/></span>
					<label>카테고리 </label><span ><c:out value="${review.place.placeGroup}"/></span>
					<label>등록날짜 </label><span ><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewRegDate }" /></span>
					<hr>
					
					<p><c:out value="${review.reviewContent}"/></p>
				
					
					<div style="overflow-x:auto">
					<c:forEach items="#{attachList}" var="attach">
						
						<img src="resources/uploadFiles/<c:out value="${attach.attachPath}" /><c:out value="${attach.attachChange}" />"    />
					
					</c:forEach>
					</div>
					<hr>
					<div>
					
					<button class="btn btn-secondary "  id="listBtn">목록으로</button>
						<c:if test="${review.memNo eq loginUser.memberNo }" >
						<button class="btn btn-success "  id="modifyBtn">수정하기</button>
						<button class="btn btn-danger "  id="removeBtn">삭제하기</button>
						</c:if>
						
						
						
					</div>
	
				</div> <!-- cardbody end -->
				

			
			</div>
			
			
		</div>

		
		<form id="moveForm" action="list.re" method="get">
			<input type="hidden" name="pageNo" value="<c:out value="${cri.pageNo }"/>" />
			<input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>" />
		
			<input type="hidden" name="type" value="<c:out value="${cri.type }"/>" />
			<input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>" />
			<input type="hidden" name="region" value="<c:out value="${cri.region }"/>" />
			<input type="hidden" name="group" value="<c:out value="${cri.group }"/>" />
			<input type="hidden" name="from" value="<c:out value="${cri.from }"/>" />

		
		</form>
	
	
	</div>
	<br>
	
	<script>
		$(function(){
			
			
			var $moveForm=$("#moveForm");
			var reviewNo=<c:out value="${review.reviewNo}"/>;
			
			$("#placeNameSpan").on("click",function(){
				
				var group=$(this).data("group");
				var pno=$(this).data("pno");
				var url="detail.";
				
				if(group=="음식점"){
					
					url+="ta";
				}else if(group=="숙박"){
					url+="ac";
					
				}else{
					url+="at";
					
				}
				
				url+="?placeNo="+pno;
				
				window.open(url,'_blank');
				
				
				
			});
			
			$("#listBtn").on("click",function(){
				
				if(${cri.from }==2){
					$moveForm.attr("action","mylist.re");
					
				}
				
				moveForm.submit();
			});
			
			$("#modifyBtn").on("click",function(){
				
				$moveForm.attr("action","modifyForm.re");
				
				var reviewNoInput=$("<input>").attr("type","hidden").attr("name","reviewNo").attr("value",reviewNo);
				
				$moveForm.append(reviewNoInput);
				$moveForm.submit();
				
				
			});
			
				$("#removeBtn").on("click",function(){
					
					if(confirm("정말 삭제하시겠습니까?")){
					
						$moveForm.attr("action","delete.re");
						$moveForm.attr("method","post");
						
						var reviewNoInput=$("<input>").attr("type","hidden").attr("name","reviewNo").attr("value",reviewNo);
						
						$moveForm.append(reviewNoInput);
						$moveForm.submit();
					}
					
				});
			
			
			
		});
	
	</script>
	<jsp:include page="../common/footer.jsp"/>