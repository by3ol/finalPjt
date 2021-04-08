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
          <form action="search.ta" class="form">
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
            <li class="k"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/한식 2.png" width=15px height=15px>한식</label></li>
            <li class="w"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/양식.png" width=15px height=15px>양식</label></li>
            <li class="a"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/한식.png" width=15px height=15px>아시아식</label></li>
            <li class="c"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/중식.png" width=15px height=15px>중식</label></li>
            <li class="j"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/일식.png" width=15px height=15px>일식</label></li>
            <li class="v"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/힐링.png" width=15px height=15px>채식전문점</label></li>
            <li class="n"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/세계음식.png" width=15px height=15px>이색음식점</label></li>
            <li class="f"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/한식 (2).png" width=15px height=15px>레스토랑</label></li>
            <li class="cafe"><label><img src="<%=request.getContextPath() %>/resources/menubarImg/카페디저트.png" width=15px height=15px>카페</label></li>
        </ul>
        <script>
       
        
    	$(function(){
    		$(".all").click(function(){
       		 var regionNo=document.getElementById("location").value;
       		location.href="<%=request.getContextPath()%>/list.ta?placeCategory=전체&regionNo="+regionNo;
       		});
    		$(".k").click(function(){
    		 var regionNo=document.getElementById("location").value;
    		location.href="<%=request.getContextPath()%>/list.ta?placeCategory=한식&regionNo="+regionNo;
    		});
    		$(".w").click(function(){
    		 var regionNo=document.getElementById("location").value;
    		location.href="<%=request.getContextPath()%>/list.ta?placeCategory=서양식&regionNo="+regionNo;
    		});
    		$(".a").click(function(){
    		 var regionNo=document.getElementById("location").value;
    		location.href="<%=request.getContextPath()%>/list.ta?placeCategory=아시아식&regionNo="+regionNo;
    		});
    		$(".c").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.ta?placeCategory=중식&regionNo="+regionNo;
   			});
    		$(".j").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.ta?placeCategory=일식&regionNo="+regionNo;
   			});
    		$(".v").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.ta?placeCategory=채식전문점&regionNo="+regionNo;
   			});
    		$(".n").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.ta?placeCategory=이색음식점&regionNo="+regionNo;
   			});
    		$(".f").click(function(){
   			 var regionNo=document.getElementById("location").value;
   			location.href="<%=request.getContextPath()%>/list.ta?placeCategory=페밀리레스토랑&regionNo="+regionNo;
   			});
    		$(".cafe").click(function(){
      		 var regionNo=document.getElementById("location").value;
      		location.href="<%=request.getContextPath()%>/list.ta?placeCategory=바/카페&regionNo="+regionNo;
      		});
    		
    	});
    	
    </script>
     </form>
      </div>
</body>
</html>