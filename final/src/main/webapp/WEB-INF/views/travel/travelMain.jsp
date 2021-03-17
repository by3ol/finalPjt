<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:include page="../common/menubar1.jsp"/>

	
	
	
 	<div class="container-fluid" id="travelContainer" style="margin-top:70px">
	
		<div class="row">
			<div class="col-xl-8"  >
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
			<div class="col-xl-8" id="map" style="width:100% ;height:800px"  >
				
				
			
			
			
			</div>
			
			<div class="col-xl-4">
				<div class="card">
					<div class="card-body">
						<h3 style="text-align:center">여행 계획</h3>
						<div class="form-group">
						  <label for="travel-name">여행 이름</label>
						  <input type="text" class="form-control" id="travelName" name="travelName">
						</div>
						<div style="width:100%;height:300px">
							<label >여행 일정</label>
						
						</div>
						<div class="form-group">
							 <label for="travelMemo">여행 메모</label>
		  					<textarea class="form-control" rows="5" id="travelMemo" name="travelMemo"></textarea>
						</div>
							<button class="btn btn-primary ">여행 등록</button>
					
					
					
					</div>
				</div>
		
		
			</div>
	
	</div> 
	
	</div>

	
	<jsp:include page="../common/footer.jsp"/>