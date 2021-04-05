<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<jsp:include page="../common/menubar1.jsp" />

<jsp:include page="../member/myPageAside.jsp" />

            <div class="my_content myPageContainer">
                <h1>리뷰</h1><br>


		
				<div>
				<table class="table table-striped ">
					<tr>
						<th>번호</th>
						
						<th>장소</th>
						<th>제목</th>
						<th>지역</th>
						<th>카테고리</th>
						
						<th>작성자</th>
						<th>조회수</th>
						<th>등록날짜</th>
							
					</tr>
					
					<c:forEach var="review" items="${list}">
						<tr>
							<td><c:out value="${review.reviewNo }" /></td>
							
							<td><c:out value="${review.place.placeName }" /></td>
							<td ><a class="getReview" href="<c:out value="${review.reviewNo }" />" style="color:#2d7fc7"><c:out value="${review.reviewTitle }" /> <c:if test="${review.attachCount>0 }"><img src="resources/images/attach.png" /> </c:if></a> </td>
							<td><c:out value="${review.regionObj.regionName }" /> </td>
							<td><c:out value="${review.place.placeGroup }" />  </td>
							
							<td><c:out value="${review.member.memberName }" /></td>
							<td><c:out value="${review.visitCount }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${review.reviewRegDate }" /></td>
							
						</tr>
					
					</c:forEach>
					
				</table>
					<!--페이징부분  -->
					<div class="float-right">
						<ul class="pagination">
								             	
							<c:if test="${page.prev}">
								<li class="page-item">
									<a class="page-link" href="${page.startPage-1}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
									</a>
								</li>
							</c:if>
								            
							<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
								<li class="page-item ${page.cri.pageNo==num?'active':''} ">
								  <a class="page-link" href="${num}">${num}</a>
								 </li>
							</c:forEach>
								           
			          		  <c:if test="${page.next}">
			             		<li class="page-item">
							      <a class="page-link" href="${page.endPage+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							        <span class="sr-only">Next</span>
							      </a>
							    </li>
			             	</c:if>
							</ul>
					
					
					</div>
					
					
				<form id="moveForm" action="mylist.re" method="get">
					<input type="hidden" name="pageNo" value="<c:out value="${page.cri.pageNo }"/>" />
					<input type="hidden" name="amount" value="<c:out value="${page.cri.amount }"/>" />
				
					<input type="hidden" name="type" value="<c:out value="${page.cri.type }"/>" />
					<input type="hidden" name="keyword" value="<c:out value="${page.cri.keyword }"/>" />
					<input type="hidden" name="region" value="<c:out value="${page.cri.region }"/>" />
					<input type="hidden" name="group" value="<c:out value="${page.cri.group }"/>" />
					<input type="hidden" name="from" value="<c:out value="${page.cri.from }"/>" />
		
				
				</form>
					
					
				</div>

            </div>
        </div>
    </div>
    
    	<script>
		$(function(){
			
			var $moveForm =$("#moveForm");
			
			$(".page-link").on("click",function(e){
				
				e.preventDefault();
				
				$moveForm.find("input[name=pageNo]").val($(this).attr('href'));
				
				$moveForm.submit();
				
				
			});
			
			$(".getReview").on("click",function(e){
				
				e.preventDefault();
				
				$moveForm.attr("action","select.re");
				
				var reviewNoInput=$("<input>").attr("type","hidden").attr("name","reviewNo").val($(this).attr("href"));
				
				$moveForm.append(reviewNoInput);
				
				$moveForm.submit();
				
			});
			
			
			
			
		});
		</script>
<jsp:include page="../common/footer.jsp" />