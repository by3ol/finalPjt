<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:include page="../common/menubar1.jsp"/>

	
	
	
 	<div class="container-fluid" id="travelContainer" style="margin-top:70px">
	
		<div class="row">
			<div class="col-xl-8"  >
				<div class="row">
					<div class="col-lg-8 " > <!--맵 메뉴 부분  -->
					
						
						<div class="btn-group" >
							<button type="button" class="btn btn-outline-danger" data-group="음식점"><i class="fas fa-utensils"></i> 음식점</button>
						    <button type="button" class="btn btn-outline-warning" data-group="숙박"><i class="fas fa-bed"></i> 숙박업소</button>
						    <button type="button" class="btn btn-outline-success" data-group="관광지"><i class="fas fa-camera-retro"></i>관광지</button>
						    <button type="button" class="btn btn-outline-info" data-group="레포츠"><i class="fas fa-skiing"></i> 레포츠</button>
						    <button type="button" class="btn btn-outline-primary" data-group="food"><i class="fas fa-bus"></i> 이동수단</button>
						</div>
					
					</div>
					
					<div class="col-lg-4 " > <!-- 검색창부분  -->
						
						<div class="input-group mb-3 ">  
						  <input type="text" class="form-control" id="searchInput">
						  
						  <div class="input-group-append">
						    <button class="btn btn-primary" ><i class="fas fa-search"></i></button>
						  </div>
												  
						  
						 </div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="row" >
			<div class="col-xl-8" id="map"  >
				
				
			
			
			
			</div>
			<div class="col-xl-4">
			
			
			
			
			
			
			
			</div>
		
		
		</div>
	
	</div> 
	


	
	<jsp:include page="../common/footer.jsp"/>