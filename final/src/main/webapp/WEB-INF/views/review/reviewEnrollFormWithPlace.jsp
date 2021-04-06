<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<jsp:include page="../common/menubar1.jsp" />	


	<div class="container-fluid myContainer"  style="margin-top:70px">
		<div class="row">
			<div class="col-xl-7" style="margin-left:20%;margin-right:20%" >
				
			<div class="card" style="width:100% " >
					<div class="card-body">
						<h3 style="text-align:center">리뷰 등록</h3>
						
						<form action="insertwithPlace.re" method="post" id="reviewEnrollForm" encType="multipart/form-data">
							
						
							<input type="hidden" name="placeNo" value=<c:out value="${placeNo}"/> />
							
							<div class="form-group">
							  <label for="reviewTitle">리뷰 제목</label>
							  <input type="text" class="form-control" id="reviewTitle" name="reviewTitle">
							</div>
							
							<div class="form-group">
								<label >리뷰 장소</label>
								<p id="placeName" style="color:#61a134"><c:out value="${placeName}"/></p>
							</div>
							
													
							<div class="form-group">
							  <label for="uploadFiles">첨부파일</label>
							  <input type="file" class="form-control" id="uploadFiles" name="uploadFiles" multiple>
							</div>
							
							<div class="form-group">
								 <label for="reviewContent">리뷰 내용</label>
			  					<textarea class="form-control" rows="10" id="reviewContent" name="reviewContent"></textarea>
							</div>
								
							<button class="btn btn-primary " id="registerBtn">리뷰등록</button>
							
								
						</form>
						
					
					</div>
				</div>
		
				
			
			
			</div>
		</div>
	
	</div>
	
   
	
	<script>
	
	$registerBtn.on("click",function(e){
		
		var $reviewEnrollForm=$("#reviewEnrollForm");
		
		
		if($reviewEnrollForm.find("input[name=reviewTitle]").val().trim().length==0){
			
			alert("리뷰 제목을 입력하세요.");
			return false;
		}
		
		if($reviewEnrollForm.find("input[name=reviewTitle]").val().length>66){
			
			alert("리뷰 제목은 67자 미만으로 입력하세요.");
			return false;
		}
		

		if($reviewEnrollForm.find("textarea").val().trim().length==0){
			
			alert("리뷰 내용을 입력하세요.");
			return false;
		}
		
		if($reviewEnrollForm.find("textarea").val().length>999){
			
			alert("리뷰 내용은 1000자 미만으로 입력하세요.");
			return false;
		}
		
		$reviewEnrollForm.submit();
			
	
		
		
	});
	
	

	</script>
<jsp:include page="../common/footer.jsp"/>