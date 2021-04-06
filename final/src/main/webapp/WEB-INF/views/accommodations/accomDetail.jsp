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
        padding-top: 100px;
        padding-bottom: 5px;
        overflow: hidden;
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
        
        
        float: right;
        background-color: rgb(240, 240, 233);
       
        
      }
   
     
     .accomReview{
       width: 222px;
       
     }
     .accomReview .btn{
       width: 222px;
       margin: 0;
       padding: 0;
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
      background: #ff7400;
     
      
    }
    .btn3 a{
      text-decoration: none;
      color: black;
      
    }
    .btn3{
      padding-bottom: 20px;
    }
    
    .navbar1 li button{
    border:none;
    background-color:white;
    }
    
    
    .area{
            
            visibility: hidden;
        }
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
            <h3>${ac.placeName }<strong>          ${ac.placeScore }</strong></h3><form action="score.ac" onsubmit="return userChk();"><input type="number" name="placeTotalScore" id="placeTotalScore" class="placeTotalScore" min="0" max="5" value="0" step="0.5"><input type="hidden" name="placeNo" value="${ac.placeNo }"readonly><button type="submit">평점주기</button></form>
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
              <img width="500px" height="300px" src="${ac.placeUrl }" alt="사진" >
             
            </div>
            </div>
            <div class="accomInfoDiv">
              <div class="accomInfo">
                <div>
                  <h4>업체설명</h4>
                  <p>${ac.placeGroup }</p>
                </div>
                <br>
                <br>
                <div>
                  <h4>전화번호</h4>
                  <p>${ac.placePhone}</p>
                </div>
                <br>
                <br>
                <div>
                  <h4>주소</h4>
                  <p>${ac.placeAddr }</p>
                </div>
                <br>
                
                
                <input type="hidden" value="${ac.placeLat }" id="placeLat" >
                <input type="hidden" value="${ac.placeLon }" id="placeLon">
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
              <div class="accomReview">
                <div class="btn">
                  <div class="btn3">
                  <ul>
                    <li>찜</li>
                    <!-- <li><a id="kakao-link-btn" href="javascript:sendLink()">공유하기</a></li> -->
                    <li><a id="kakao-link-btn" class="share" href="javascript:sendLink()">공유하기</a></li>
                  </ul>
                  <a  class="reviewWrite_btn" id="reviewEnrollBtn">리뷰쓰기</a>
                </div>
                  
                </div>
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
		        title: '${t.placeName}',
		        description: '${t.placeGroup}',
		        imageUrl:
		          '${t.placeUrl}',
		        link: {
		          mobileWebUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${t.placeNo},
		          webUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${t.placeNo},
		        },
		      },
		      social: {
		        likeCount: 286,
		        commentCount: 45,
		        sharedCount: 845,
		      },
		      buttons: [
		        {
		          title: '웹으로 보기',
		          link: {
		            mobileWebUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${t.placeNo},
		            webUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${t.placeNo},
		          },
		        },
		        {
		          title: '앱으로 보기',
		          link: {
		            mobileWebUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${t.placeNo},
		            webUrl: 'http://localhost:9090/drommetur/detail.ta?placeNo='+${t.placeNo},
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