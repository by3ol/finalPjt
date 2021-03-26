<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.body .navbarDiv{
        text-align: center;
        padding-top: 8px;
        height: 55px;
        
      }
      .navbarDiv .navbar1{
        width: 1100px;
        height: 48px;
       	
        padding-top: 3px;
        margin: 0 auto;
      
      }

      .navbar1 li{
        float: left;
        list-style-type: none;
        padding: 16px;
      }
      #location{
      

		border-radius: 5px;

		border-color:orange;
	  }
	  #location option{
	  border-color:orange;
	  }
	  .navbar1 li label{
	  cursor: pointer;
	  }
	  .searchForm{
	  align: center
	  }
	  .searchDiv{
	  text-align : center;}
	  .form{
	  margin:0 auto;}
</style>
</head>
<body>
          <div class="navbarDiv">
          <div class="searchDiv">
          <form action="search.at" class="form">
          <span class="searchForm">검색 : <input type="text" id="searchPlace" name="searchPlace" value="${searchPlace }"></span>
          </form>
          </div>
        <form>
        <ul class="navbar1" >
        	<li class="l">
        	<select name="location" id="location">
        	  <option value="99">지역 전체</option>
              <option value="1">서울</option>
              <option value="31">경기</option>
              <option value="2">인천</option>
              <option value="3">대전</option>
              <option value="7">울산</option>
              <option value="8">세종</option>
              <option value="32">강원</option>
              <option value="33">충북</option>
              <option value="34">충남</option>
              <option value="5">광주</option>
              <option value="37">전북</option>
              <option value="38">전남</option>
              <option value="6">부산</option>
              <option value="4">대구</option>
              <option value="35">경북</option>
              <option value="36">경남</option>
              <option value="39">제주</option>
            </select>
            </li>
            <li class="all"><label>전체</label></li>
            <li class="a"><label>액티비티</label></li>
            <li class="hl"><label>힐링</label></li>
            <li class="j"><label>직업체험</label></li>
            <li class="hi"><label>역사</label></li>
            <li class="p"><label>공공시설</label></li>
            <li class="r"><label>종교</label></li>
            <li class="e"><label>환경</label></li>
            <li class="n"><label>이색체험</label></li>
            <li class="etc"><label>기타</label></li>
        </ul>
        <!-- 
홈스테이 유스호스텔         		교육시설
전통호텔 한옥스테이        		 이색호텔
여관 민박                        		저가숙박
가족호텔 소형호텔 관광호텔     	호텔
모텔				모텔
서비스드레지던스 콘도미니엄	주거
펜션				펜션
게스트하우스			게스트하우스 
-->
        <script>
       
        
    	$(function(){
    		$(".all").click(function(){
       		 var regionNo=document.getElementById("location").value;
       		location.href="<%=request.getContextPath()%>/list.at?placeCategory=전체&regionNo="+regionNo;
       		});
    		$(".a").click(function(){
    		 var regionNo=document.getElementById("location").value;
    		location.href="<%=request.getContextPath()%>/list.at?placeCategory=액티비티&regionNo="+regionNo;
    		});
    		$(".hl").click(function(){
    		 var regionNo=document.getElementById("location").value;
    		location.href="<%=request.getContextPath()%>/list.at?placeCategory=힐링&regionNo="+regionNo;
    		});
    		$(".j").click(function(){
    		 var regionNo=document.getElementById("location").value;
    		location.href="<%=request.getContextPath()%>/list.at?placeCategory=직업체험&regionNo="+regionNo;
    		});
    		$(".hi").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.at?placeCategory=역사&regionNo="+regionNo;
   			});
    		$(".p").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.at?placeCategory=공공시설&regionNo="+regionNo;
   			});
    		$(".r").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.at?placeCategory=종교&regionNo="+regionNo;
   			});
    		$(".e").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.at?placeCategory=환경&regionNo="+regionNo;
   			});
    		$(".n").click(function(){
      		var regionNo=document.getElementById("location").value;
      		location.href="<%=request.getContextPath()%>/list.at?placeCategory=이색체험&regionNo="+regionNo;
      		});
    		$(".etc").click(function(){
      		var regionNo=document.getElementById("location").value;
      		location.href="<%=request.getContextPath()%>/list.at?placeCategory=기타&regionNo="+regionNo;
      		});
    		
    		
    	});
    	
    </script>
     </form>
      </div>
</body>
</html>