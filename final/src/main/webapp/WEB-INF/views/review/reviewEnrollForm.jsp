<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<jsp:include page="../common/menubar1.jsp" />


	<div class="container-fluid myContainer"  style="margin-top:70px">
	
		<div class="row">
			<div class="col-xl-6"  >
				<div class="row">
					<div class="col-lg-8 " > <!--맵 메뉴 부분  -->
					
						
						<div class="btn-group" >
							<button type="button" class="btn btn-outline-danger place-group" data-group="음식점"><i class="fas fa-utensils"></i> 음식점</button>
						    <button type="button" class="btn btn-outline-warning place-group" data-group="숙박"><i class="fas fa-bed"></i> 숙박업소</button>
						    <button type="button" class="btn btn-outline-success place-group" data-group="관광지"><i class="fas fa-camera-retro"></i>관광지</button>
						    <button type="button" class="btn btn-outline-info place-group" data-group="레포츠"><i class="fas fa-skiing"></i> 레포츠</button>
						</div>
					
					</div>
					
					<div class="col-lg-4 " > <!-- 검색창부분  -->
						
						<div class="form-group form-inline">  
						 	 <label for="regionNo" class="col-sm-4">지역 선택</label>
							  
							  <div class="col-sm-8">
								  <select class="form-control" id="regionNo" name="regionNo">
								    <option value="1" selected>서울</option>
								    <option value="6" >부산</option>
								    <option value="4" >대구</option>
								    <option value="2">인천</option>
								    <option value="5">광주</option>
								    <option value="3">대전</option>
								    <option value="7">울산</option>
								    <option value="8">세종</option>
								    <option value="31">경기</option>
								    <option value="32">강원</option>
								    <option value="33">충북</option>
								    <option value="34">충남</option>
								    <option value="37">전북</option>
								    <option value="38">전남</option>
								    <option value="35">경북</option>
								    <option value="36">경남</option>
								    <option value="39">제주</option>
								  </select>
		  					</div>
						  
						 </div>
						
					</div>
				</div>
			</div>
		</div> <!-- 상단 검색부분 끝 -->
	
	
		<!-- 맵과 리뷰 등록부분 -->
		<div class="row" >
			<div class="col-xl-6" id="map" style="width:100% ;height:750px"  >
				
				
			
			
			
			</div>
			<div class="col-xl-2" >
				
				<div class="card">
					<div class="card-body" style="width:100% ;height:750px">
						<h3 style="text-align:center">장소 검색</h3>
						<br>
						<div class="input-group mb-3">
						  <input type="text" class="form-control" id="keyword" placeholder="Search">
						  <div class="input-group-append">
						    <button class="btn btn-success" type="submit" id="searchBtn">Go</button>
						  </div>
						</div>
						<div id="displayResultDiv" style="width:100% ;height:590px"  >
							
						
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xl-4" >
				<div class="card" style="width:100% ;height:750px" >
					<div class="card-body">
						<h3 style="text-align:center">리뷰 등록</h3>
						
						<form action="insert.re" method="post" id="reviewEnrollForm" encType="multipart/form-data">
							
							<input type="hidden" name="pageNo" value="<c:out value="${cri.pageNo }"/>" />
							<input type="hidden" name="amount" value="<c:out value="${cri.amount }"/>" />
						
							<input type="hidden" name="type" value="<c:out value="${cri.type }"/>" />
							<input type="hidden" name="keyword" value="<c:out value="${cri.keyword }"/>" />
							<input type="hidden" name="region" value="<c:out value="${cri.region }"/>" />
							<input type="hidden" name="group" value="<c:out value="${cri.group }"/>" />
							<input type="hidden" name="from" value="<c:out value="${cri.from }"/>" />
											
							
							
							<input type="hidden" name="placeNo" />
							
							<div class="form-group">
							  <label for="reviewTitle">리뷰 제목</label>
							  <input type="text" class="form-control" id="reviewTitle" name="reviewTitle">
							</div>
							
							<div class="form-group">
								<label >리뷰 장소</label>
								<p id="placeName" style="color:#61a134">지도에서 장소를 선택해주세요</p>
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
							<button class="btn btn-secondary "  id="listBtn">목록으로 </button>
								
						</form>
						
					
					</div>
				</div>
		
		
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
	
	</div> <!-- container 끝  -->
	<br>
	
		<!--  장소모달 -->
		<div class="modal fade"  id="placeModal">
		  <div class="modal-dialog ">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title placeName" ></h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		        
		        <img id="placeImg" >
		        <p id="placeCategory" class="placeModalP"></p>
		        <p id="placeAddr" class="placeModalP"></p>
		        <p id="placePhone" class="placeModalP"></p>
		        
		        
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button  class="btn btn-primary placeAddBtn" id="placeModalBtn"  >리뷰 쓰기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>

	<script type="text/javascript" src="resources/review.js"></script>
<jsp:include page="../common/footer.jsp"/>