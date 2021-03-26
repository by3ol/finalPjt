	

	var container=document.getElementById("map");

		var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(36.8087371194, 127.7940437093), // 지도의 중심좌표
		        level: 10 // 지도의 확대 레벨
			};

		
		var map = new kakao.maps.Map(container, options); 
		
		var markers=[];
		var placelist=[];
		var travelDetailList=[];
		
		//여행 수정할때 필요한 요소들 
		var travelNo=0;
		var travelRegDate="";
		
		
		
		
		
		//모달외 요소 
		var $placeGroupBtn=$(".place-group");
		var $travelUl=$("#travelUl");
		var $travelName=$("#travelName");
		var $travelMemo=$("#travelMemo");
		var $travelRegisterBtn=$("#travelRegisterBtn");
		
		
		//장소모달 관련된 요소 
		var $placeModal=$("#placeModal");
		var $placeName=$(".placeName");
		var $travelAddModalPlaceName=$("#travelAddModalPlaceName");
		var $placeImg=$("#placeImg");
		var $placeCategory=$("#placeCategory");
		var $placeAddr=$("#placeAddr");
		var $placePhone=$("#placePhone");
		var $placeAddBtn=$(".placeAddBtn"); //장소모달과 여행추가모달 버튼에 공통으로 있는 클래스 속성 
		var $placeModalBtn=$("#placeModalBtn");
		
		//여행추가모달 관련 요소 
		var $travelAddModal=$("#travelAddModal");
		var $travelAddModalBtn=$("#travelAddModalBtn");
		var $travelDate=$("#travelDate");
		
		//여행상세모달 관련요소 
		var $travelDetailModal=$("#travelDetailModal");
		var $travelDateLabel=$(".travelDateLabel"); //여행상세모달, 여행수정모달 공통 제목
		var $travelDetailModalUl=$("#travelDetailModalUl");
		
		//여행수정모달 관련요소 	
		var $travelModifyModal=$("#travelModifyModal");
		var $travelModifyModalUl=$("#travelModifyModalUl");
		var $travelModifyModalBtn=$("#travelModifyModalBtn");
		

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
	
		
		function removeMarker() { //사용자가 장소버튼을 클릭 했을 때 이전의 마커들을 지워주는 함수 
			
			
			$keyword.val("");
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		    placelist=[];
		    $displayResultDiv.empty();
		  
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
			$placeCategory.text(place.placeCategory+'  '+place.placeScore)
			
			$placeAddBtn.removeData("pno");
			$placeAddBtn.attr("data-pno",place.placeNo); //장소모달, 여행추가모달의 버튼의 data-pno값을 현재 장소의 번호로 바꿈 
			
			$placeModal.modal("show"); //장소모달 열기 
			
		}
	
		$placeModalBtn.on('click',function(){ //장소모달에서 일정에 추가하기 버튼을 눌렀을 때 
			
			
			$placeModal.modal("hide");  //장소모달을 닫고 
			$travelAddModal.modal("show"); //여행추가모달을 엶 
			
		});
		
		$travelAddModalBtn.on('click',function(){  //travelAddModal에서 추가하기 버튼을 눌렀을 때 
			
			
			var travelDate=$travelDate.val(); //추가할 여행날짜를 여행추가모달에서 가져옴 
			var placeName=$travelAddModalPlaceName.text(); //추가할 장소의 이름을 여행추가모달에서 가져옴 
			var placeNo=$travelAddModalBtn.data("pno"); //여행추가모달의 버튼에 있던 장소 번호를 가져옴 
				
			console.log(typeof(travelDate));
			if(travelDate==""){ //여행날짜를 선택하지 않았다면 
				
				
				alert("날짜를 선택해주세요.");
				return;
			}
			
			
			for(var i=0;i<travelDetailList.length;i++){ //travelDetailList[i]의 형태 {travelDate : 2021-03-21, travelPlaces : [{placeNo: 33 ,placeName: 장소이름}]}
				
				if(travelDetailList[i].travelDate==travelDate){  //이미 있는 여행 날짜면
					
					var travelDetail=travelDetailList[i]; //여행상세객체 가져옴 
					var travelPlaces=travelDetail.travelPlaces; //여행상세객체의 장소배열도 가져옴 
					
					for(var j=0;j<travelPlaces.length;j++){
						if(travelPlaces[j].placeNo==placeNo){ //이미 추가한 장소면 
							
							$travelDate.val(""); //여행날짜를 초기화 시키고 
							$travelAddModal.modal("hide"); //모달 창 닫기
							
							return;
						}
					}
					//없는 장소면
						
					travelPlaces.push({placeNo:placeNo,placeName:placeName}); //장소배열에 새 장소 추가
						
						
					travelDetail[travelPlaces]=travelPlaces; //여행상세객체에 변경된 장소배열을 다시 추가 
					travelDetailList[i]=travelDetail; //수정한 여행날짜객체를 다시 리스트에 추가
						
					drawTravelList(); //ul다시그리기
						
					$travelDate.val(""); //여행날짜를 초기화 시키고 
					$travelAddModal.modal("hide"); //여행추가 모달 창 닫기
						
					return;
						
					
				}	
					
			}
				
				//새로 추가된 여행 날짜일때 
				
				
				var newTravelPlaces=[]; // 새로운 장소배열 만듦
				
				newTravelPlaces.push({placeNo:placeNo,placeName:placeName}); //장소배열에 새로운장소객체 넣기
				
				var newTravelDetail={travelDate:travelDate,travelPlaces:newTravelPlaces}; //새로운 여행상세객체 만듦
				
				
				travelDetailList.push(newTravelDetail); //여행리스트에 추가하기 
				
				

				drawTravelList(); //ul 다시그리기
				
				
				$travelDate.val(""); //여행날짜를 초기화 시키고 
				$travelAddModal.modal("hide"); //여행추가 모달 창 닫기
				
			});
	

		
		function drawTravelList(){ //여행리스트그리기
			
			
			travelDetailList.sort(function(left,right){
				
				return left.travelDate>right.travelDate? 1:-1;
			
			
			}); //날짜순으로 정렬
			
			
			var str="";
			for(var i=0;i<travelDetailList.length;i++){ //여행리스트에 있는 객체들을 그림 
				
				var travelDate=travelDetailList[i].travelDate; //travelDetailList[i] 객체의 날짜 속성 가져오기 
				
				str+='<li  data-idx='+i+'><span style="color:#61a134">'+travelDate+'</span>&nbsp;'
				+' <button class="btn" id="travelModifyBtn"><i class="fas fa-tools"></i></button>'
				+' <button class="btn" id="travelRemoveBtn"><i class="fas fa-trash-alt"></i></button></li>';
				
			}
			
			$travelUl.html(str); //ul 밑에 추가 
			
		}
	
		$travelUl.on("click","li #travelRemoveBtn",function(){ //여행리스트에서 삭제 버튼을 클릭했을 때 
			
			if(confirm("여행일정을 삭제하시겠습니까?")){ 
				var idx=$(this).closest("li").data("idx"); //li 태그에서 idx값을 가져와서 
				
					travelDetailList.splice(idx,1); //여행리스트에서 idx에 있는 값 제거 
					drawTravelList(); //여행일정 다시그리기
			}
			
		});
		
		$travelUl.on("click","li #travelModifyBtn",function(){ //여행리스트에서 수정버튼을 클릭했을 때 
			
			var idx=$(this).closest("li").data("idx"); //li 태그에서 idx값을 가져와서
			
			$travelModifyModalBtn.removeData("idx"); // 여행수정모달의 버튼의 idx값을 없애고 
			$travelModifyModalBtn.attr("data-idx",idx); //현재 list idx값으로 추가하기 
			
			var travelDetail=travelDetailList[idx]; //idx값으로 여행상세리스트에서 여행상세 객체 가져오기  
			var travelDate=travelDetail.travelDate; //여행상세객체의 날짜속성 가져옴
			var travelPlaces=travelDetail.travelPlaces; //여행상세객체의 장소배열 가져오기
			
			$travelDateLabel.text(travelDate); //모달타이틀을 여행날짜로 바꿈 
			
			var str="";
			
			for(var i=0;i<travelPlaces.length;i++){ //장소객체를 순회하면서 li를 만듬 
				
				str+='<li data-pno='+travelPlaces[i].placeNo+'><span style="color:#2d7fc7">'+travelPlaces[i].placeName+'</span>&nbsp;'
				
				+' <button class="btn" ><i class="fas fa-times"></i></button></li>';
				
				
				
			}
			$travelModifyModalUl.html(str); //여행수정모달 ul에 li추가 
			
			$travelModifyModal.modal("show"); //여행수정모달열기 
			
			
			
		});
		
	
		$travelUl.on("click","li span",function(){ //여행리스트에서 여행날짜를 클릭했을 때 -> 여행상세모달 열기
			
			var idx=$(this).closest("li").data("idx");
			

			
			var travelDetail=travelDetailList[idx]; //idx값으로 여행상세리스트에서 여행상세 객체 가져오기  
			var travelDate=travelDetail.travelDate; //여행상세객체의 날짜속성 가져옴
			var travelPlaces=travelDetail.travelPlaces; //여행상세객체의 장소배열 가져오기
			
			$travelDateLabel.text(travelDate); //모달타이틀을 여행날짜로 바꿈 
			
			var str="";
			
			for(var i=0;i<travelPlaces.length;i++){ //장소객체를 순회하면서 li를 만듬 
				
				str+='<li style="color:#2d7fc7" data-pno='+travelPlaces[i].placeNo+'>'+travelPlaces[i].placeName+'</li>';
				
				
			}
			$travelDetailModalUl.html(str);  //여행상세모달  ul에 li추가 

			
			$travelDetailModal.modal("show"); //여행상세모달열기 
			
			
			
		});
		
		
		
		
		
		$travelModifyModalUl.on("click","li button",function(){ //여행수정모달에서 x 버튼을 클릭했을 때 
			
			if(confirm("여행장소를 삭제하시겠습니까?")){ 
				
				$(this).closest('li').remove(); //리스트를 지움 
				
				
			}
			
		});
		
		$travelModifyModalBtn.on("click",function(){ //여행수정모달에서 수정하기 버튼을 눌렀을 때
			
			var idx=$(this).data("idx"); //버튼에 있는 여행리스트에서 현재 여행날짜객체가 들어있는 인덱스를 가져옴 
			
			if($travelModifyModalUl.find("li").length==0 ){ //수정후에 해당날짜에 장소가 아무것도 없을 때
				
				travelDetailList.splice(idx,1); //여행리스트에서 idx에 있는 값 제거 
				drawTravelList(); //여행일정 다시그리기
				
				$travelModifyModal.modal("hide"); //여행수정모달 닫기 
				
				
			}else{
				
				
				var travelDetail=travelDetailList[idx]; //여행상세리스트에서 여행상세객체 가져옴 
				var travelDate=travelDetail.travelDate;
				var travelPlaces=[]; //새로 만들 장소배열
				
				var placeLi=$travelModifyModalUl.find("li"); //여행수정 모달에 있는 ul의 li를 가져옴 
				
				for(var i=0;i<placeLi.length;i++){
					
					var placeNo=$(placeLi[i]).data("pno"); //li의 data속성인 장소번호를 가져옴
					var placeName=$(placeLi[i]).find("span").text(); //li의 텍스트 =장소이름을 가져옴 
					
					
					var travelPlace={placeNo:placeNo,placeName:placeName};
					
					
					travelPlaces.push(travelPlace); //모달에 있는 li로 장소배열 다시만듦  
					
					
					
					
				}
				
				var newTravelDetail={}; //새로운 여행상세객체만듦 
				newTravelDetail.travelDate=travelDate;
				newTravelDetail.travelPlaces=travelPlaces;
				
				
				travelDetailList[idx]=newTravelDetail; //새로운 여행날짜객체를 여행리스트에 넣음 
				

				drawTravelList(); //여행일정 다시그리기
				
				$travelModifyModal.modal("hide"); //여행수정모달 닫기 

				
			}
			
			
			
		});
	
		$travelRegisterBtn.on("click",function(){ //여행등록버튼을 클릭 했을 때
			
			if($travelName.val()==""){
				alert("여행 이름을 입력해주세요.");
				return;
			}
			
			if(travelDetailList.length==0){
				
				alert("여행일정을 추가해주세요. ");
				return; 
			}
			
			var travelName=$travelName.val();
			var travelMemo=$travelMemo.val();
			
			var travelObj={travelNo : travelNo, travelName :travelName, travelMemo:travelMemo ,travelRegDate: travelRegDate, travelDetailList : travelDetailList };
			var travel =JSON.stringify(travelObj);
			
			if(travelNo==0){ //새로등록한 여행일때 
			
				

			
				$.ajax({
					
					type:"post",
					url:"insert.tr",
					data : travel,
					contentType: 'application/json',
					success : function(msg){
						
							travelDetailList=[];
						
							$travelName.val("");
							$travelMemo.val("");
							drawTravelList();
							
							alert("등록이 완료되었습니다.");
						
					},
					error: function(){
						
						alert("등록에 실패하였습니다.");
					}
					
					
					
				});
				
			
			}else{ //수정하는 여행일때
				
				
				
				
				$.ajax({
					
					type:"post",
					url:"modify.tr",
					data :  travel,
					contentType: 'application/json',
					success : function(msg){
						
							travelDetailList=[];
						
							$travelName.val("");
							$travelMemo.val("");
							drawTravelList();
							
							alert("수정을 완료하였습니다.");
							
							$("#moveForm").submit();
							
						
					},
					error: function(){
						
						alert("수정에 실패하였습니다.");
					}
					
					
					
				});
				
				
				
			}
				
		});
		
		
		
		
		

