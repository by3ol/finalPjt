<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  

	<jsp:include page="../common/menubar1.jsp"/>
	
	
	
	
 	<div class="container-fluid" id="travelContainer" style="margin-top:70px">
	
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
		</div>
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
						<h3 style="text-align:center">여행 계획</h3>
						<div class="form-group">
						  <label for="travel-name">여행 이름</label>
						  <input type="text" class="form-control" id="travelName" name="travelName">
						</div>
						<div style="width:100%;height:350px;overflow-y:auto;">
							<label >여행 일정</label>
							<ul id="travelUl">
								
							</ul>
						</div>
						<div class="form-group">
							 <label for="travelMemo">여행 메모</label>
		  					<textarea class="form-control" rows="5" id="travelMemo" name="travelMemo"></textarea>
						</div>
							<button class="btn btn-primary " id="travelRegisterBtn">여행 등록</button>
					
					
					
					</div>
				</div>
		
		
			</div>

	
		</div> 

	</div>
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
		      	<button  class="btn btn-primary placeAddBtn" id="placeModalBtn"  >일정에 추가하기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
		<!--  여행추가 모달 -->
		<div class="modal fade"  id="travelAddModal">
		  <div class="modal-dialog ">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title" >날짜를 선택해주세요</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      	<p class="placeName" id="travelAddModalPlaceName"></p>
		        <input type="date" id="travelDate">
		        
		        
		        
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<button  class="btn btn-primary placeAddBtn" id="travelAddModalBtn" >추가하기</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
			<!--  여행 상세 모달 -->
		<div class="modal fade"  id="travelDetailModal">
		  <div class="modal-dialog ">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title  travelDateLabel" ></h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      <ul id="travelDetailModalUl">
		      
		      
		      
		      
		      </ul>
		        
		        
		        
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
		
		
		
		<!--  여행 수정 모달 -->
		<div class="modal fade"  id="travelModifyModal">
		  <div class="modal-dialog ">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title travelDateLabel" ></h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      <ul id="travelModifyModalUl">
		      
		      
		      
		      
		      </ul>
		        
		        
		        
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		     	<button  class="btn btn-primary " id="travelModifyModalBtn" >수정하기</button>
		      	
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		
		    </div>
		  </div>
		</div>
		
		
			<form id="moveForm" action="selectList.tr" method="get">
				<input type="hidden" name="pageNo" value='<c:out value="${cri.pageNo }"/>'>
				<input type="hidden" name="amount"  value='<c:out value="${cri.amount }"/>' />
				
 			</form>
 	
 	
 	<c:if test="${ !empty travel }">
		<script>
			
			$(function(){
				
				
				travelNo=<c:out value="${travel.travelNo}"/>;
				travelRegDate='<fmt:formatDate pattern="yyyy-MM-dd" value="${travel.travelRegDate}" />';
			
				
				
				$travelName.val("<c:out value="${travel.travelName}"/>");
				
				$travelMemo.val("<c:out value="${travel.travelMemo}"/>");
				
				<c:forEach var="travelDetail" items="${travel.travelDetailList}" >
					
					var travelDetail={};
					
					travelDetail.travelDate='<fmt:formatDate pattern="yyyy-MM-dd" value="${travelDetail.travelDate}" />';
					
					
					var travelPlaces=[];
					
					
					<c:forEach var="place" items="${travelDetail.travelPlaces}">
						var place={};
						place.placeNo= <c:out value="${place.placeNo}"/>;
						place.placeName='<c:out value="${place.placeName}"/>';
						
						
						travelPlaces.push(place);
					
				
					</c:forEach>
			
				travelDetail.travelPlaces=travelPlaces;
				travelDetailList.push(travelDetail);
					
	
				</c:forEach>
				
				
				drawTravelList();
				
				
				
			});
		
		</script>
	</c:if>
	
	<script type="text/javascript" src="resources/map.js"></script>
	<jsp:include page="../common/footer.jsp"/>