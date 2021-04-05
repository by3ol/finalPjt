<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<jsp:include page="../common/menubar1.jsp" />


	<div class="container-fluid myContainer"  style="margin-top:70px">
	
		
		<div class="row">
			<div class="col-xl-7" style="margin-left:20%;margin-right:20%" >
			<br>
				<div class="card-body" style="border: 1px solid grey;" >
					<h3 style="text-align:center">리뷰 수정</h3>
						
						<form action="update.re" method="post" id="reviewModifyForm" encType="multipart/form-data">
							
							<input type="hidden" name="pageNo" value="<c:out value="${cri.pageNo }"/>" />
							<input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>" />
						
							<input type="hidden" name="type" value="<c:out value="${cri.type }"/>" />
							<input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>" />
							<input type="hidden" name="region" value="<c:out value="${cri.region }"/>" />
							<input type="hidden" name="group" value="<c:out value="${cri.group }"/>" />
							<input type="hidden" name="from" value="<c:out value="${cri.from }"/>" />
											
							
							
							<input type="hidden" name="reviewNo" value="<c:out value="${review.reviewNo}"/>" />
							<input type="hidden" name="attachCount" value="<c:out value="${review.attachCount}"/>" />
							
							<div class="form-group">
							  <label for="reviewTitle">리뷰 제목</label>
							  <input type="text" class="form-control" id="reviewTitle" name="reviewTitle" value="<c:out value="${review.reviewTitle}"/>">
							</div>
							
							<div class="form-group">
								<label >리뷰 장소</label>
								<p id="placeName" style="color:#61a134"><c:out value="${review.place.placeName}"/></p>
							</div>
							
													
							<div class="form-group">
							  <label for="uploadFiles">첨부파일</label>
							  <input type="file" class="form-control" id="uploadFiles" name="uploadFiles" multiple>
							</div>
							
							<div class="form-group">
								 <label for="reviewContent">리뷰 내용</label>
			  					<textarea class="form-control" rows="10" id="reviewContent" name="reviewContent"><c:out value="${review.reviewContent}"/></textarea>
							</div>
							
							<div style="overflow-x:auto">
							
							<c:forEach items="#{attachList}" var="attach">
						
								<img src="resources/uploadFiles/<c:out value="${attach.attachPath}" /><c:out value="${attach.attachChange}" />"  data-ano="<c:out value="${attach.attachNo}" />"  />
					
							</c:forEach>
							</div>
							<hr>
							<div>
								<button class="btn btn-primary " id="registerBtn">리뷰수정</button>
								<button class="btn btn-secondary "  id="listBtn">목록으로 </button>
							</div>
						</form>
				</div>
			
			
			
			</div>
			
			
		</div>
		<br>
		
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
	
	<script>
	
		$reviewModifyForm=$("#reviewModifyForm");
		$moveForm=$("#moveForm");
		
		
		$("#listBtn").on("click",function(e){
			
			e.preventDefault();
			
			if(${cri.from }==2){
				$moveForm.attr("action","mylist.re");
				
			}
			
			$moveForm.submit();
		});
		
		$("img").on("click",function(){
			
			if(confirm("사진을 삭제하시겠습니까?")){
			
				var deleteFileInput=$("<input>").attr("type","hidden").attr("name","deleteFiles").attr("value",$(this).data("ano"));
				
				$reviewModifyForm.append(deleteFileInput);
				$(this).remove();
				
			}
			
			
		});
		
		
	
	</script>
	<jsp:include page="../common/footer.jsp"/>