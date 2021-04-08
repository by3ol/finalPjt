<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <style>
      /*메뉴*/
      .searchbar {
        text-align: center;
        
      }
      .body .navbarDiv{
        text-align: center;
        padding-top: 8px;
        height: 55px;
        
      }
    
    
      /*상세페이지*/
      .accomDetailViewDiv{
        padding-top: 30px;
      }
      .accomDetailViewDiv .accomDetailViewForm{
        margin: auto;
        
      }
      .accomDetailViewTitle{
        margin: 0 auto;
        width: 922px;
        position: relative;
        padding-top: 11px;
        padding-bottom: 15px;
        overflow: hidden;
      }
      .accomDetailViewTitle h3{
        margin: 0;
        padding: 0;
      }
      .accomDetailViewTitle p{
        margin: 0;
        padding: 0;
      }
      .score{
        margin: 0;
        padding: 0;
      }
      .score li{
        float: left;
        list-style-type: none;
        padding-right: 16px;
      }
      .accomImgList{
        padding-top: 30px;
        margin: 0 auto;
        width: 1000px;
        position: relative;
        padding-top: 11px;
        padding-bottom: 15px;
        overflow: hidden;
      }
      
      .accomInfoDiv{
        margin: 0 auto;
        width: 922px;
        position: relative;
        padding-top:30px;
        padding-bottom: 5px;
        overflow: hidden;
            border-top: 3px solid #f1f1f1;
      }
      .accomInfoDiv .accomInfo div h4{
        margin:3px;
        margin-left: auto;
        padding: 0;
      }
      .accomInfoDiv .accomInfo div p{
        margin-top: 2px;
        margin-left: auto;
        padding: 0;
      }
      .accomInfo{
        width: 65%;
        margin-right: 0;
        float: left;
      }
      .accomReview{
      	width:800px;
        
        margin:0 auto;
        
        
       
        
      }
   
 
     .accomReview h4{
      margin-left: 3px;
     }
     .accomReview p{
      margin-left: 4px;
     }
     .accomReview .btn ul{
       margin: 0 auto;
       overflow: hidden;
       padding: 0;
      padding-bottom: 10px;
      padding-top: 10px;
     }
     .accomReview .btn ul li{
       list-style: none;
       float: left;
       text-align: center;
       width: 50%;
      
     }
     .reviewWrite_btn{
      display: block;
      width: 222px;
      font-size: 32px;
      font-weight: 700;
      height: 54px;
      color:black;
     
      
     
      
    }
    
    
    #kakao-link-btn{
    	display: block;
      width: 222px;
      font-size: 32px;
      font-weight: 700;
      height: 54px;
      color : black;
    
    }
   
    
 
    
    .navbar1 li button{
    border:none;
    background-color:white;
    }
    
    
    .area{
            
            visibility: hidden;
        }
        strong{
    color : orange;}
  
    #map{
    width:800px;
    height:400px;
    margin:0 auto;
    
    }
    .btn3 ul{
        border-top: 1px solid #f1f1f1;
    margin : 0 auto;
    width:800px;
     display: flex;
    align-items: center;
    height: 74px;
    }
    .btn3 ul li{
    width:500px;
    height:54px;
    margin-left:30px;
    text-align: center;
    }
     .btn3 ul li a{

    text-align: center;
    text-decoration: none;
    }
    #naverSearch{
    display: block;
    width: 222px;
    font-size: 32px;
    font-weight: 700;
    height: 54px;
    color: black;}
    #scoreBtn{
    padding:4px 15px;}
 	
</style>
<body>
<jsp:include page="../common/menubar1.jsp"/>
<div class="container-fluid" style="margin-top:70px">

<div class="wrab">
      <jsp:include page="../accommodations/accomMenubar.jsp"/>
        <div class="body">
      <!--상세페이지-->
      <div class="accomDetailViewDiv">
        <div class="accomDetailViewForm">
          <div class="accomDetailViewTitle">
            <h3>${ac.placeName }<strong>          ${ac.placeScore }</strong></h3><form action="score.ac" onsubmit="return userChk();"><input type="number" name="placeTotalScore" id="placeTotalScore" class="placeTotalScore" min="0" max="5" value="0" step="0.5"><input type="hidden" name="placeNo" value="${ac.placeNo }"readonly><button type="submit" class="btn btn-warning" id="scoreBtn">평점주기</button></form>
            <script>
            
            function userChk(){
            	if(${!empty sessionScope.loginUser}){
            		return true;
            	}else{
            		alert("로그인을 해주세요");
            		return false;
            	}
            	
            }
            </script>
            <p>${ac.placeCategory }</p>
            <ul class="score">
              
              <li><span><img src="<%=request.getContextPath() %>/resources/images/placeCount.png" width="40px" height="25px">${ac.placeCount }</span></li>
            </ul>
           
          </div>
          <div class="accomImgList">
            <div class="img" align ="center">
              <img width="800px" height="400px" src="${ac.placeUrl }" alt="사진" >
             
            </div>
            </div>
           
            <div class="accomReview">
                <div class="btn">
                  <div class="btn3">
                  <ul>
                  <li><a style="color:black;" id="naverSearch" class="naverSearch" target="_blank" href="https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=${ac.placeName }">블로그</a></li>
                  <li><a id="kakao-link-btn" class="share" href="javascript:sendLink()">공유하기</a></li>
                  
                  <li><a class="reviewWrite_btn" id="reviewEnrollBtn">리뷰쓰기</a></li>
                  
                  </ul>
                        
		
                </div>
                  
                </div>
              </div>
                
            <div class="accomInfoDiv">
              <div class="accomInfo">
                <div>
                  <h4>업체설명</h4><p>${ac.placeGroup }</p>
                </div>
                <div>
                  <h4>전화번호</h4><p><a href="tel:${ac.placePhone}">${ac.placePhone}</a></p>
                </div>
                <div>
                  <h4>주소</h4><p>${ac.placeAddr }</p>
                </div>
                <br>
                
                
                <input type="hidden" value="${ac.placeLat }" id="placeLat" >
                <input type="hidden" value="${ac.placeLon }" id="placeLon">
                <div class="mapForm">
                <div id="map" style="width:800px;height:400px;margin-left:65px"></div>
                </div>
              
              	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cdc8b55964d8909243d354220777e13"></script>
              	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
              	
              	<script>
				var container = document.getElementById('map');
				var placeLat = document.getElementById('placeLat').value;
				var placeLon = document.getElementById('placeLon').value;
				
				var options = {
				center: new kakao.maps.LatLng(placeLat,placeLon),
				level: 3
				};
				var map = new kakao.maps.Map(container, options);
			
			// 마커가 표시될 위치입니다 
		
		
			var markerPosition  = new kakao.maps.LatLng(placeLat, placeLon); 
			var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fot1vH%2FbtqZ6jFjd0Q%2FMtecyutepMcvjRqKoVXIk1%2Fimg.png', // 마커이미지의 주소입니다    
	   	 	imageSize = new kakao.maps.Size(53, 65), // 마커이미지의 크기입니다
	    	imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
	  
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
		   	 	position: markerPosition,
		    	image: markerImage 
				});
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			var iwContent = '<div style="padding:30px;","overflow:hidden;">${ac.placeAddr}<br><a href="https://map.kakao.com/link/map/${ac.placeAddr},${ac.placeLat },${ac.placeLon }" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/${ac.placeAddr},${ac.placeLat},${ac.placeLon}" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		    iwPosition = new kakao.maps.LatLng(${ac.placeLat }, ${ac.placeLon }); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
			});
		  
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker); 
			// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
			// marker.setMap(null);    
				</script>
              </div>
              
            </div>
            
            
            </div>
            </div>
      </div>
      
      <form id="reviewEnrollForm" action="enrollFormWithPlace.re" method="get">
      	<input type="hidden" name="placeNo" value=<c:out value="${ac.placeNo}" /> />
      	<input type="hidden" name="placeName" value="<c:out value="${ac.placeName}" />" />
      
      </form>
      
      <script>
		$("#reviewEnrollBtn").on("click",function(e){
			
			
			e.preventDefault();
			
			if(${empty sessionScope.loginUser}){
				
				alert("로그인을 해주세요");
				return;
			}
			
			
			$("#reviewEnrollForm").submit();
			
		});
      
      </script>
		      
		
<script type="text/javascript">
		
	Kakao.init('7cdc8b55964d8909243d354220777e13');
	function sendLink() {
    Kakao.Link.sendDefault({
      objectType: 'feed',
      content: {
        title: '${ac.placeName}',
        description: '${ac.placeGroup}',
        imageUrl:
          '${ac.placeUrl}',
        link: {
          mobileWebUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${ac.placeNo},
          webUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${ac.placeNo},
        },
      },
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${ac.placeNo},
            webUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${ac.placeNo},
          },
        },
        {
          title: '앱으로 보기',
          link: {
            mobileWebUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${ac.placeNo},
            webUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${ac.placeNo},
          },
        },
      ],
    })
  }
</script>
    <br><br><br>
      <jsp:include page="../common/footer.jsp" />
  </div>  
  </div>
</body>
</html>