	

	var container=document.getElementById("map");

		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.8087371194, 127.7940437093), // 지도의 중심좌표
		        level: 10 // 지도의 확대 레벨
			};

		
		var map = new kakao.maps.Map(container, options); 
		
		var markers=[];
		var overlays=[];
		var removeoverlay;
		

		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
		    
			if(removeoverlay!=null)
				removeoverlay.setMap(null);
		    
		});
		
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

				
				var content = '<div class="card" style="width:300px">';
										
											
				
								if( typeof list[i].placeUrl !="undefined" && list[i].placeUrl!=null && list[i].placeUrl!=""){
										content+='<img class="card-img-top" src="'+list[i].placeUrl+'">';
				
									}
				
					content+='<div class="card-body">'+
					'<h4 class="card-title" style="width:300px" data-pNo="'+list[i].placeNo+'">'+list[i].placeName+'</h4>'+
					'<p class="card-text" style="width:300px"> '+list[i].placeCategory+'&nbsp;'+list[i].placeScore+'</p>'+
					'<p class="card-text" style="width:300px">주소 : '+list[i].placeAddr+'</p>'+
					'<p class="card-text" style="width:300px">전화번호 : '+list[i].placePhone+'</p>'+
 
					'<a href="#" class="btn btn-primary">일정에 추가하기</a>'+
				'</div></div>';
				
				
//				var $card=$('<div class="card" style="width:300px" />');
//				
//				var $cardbody=$('<div class="card-body" />');
//				var $title=$('<h4 class="card-title" data-pNo="'+list[i].placeNo+' />').text(list[i].placeName);
//				var $category=$('<p class="card-text" />').text(list[i].placeCategory+'&nbsp;'+list[i].placeScore);
//				var $addr=$('<p class="card-text" />').text('주소 : '+list[i].placeAddr);
//				var $phone=$('<p class="card-text" />').text('전화번호 : '+list[i].placePhone);
//				var $button=$('<a href="#" class="btn btn-primary" />').text('일정에 추가하기');
//				
//				
//				
//				
//				if( typeof list[i].placeUrl !="undefined" && list[i].placeUrl!=null && list[i].placeUrl!=""){
//					
//					 var $image=$('<img class="card-img-top" src="'+list[i].placeUrl+'">');
//					 $card.append($image);
//				}
//				
//				$card.append($cardbody);
//				
//				$cardbody.append($title).append($category).append($addr).append($phone).append($button);
//				
//				var content=$card[0];
				
				var overlay = new kakao.maps.CustomOverlay({
				    content: content,
				    map: map,
				    position: marker.getPosition()       
				});

				overlay.setMap(null);
				
				overlays.push(overlay);
				
				

				// 마커에 클릭이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'click', function(mouseEvent){
					
					if(removeoverlay!=null)
						removeoverlay.setMap(null);
						
					var overlay=overlays[this.idx];
					
					overlay.setMap(map);
					
					removeoverlay=overlays[this.idx];
				
			
				});
				
			}	
			
			
		}
	
		
		function removeMarker() {
			
			if(removeoverlay!=null)
				removeoverlay.setMap(null);
			
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		    overlays=[];
		  
		}
		//주석 
