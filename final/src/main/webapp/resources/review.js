	var container=document.getElementById("map");

		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.8087371194, 127.7940437093), // 지도의 중심좌표
		        level: 10 // 지도의 확대 레벨
			};

		
		var map = new kakao.maps.Map(container, options); 
		
		var markers=[];
		var placelist=[];
		
	
		//모달외 요소 
		var $placeGroupBtn=$(".place-group");
		var $placeNo=$('input[name=placeNo]');
		var $placeNameP=$("#placeName");
		var $registerBtn =$("#registerBtn");
		
		//장소모달 관련된 요소 
		var $placeModal=$("#placeModal");
		var $placeName=$(".placeName");
		var $travelAddModalPlaceName=$("#travelAddModalPlaceName");
		var $placeImg=$("#placeImg");
		var $placeCategory=$("#placeCategory");
		var $placeAddr=$("#placeAddr");
		var $placePhone=$("#placePhone");
		var $placeAddBtn=$(".placeAddBtn"); 
		var $placeModalBtn=$("#placeModalBtn");	
		var $placeNameInPlaceModal=$("#placeModal").find(".placeName");
		//검색관련 요소
		
		var $searchBtn=$("#searchBtn");
		var $keyword=$("#keyword");
		var $displayResultDiv=$("#displayResultDiv");
		
		
		$placeGroupBtn.on("click",function(){ //음식점, 관광지,레포츠, 숙박 버튼중하나를 누르면 
			
			var group=$(this).data("group");
			var region=$("select[name=regionNo] option:selected").val(); //지역을 가져와서 
			
			
			
			$.ajax({ //요청
				
				url:"placeList/"+group+"/"+region,
				type:"get",
				
				success:function(list){
					
					removeMarker();
					drawMarkers(list); //지도에 장소 마커 그리기 
				
					
				},
				error:function(){
					
					alert("장소 불러오기 실패");
					
				}
			
			});
			
		
		});
		
		$searchBtn.on("click",function(){ //검색버튼을 누르면 
			
			
			if($keyword.val().trim().length==0){
				alert("키워드를 입력해주세요. ");
				return;
			}
			
			$.ajax({ //요청
					
					url:"placeList",
					type:"get",
					data: {keyword:$keyword.val()},
					success:function(list){
						
						removeMarker();
						drawsearchMarkers(list); //지도에 장소 마커 그리기 
					
						
					},
					error:function(){
						
						alert("검색 실패");
						
					}
				
				});
			
			
			
		});
		
		function removeMarker() { //사용자가 장소버튼을 클릭 했을 때 이전의 마커들을 지워주는 함수 
			
			
			$keyword.val("");
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		    placelist=[];
		    $displayResultDiv.empty();
		  
		}
		
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
					
					
					openPlaceModal(this.idx); //마커를 클릭하면 장소모달이 열리게 설정 
					
					
				
			
				});
				
			}	
			
			
		}
		
		function drawsearchMarkers(list){
			
			var str="";
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
					
					
					openPlaceModal(this.idx); //마커를 클릭하면 장소모달이 열리게 설정 
					
					
				
			
				});
				
				str+='<div class="card searchResults" data-idx='+i+'><div class="card-body"><h6>'+list[i].placeName+'</h6>';
				
				
				if( typeof list[i].placeAddr !="undefined" && list[i].placeAddr!=null && list[i].placeAddr!=""){
					
					str+='<p style="font-size:0.8em">'+list[i].placeAddr+'</p>';
				 
				}
				

				if( typeof list[i].placePhone !="undefined" && list[i].placePhone!=null && list[i].placePhone!=""){
					
					str+='<p style="font-size:0.8em">'+list[i].placePhone+'</p>';
				 
				}
				
				
				str+='</div></div>';
				
			}	
			
			$displayResultDiv.html(str);
		}
		
		$displayResultDiv.on("click",".searchResults",function(){ //검색결과를 클릭했을때
			
			
			openPlaceModal($(this).data("idx"));  //장소모달이 열리게설정
			
		});
		
		function openPlaceModal(idx){ //사용자가 지도에서 마커를 클릭했을 때 
			
			$placeImg.show();  //혹시나 이전에 지워졌을지도 모르는 요소들을 보이게 함 
			$placeAddr.show();
			$placePhone.show();
			
			
			var place=placelist[idx]; //마커에 해당하는 장소를 배열에서 가지고옴 
			
			if( typeof place.placeUrl !="undefined" && place.placeUrl!=null && place.placeUrl!=""){ //없는 요소들은 지우고 있는 요소들은 값을 바꿈 
					
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
			$placeCategory.text(place.placeCategory+'  '+place.placeScore);
			
			$placeNameInPlaceModal.removeData("group");
			$placeNameInPlaceModal.attr("data-group",place.placeGroup); //상세페이지조회에 필요한 그룹 설정
			
			$placeAddBtn.removeData("pno");
			$placeAddBtn.attr("data-pno",place.placeNo); //장소모달, 여행추가모달의 버튼의 data-pno값을 현재 장소의 번호로 바꿈 
			
			$placeModal.modal("show"); //장소모달 열기 
			
		}
		
		$placeModalBtn.on('click',function(){ //장소모달에서 리뷰에 추가하기 버튼을 눌렀을 때 
			
			
			$placeNo.val($(this).data("pno")); //폼안의 장소번호를 선택한 장소번호로 설정 
			$placeNameP.text($placeName.text());
			
			
			$placeModal.modal("hide");  //장소모달을 닫고 
			
			
		});
		
		$registerBtn.on("click",function(e){
			
			var $reviewEnrollForm=$("#reviewEnrollForm");
			
			
			if($reviewEnrollForm.find("input[name=reviewTitle]").val().trim().length==0){
				
				alert("리뷰 제목을 입력하세요.");
				return false;
			}
			
			if(!$reviewEnrollForm.find("input[name=placeNo]").val()){
				
				alert("리뷰 장소를 선택하세요.");
				return false;
			}
			
			if($reviewEnrollForm.find("textarea").val().trim().length==0){
				
				alert("리뷰 내용을 입력하세요.");
				return false;
			}
			
			$reviewEnrollForm.submit();
				
		
			
			
		});
		
		$("#listBtn").on("click",function(e){
		
			e.preventDefault();
			
			$("#moveForm").submit();
	
		});
		
		$placeNameInPlaceModal.on("click",function(){
			
			var url="detail.";
			var pno=$placeModal.find("#placeModalBtn").data("pno");
			var group=$(this).data("group");
			
			if(group=="음식점"){
				
				url+="ta";
			}else if(group=="숙박"){
				url+="ac";
				
			}else{
				url+="at";
				
			}
			
			url+="?placeNo="+pno;
			
			window.open(url,'_blank');
			
			
		});