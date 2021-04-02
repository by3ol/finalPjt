<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

	<jsp:include page="../common/menubar1.jsp"/>
	
	<div class="container-fluid myContainer"  style="margin-top:70px">
		<div class="row">
			<div class="col-xl-8" style="margin-left:20%;margin-right:20%">
			<br>
			<button class="btn btn-primary float-right" id="registerBtn">리뷰 등록</button>
				<!--검색부분 -->
				<form id="searchForm" action="list.re" method="get">
					<input type="hidden" name="pageNo" value="1" />
					<input type="hidden" name="amount" value="10" />
					
					<input type="hidden" name="from" value="<c:out value='${page.cri.from}' />" />
					
					<div class="form-group form-inline">
						<label>지역</label>
						 <select class="form-control" id="region" name="region">
			 				<option value="0"  <c:out value="${page.cri.region eq 0 ? 'selected' : '' }" /> >전체</option>
						    <option value="1" <c:out value="${page.cri.region eq 1 ? 'selected' : '' }" /> >서울</option>
						    <option value="6" <c:out value="${page.cri.region eq 6 ? 'selected' : '' }" />>부산</option>
						    <option value="4" <c:out value="${page.cri.region eq 4 ? 'selected' : '' }" />>대구</option>
						    <option value="2" <c:out value="${page.cri.region eq 2 ? 'selected' : '' }" />>인천</option>
						    <option value="5" <c:out value="${page.cri.region eq 5 ? 'selected' : '' }" />>광주</option>
						    <option value="3" <c:out value="${page.cri.region eq 3 ? 'selected' : '' }" />>대전</option>
						    <option value="7" <c:out value="${page.cri.region eq 7 ? 'selected' : '' }" />>울산</option>
						    <option value="8" <c:out value="${page.cri.region eq 8 ? 'selected' : '' }" />>세종</option>
						    <option value="31" <c:out value="${page.cri.region eq 31 ? 'selected' : '' }" />>경기</option>
						    <option value="32" <c:out value="${page.cri.region eq 32 ? 'selected' : '' }" />>강원</option>
						    <option value="33" <c:out value="${page.cri.region eq 33 ? 'selected' : '' }" />>충북</option>
						    <option value="34" <c:out value="${page.cri.region eq 34 ? 'selected' : '' }" />>충남</option>
						    <option value="37" <c:out value="${page.cri.region eq 37 ? 'selected' : '' }" />>전북</option>
						    <option value="38" <c:out value="${page.cri.region eq 38 ? 'selected' : '' }" />>전남</option>
						    <option value="35" <c:out value="${page.cri.region eq 35 ? 'selected' : '' }" />>경북</option>
						    <option value="36" <c:out value="${page.cri.region eq 36 ? 'selected' : '' }" />>경남</option>
						    <option value="39" <c:out value="${page.cri.region eq 39 ? 'selected' : '' }" />>제주</option>
						  </select>
						<label>그룹</label>
						<select class="form-control" name="group">
							<option value="" <c:out value="${empty page.cri.group  ? 'selected' : '' }" />>전체</option>
							<option value="음식점" <c:out value="${page.cri.group eq '음식점' ? 'selected' : '' }" />>음식점</option>
							<option value="숙박" <c:out value="${page.cri.group eq '숙박' ? 'selected' : '' }" />>숙박업소</option>
							<option value="레포츠" <c:out value="${page.cri.group eq '레포츠' ? 'selected' : '' }" />>레포츠</option>
							<option value="관광지"<c:out value="${page.cri.group eq '관광지' ? 'selected' : '' }" /> >관광지</option>
							
						</select>
						<label>검색조건</label>
						<select class="form-control"  name="type">
							<option value="" <c:out value="${empty page.cri.type  ? 'selected' : '' }" />>검색조건</option>
							<option value="T" <c:out value="${ page.cri.type eq 'T' ? 'selected' : '' }" />>제목</option>
							<option value="C" <c:out value="${ page.cri.type eq 'C' ? 'selected' : '' }" />>내용</option>
							<option value="W" <c:out value="${ page.cri.type eq 'W' ? 'selected' : '' }" />>글쓴이</option>
							<option value="TC" <c:out value="${ page.cri.type eq 'TC' ? 'selected' : '' }" />>제목+내용</option>
							<option value="TW" <c:out value="${ page.cri.type eq 'TW' ? 'selected' : '' }" />>제목+글쓴이</option>
							<option value="TCW" <c:out value="${ page.cri.type eq 'TCW' ? 'selected' : '' }" />>제목+내용+글쓴이</option>
						</select>
						<input  class="form-control" type="text" name="keyword" value="<c:out value='${page.cri.keyword}' />">
						<button class="btn btn-success" id="searchBtn">검색</button>
						
					</div>
				</form>
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
					
				
	
				
			</div> <!--col  -->

		</div> <!-- row -->
		
		<form id="moveForm" action="list.re" method="get">
			<input type="hidden" name="pageNo" value="<c:out value="${page.cri.pageNo }"/>" />
			<input type="hidden" name="amount" value="<c:out value="${page.cri.amount }"/>" />
		
			<input type="hidden" name="type" value="<c:out value="${page.cri.type }"/>" />
			<input type="hidden" name="keyword" value="<c:out value="${page.cri.keyword }"/>" />
			<input type="hidden" name="region" value="<c:out value="${page.cri.region }"/>" />
			<input type="hidden" name="group" value="<c:out value="${page.cri.group }"/>" />
			<input type="hidden" name="from" value="<c:out value="${page.cri.from }"/>" />

		
		</form>
	
	</div><!--container-fluid  -->
	
	
	<script>
		$(function(){
			
			var $registerBtn=$("#registerBtn");
			var $moveForm =$("#moveForm");
		
			
			$registerBtn.on("click",function(){
				
				
				
				$moveForm.attr("action","enrollForm.re");
				
				$moveForm.submit();
				
				
			});
			
			$("#searchBtn").on("click",function(){
				
		/* 		if($("select[name=region] option:selected").val()==0 && $("select[name=group] option:selected").val()==""
					&& $("select[name=type] option:selected").val()=="" && $("input[name=keyword]").val().trim().length==0){
					
					alert("검색조건을 확인해주세요");
					return false;
				} */
		

				if($("select[name=type] option:selected").val()!=""){
					
					if($("input[name=keyword]").val().trim().length==0){
						alert("키워드를 입력해주세요");
						return false;
					}
					
					
				}
				
				if($("input[name=keyword]").val().trim().length!=0){
					if($("select[name=type] option:selected").val()==""){
					
						alert("검색조건을 선택해주세요");
						return false;
					}
				}
				
		
				$("#searchForm").submit();
				
			});
			
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
	<jsp:include page="../common/footer.jsp"/>