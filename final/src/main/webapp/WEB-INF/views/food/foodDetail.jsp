<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
      /*메뉴*/
      .searchbar {
        text-align: center;
        padding-top: 20px;
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
        padding-top: 8px;
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
        width: 22.5%;
        margin-right: 32px;
        float: right;
        background-color: lightgray;
        height: 250px;
        
      }
     .like{
        width: 100px; 
        margin: 0%;
        padding: 0%;
        border: 0;
        background-color: lightgray;
     }
     .share{
       width: 100px;
       margin: 0%;
        padding: 0%;
        border: 0;
        background-color: lightgray;
     }
     .reviewWrite{
       width: 206px;
       margin: 0%;
        padding: 0%;
        border: 0;
        background-color: aqua
     }
     .foodReview h4{
      margin-left: 3px;
     }
     .foodReview p{
      margin-left: 4px;
     }
    </style>
</head>
<body>
<div class="wrab">
      <div class="header">
        <div class="searchbar">
        <sapn class="info">검색 : <input type="text" name="searchloc"></sapn>  
        </div>
      </div>
      <div class="body">
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
            <h3>가게 이름<strong>점수</strong></h3>
            <p>가게 설명</p>
            <ul class="score">
              <li><span>♥좋아요</span></li>
              <li><span>눈 조회수</span></li>
            </ul>
           
          </div>
          <div class="foodImgList">
            <div class="img">
              <img width="300px" height="300px" src="images/flower1.PNG" alt="사진">
              <img width="300px" height="300px" src="images/flower2.PNG" alt="사진">
              <img width="300px" height="300px" src="images/flower3.PNG" alt="사진">
            </div>
            </div>
            <div class="foodInfoDiv">
              <div class="foodInfo">
                <div>
                  <h4>지역</h4>
                  <p>설명</p>
                </div>
                <div>
                  <h4>업종</h4>
                  <p>설명</p>
                </div>
                <div>
                  <h4>매장소개</h4>
                  <p>설명</p>
                </div>
              </div>
              <div class="foodReview">
                <div class="btn">
                  <button class="like" width="150px" >좋아요</button>
                  <button class="share"  width="150px" >공유하기</button><br>
                  <button class="reviewWrite" width=150px;>리뷰쓰기</button>
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

</body>
</html>