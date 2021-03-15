<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
      .navbarDiv .navbar1{
        width: 650px;
        height: 48px;
        margin: 0%;
        padding: 0%;
        padding-top: 3px;
        margin: auto;


      
      }

      .navbar1 li{
        float: left;
        list-style-type: none;
        padding: 16px;
      }
      /*상세페이지*/
      .foodDetailViewDiv{
        padding-top: 30px;
      }
      .foodDetailViewDiv .foodDetailViewForm{
        margin: auto;
        
      }
      .foodDetailViewTitle{

        margin: 0 auto;
        width: 922px;
        position: relative;
        padding-top: 11px;
        padding-bottom: 15px;
        overflow: hidden;
      }
      .foodDetailViewTitle h3{
        margin: 0;
        padding: 0;
      }
      .foodDetailViewTitle p{
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
      .foodImgList{
        padding-top: 30px;
        margin: 0 auto;
        width: 1000px;
        position: relative;
        padding-top: 11px;
        padding-bottom: 15px;
        overflow: hidden;
      }
      
      .foodInfoDiv{
        margin: 0 auto;
        width: 922px;
        position: relative;
        padding-top: 8px;
        padding-bottom: 5px;
        overflow: hidden;
      }
      .foodInfoDiv .foodInfo div h4{
        margin:3px;
        margin-left: auto;
        padding: 0;

      }
      .foodInfoDiv .foodInfo div p{
        margin-top: 2px;
        margin-left: auto;
        padding: 0;
      }
      .foodInfo{
        width: 65%;
        margin-right: 0;
        float: left;
      }
      .foodReview{
        
        
        float: right;
        background-color: rgb(240, 240, 233);
        height: 250px;
        
      }
   
     
     .foodReview{
       width: 222px;
       
     }
     .foodReview .btn{
       width: 222px;
       margin: 0;
       padding: 0;
     }
     .foodReview h4{
      margin-left: 3px;
     }
     .foodReview p{
      margin-left: 4px;
     }
     .foodReview .btn ul{
       margin: 0 auto;
       overflow: hidden;
       padding: 0;
      padding-bottom: 10px;
      padding-top: 10px;
     }
     .foodReview .btn ul li{
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
      background: #ff7400;
     
      
    }
    .btn3 a{
      text-decoration: none;
      color: white;
      
    }
    .btn3{
      padding-bottom: 20px;
    }
    
    
</style>
<body>
<jsp:include page="../common/menubar1.jsp"/>
<div class="container-fluid" style="margin-top:70px">

<div class="wrab">
      <div class="header">
        <div class="searchbar">
        <span class="info">검색 : <input type="text" name="searchloc">
        </span>  
        </div>
      </div>
      <div class="body">
        <hr>
        <div class="navbarDiv">
        <ul class="navbar1" >
            <li class="a">전체</li>
            <li class="k">한식</li>
            <li class="w">양식</li>
            <li class="c">카페/디저트</li>
            <li class="t">중식/일식/세계음식</li>
            <li class="f">패스트푸드</li>
        </ul>
      </div>
      <!--상세페이지-->
      <div class="foodDetailViewDiv">
        <div class="foodDetailViewForm">
          <div class="foodDetailViewTitle">
            <h3>${t.placeName }<strong>${t.placeScore }</strong></h3>
            <p>${t.placeCategory }</p>
            <ul class="score">
              <li><span><img src="" width="25px" height="25px">좋아요</span></li>
              <li><span><img src="" width="25px" height="25px">${t.placeCount }</span></li>
            </ul>
           
          </div>
          <div class="foodImgList">
            <div class="img" align = "center">
              <img width="500px" height="300px" src="http://tong.visitkorea.or.kr/cms/resource/22/1744722_image2_1.jpg
              " alt="사진" >
             
            </div>
            </div>
            <div class="foodInfoDiv">
              <div class="foodInfo">
                <div>
                  <h4>업체설명</h4>
                  <p>${t.placeGroup }</p>
                </div>
                <div>
                  <h4>전화번호</h4>
                  <p>${t.placePhone}</p>
                </div>
                <div>
                  <h4>주소</h4>
                  <p>${t.placeAddr }</p>
                </div>
                
                <input type="hidden" value="${t.placeLat }" id="placeLat" >
                <input type="hidden" value="${t.placeLon }" id="placeLon">
                <div id="map" style="width:650px;height:400px;"></div>
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

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
				</script>
              </div>
              <div class="foodReview">
                <div class="btn">
                  <div class="btn3">
                  <ul>
                    <li>좋아요</li>
                    <li><a id="kakao-link-btn" href="javascript:sendLink()">공유하기</a></li>
                    
                   
                  </ul>
                  <a href="" class="reviewWrite_btn">리뷰쓰기</a>
                </div>
                  <h4>매장 연관 태그</h4>
                  <a href="">태그</a>
                </div>
              </div>
            </div>
            
            
            </div>
            </div>
      </div>

            
      <div class="footer">

      </div>
  </div>  
  </div>
</body>
</html>