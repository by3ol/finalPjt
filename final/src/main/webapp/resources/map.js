	

	var container=document.getElementById("map");

		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.8087371194, 127.7940437093), // 지도의 중심좌표
		        level: 10 // 지도의 확대 레벨
			};

		
		var map = new kakao.maps.Map(container, options); 
		
		var markers=[];
		var placelist=[];
		var travelList=[];
		
		var $placeName=$(".placeName");
		var $travelAddModalPlaceName=$("#travelAddModalPlaceName");
		var $placeImg=$("#placeImg");
		var $placeCategory=$("#placeCategory");
		var $placeAddr=$("#placeAddr");
		var $placePhone=$("#placePhone");
		var $placeAddBtn=$(".placeAddBtn");
		var $placeModalBtn=$("#placeModalBtn");
		var $travelAddModalBtn=$("#travelAddModalBtn");
		var $travelDate=$("#travelDate");
		
		
		$(".place-group").on("click",function(){
			
			var group=$(this).data("group");
			var region=$("select[name=regionNo] option:selected").val();
			
			
			
			$.ajax({
				
				url:"placeList/"+group+"/"+region,
				type:"get",
				
				success:function(list){
					
					removeMarker();
					drawMarkers(list);
				
					
				},
				error:function(){
					
					alert("장소 불러오기 실패");
					
				}
			
			});
			
		
		});
		


	
		function drawMarkers(list){
			
		
			for(var i=0;i<list.length;i++){
				
				var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(list[i].placeLat,list[i].placeLon ), // 마커를 표시할 위치
			     
			    });
				
				marker.idx=i;
				
				
				markers.push(marker);
				placelist.push(list[i]);
				

				

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function(mouseEvent){
					
					
					openPlaceModal(this.idx);
					
					
				
			
				});
				
			}	
			
			
		}
	
		function openPlaceModal(idx){ //사용자가 지도에서 마커를 클릭했을 때 
			
			$placeImg.show();
			$placeAddr.show();
			$placePhone.show();
			
			
			var place=placelist[idx];
			
			if( typeof place.placeUrl !="undefined" && place.placeUrl!=null && place.placeUrl!=""){
					
				$placeImg.attr("src",place.placeUrl);
			 
			}else{
				
				$placeImg.hide();
			}
			
			if( typeof place.placeAddr !="undefined" && place.placeAddr!=null && place.placeAddr!=""){
				
				$placeAddr.text(place.placeAddr);
			 
			}else{
				
				$placeAddr.hide();
			}
			if( typeof place.placePhone !="undefined" && place.placePhone!=null && place.placePhone!=""){
				
				$placePhone.text(place.placePhone);
			 
			}else{
				
				$placePhone.hide();
			}
		
			$placeName.text(place.placeName);
			$placeCategory.text(place.placeCategory+'  '+place.placeScore)
			
			$placeAddBtn.removeData("pno");
			$placeAddBtn.attr("data-pno",place.placeNo);
			
			$("#placeModal").modal("show");
			
		}
	
		$placeModalBtn.on('click',function(){
			
			
			$("#placeModal").modal("hide");
			$("#travelAddModal").modal("show");
			
		});
		
		$travelAddModalBtn.on('click',function(){  //travelAddModal에서 추가하기 버튼을 눌렀을 때 
			
			
			var travelDate=$travelDate.val();
			var placeName=$travelAddModalPlaceName.text();
			var placeNo=$travelAddModalBtn.data("pno");
			
			
		
			
			if(travelDate==""){
				
				
				alert("날짜를 선택해주세요.");
				return;
			}
			
			
			for(var i=0;i<travelList.length;i++){ //travelList[i]의 형태 {2021-03-21:{장소번호 : 장소이름 ,장소번호 : 장소이름 ...}}
				if(travelDate in travelList[i]){  //이미 있는 여행 날짜면
					
					var travel=travelList[i];
					var travelDetail=travel[travelDate];
					
					if(placeNo in travelDetail){ //이미 추가한 장소면 
						
						$travelDate.val("");
						$("#travelAddModal").modal("hide"); //모달 창 닫기
						
						return;
					}else{ //없는 장소면
						
						travelDetail[placeNo]=placeName; //장소 추가
						travel[travelDate]=travelDetail; //여행날짜객체에 추가한 장소 객체를 다시 추가 
						travelList[i]=travel; //수정한 여행날짜객체를 다시 리스트에 추가
						
						drawTravelList(); //ul다시그리기
						
						$travelDate.val("");
						$("#travelAddModal").modal("hide"); //모달 창 닫기
						
						return;
						
					}
				}	
					
			}
				
				//새로 추가된 여행 날짜일때 
				
				var newTravel={}; //새로운 여행날짜객체 만듬 
				var newTravelPlace={};
				newTravelPlace[placeNo]=placeName; //새로운장소객체
				
				
				newTravel[travelDate]=newTravelPlace;
				
				travelList.push(newTravel);
				
				drawTravelList(); //ul 다시그리기
				
				
				$travelDate.val("");
				$("#travelAddModal").modal("hide");
				
			});
	
		function removeMarker() {
			
			
			
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		    placelist=[];
		  
		}
		
		function drawTravelList(){ //여행리스트그리기
			
			var str="";
			for(var i=0;i<travelList.length;i++){
				
				var key=Object.keys(travelList[i])[0]; //travelList[i] 객체의 첫번째 속성 가져오기 = 여행 날짜 
				
				str+='<li  data-idx='+i+'><span style="color:#61a134">'+key+'</span>&nbsp;'
				+' <button class="btn" id="travelModifyBtn"><i class="fas fa-tools"></i></button>'
				+' <button class="btn" id="travelRemoveBtn"><i class="fas fa-trash-alt"></i></button></li>';
				
			}
			
			$("#travelDetailUl").html(str);
			
		}
		
		$("#travelDetailUl").on("click","li #travelRemoveBtn",function(){ //여행리스트에서 삭제 버튼을 클릭했을 때 
			
			if(confirm("여행일정을 삭제하시겠습니까?")){ 
				var idx=$(this).closest("li").data("idx"); //li 태그에서 idx값을 가져와서 
				
					travelList.splice(idx,1); //여행리스트에서 idx에 있는 값 제거 
					drawTravelList(); //여행일정 다시그리기
			}
			
		});
		
		$("#travelDetailUl").on("click","li #travelModifyBtn",function(){ //여행리스트에서 수정버튼을 클릭했을 때 
			
			var idx=$(this).closest("li").data("idx");
			
			$("#travelModifyModalBtn").removeData("idx");
			$("#travelModifyModalBtn").attr("data-idx",idx);
			
			var travel=travelList[idx]; //여행날짜 객체  
			var travelDate=Object.keys(travel)[0]; //여행날짜객체의 첫번째 속성값 : 날짜 
			var travelPlaces=travel[travelDate]; //여행날짜객체에서 날짜값으로 장소들 얻기 
			
			$(".travelDateLabel").text(travelDate); //모달타이틀을 여행날짜로 바꿈 
			
			var str="";
			
			for(var key in travelPlaces){
				
				str+='<li data-pno='+key+'><span style="color:#2d7fc7">'+travelPlaces[key]+'</span>&nbsp;'
				
				+' <button class="btn" ><i class="fas fa-times"></i></button></li>';
				
				
				
			}
			$("#travelModifyPlaceUl").html(str);
			
			$("#travelModifyModal").modal("show"); //여행수정모달열기 
			
			
			
		});
		
		$("#travelModifyPlaceUl").on("click","li button",function(){ //여행수정모달에서 x 버튼을 클릭했을 때 
			
			if(confirm("여행장소를 삭제하시겠습니까?")){ 
				
				$(this).closest('li').remove();
				
				
			}
			
		});
		
		$("#travelModifyModalBtn").on("click",function(){ //여행수정모달에서 수정하기 버튼을 눌렀을 때
			
			var idx=$(this).data("idx");
			
			if($("#travelModifyPlaceUl").find("li").length==0 ){ //해당날짜에 장소가 아무것도 없을 때
				
				travelList.splice(idx,1); //여행리스트에서 idx에 있는 값 제거 
				drawTravelList(); //여행일정 다시그리기
				
				$("#travelModifyModal").modal("hide");
				
				
			}else{
				
				
				var travel=travelList[idx];
				var travelDate=Object.keys(travel)[0];
				var travelPlaces={};
				
				var placeLi=$("#travelModifyPlaceUl").find("li");
				
				for(var i=0;i<placeLi.length;i++){
					travelPlaces[$(placeLi[i]).data("pno")]=$(placeLi[i]).find("span").text();
					
					
					
					
				}
					
					
			
				
				travel={};
				
				travel[travelDate]=travelPlaces;
				
				travelList[idx]=travel;
				
				for(var i=0;i<travelList.length;i++){
					
					console.log(travelList[i]);
				}
				
				drawTravelList(); //여행일정 다시그리기
				
				$("#travelModifyModal").modal("hide");

				
			}
			
			
			
		});
		
		$("#travelDetailUl").on("click","li span",function(){ //여행리스트에서 여행날짜를 클릭했을 때 
			
			var idx=$(this).closest("li").data("idx");
			

			
			var travel=travelList[idx]; //여행날짜 객체  
			var travelDate=Object.keys(travel)[0]; //여행날짜객체의 첫번째 속성값 : 날짜 
			var travelPlaces=travel[travelDate]; //여행날짜객체에서 날짜값으로 장소들 얻기 
			
			$(".travelDateLabel").text(travelDate); //모달타이틀을 여행날짜로 바꿈 
			
			var str="";
			
			for(var key in travelPlaces){
				
				str+='<li style="color:#2d7fc7" data-pno='+key+'>'+travelPlaces[key]+'</li>';
				
				
				
				
				
			}
			$("#travelDetailPlaceUl").html(str);
			
			$("#travelDetailModal").modal("show"); //여행상세모달열기 
			
			
			
		});
		

