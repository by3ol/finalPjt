	

	var container=document.getElementById("map");

		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
			};

		
		var map = new kakao.maps.Map(container, options); 
		
		var markers=[];
		var infowindows=[];
		var removewindow;
		

		
	$(".place-group").on("click",function(){
			
			var group=$(this).data("group");
			
			
			$.ajax({
				
				url:"placeList/"+group,
				type:"get",
				data:{group:group},
				success:function(list){
					
					
					drawMarkers(list);
				
					
				},
				error:function(){
					
					alert("장소 불러오기 실패");
					
				}
			
			});
			
			
			
			
			
		});
		
		function drawMarkers(list){
			

			
			
			
			for(var i=0;i<2;i++){
				
				var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new kakao.maps.LatLng(list[i].placeLat,list[i].placeLon ), // 마커를 표시할 위치
			     
			    });
				
				marker.idx=i;
				
				
				markers.push(marker);
				
//				var infowindow = new kakao.maps.InfoWindow({
//					position: marker.getPosition(),
//				    content : '<div style="padding:5px;">'+list[i].placeName+'</div>',
//				    removable : true
//				});
//				
//				
//				infowindows.push(infowindow);

//				// 마커에 클릭이벤트를 등록합니다
//				kakao.maps.event.addListener(marker, 'click', function(mouseEvent){
//					
//					if(removewindow!=null)
//					removewindow.close();
//						
//					var infowindow=infowindows[this.idx];
//					
//					infowindow.open(map,this);
//					
//					removewindow=infowindows[this.idx];
//				
//			
//				});
				
			}	
			
			
		}
	
		
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		    infowindows=[];
		  
		}
		
