<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<jsp:include page="../common/menubar1.jsp" />

<jsp:include page="../member/myPageAside.jsp" />

            <div class="my_content">
                <h1>내가 쓴 리뷰</h1><br>


		
				<div>
					<table class="table table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>리뷰 이름</th>
								<th>리뷰 등록날짜</th>
							
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${travelList}" var="travel" >
								<tr>
									<td><c:out value="${travel.travelNo }"/></td>
									<td  ><a href="<c:out value="${travel.travelNo }"/>" class="getTravel"><c:out value="${travel.travelName}" /></a></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd" value="${travel.travelRegDate }" /></td>
									
								</tr>
							
							</c:forEach>
						</tbody>
					
					</table>
					
					<div class="float-right">
						<ul class="pagination">
								             	
							<c:if test="${pageDTO.prev}">
								<li class="page-item">
									<a class="page-link" href="${pageDTO.startPage-1}" aria-label="Previous">
									<span aria-hidden="true">&laquo;</span>
									<span class="sr-only">Previous</span>
									</a>
								</li>
							</c:if>
								            
							<c:forEach var="num" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
								<li class="page-item ${pageDTO.cri.pageNo==num?'active':''} ">
								  <a class="page-link" href="${num}">${num}</a>
								 </li>
							</c:forEach>
								           
			          		  <c:if test="${pageDTO.next}">
			             		<li class="page-item">
							      <a class="page-link" href="${pageDTO.endPage+1}" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							        <span class="sr-only">Next</span>
							      </a>
							    </li>
			             	</c:if>
							</ul>
					
					
					</div>
					
					<form id="moveForm" action="selectList.tr" method="get">
						<input type="hidden" name="pageNo" value='<c:out value="${pageDTO.cri.pageNo }"/>'>
						<input type="hidden" name="amount"  value='<c:out value="${pageDTO.cri.amount }"/>' />
						<input type="hidden" name="travelNo" />
			 		</form>
					
					
				</div>

            </div>
        </div>
    </div>

<jsp:include page="../common/footer.jsp" />