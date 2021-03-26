<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>foodlist</title>
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <style>
    	#container{
    	width:100%;
    	}
    	
    	#contents{
    	margin: 0 auto;
    	
    	}
    
        .ct_de_menu{
            background-color: orange;
            
        }
        
     
        .cont_size{
            
            width :1100px;
            height:1350px;
            
        }
        .attraction_menu_line{
            height:300px;
            width :100%;
            
        }
        .attraction_menu{
            padding:10px;
            margin:15px;
            width:28%;
            height:300px;
            background-color: white;
            float:left;
            
        }
       .recom_tag_list_button{
       
            background:white;
            color:orange;
            width:100px;
            height:30px;
            border-radius:50px;
            border-color:orange;
            outline:none;
         
            
                      
      
       }
       #attraction_find{
       width : 922px;
       margin : 0 auto;
       }
       
       #pagingArea{
       text-align : center;
       margin : 0 auto;
       }
       .pagination{
       width:500px;
       margin : 0 auto;
       }
       .pagination li{
       float:left;
       }
    </style>
</head>
<body>
<jsp:include page="../common/menubar1.jsp"/>

<div class="container-fluid" style="margin-top:70px">
      <div id="container" style="min-height:1000px;">
      	
        <div id="contents">
            <div id="main_contents">
   
     <jsp:include page="../attraction/attractionMenubar.jsp"/>
                    <div id="attraction_find">
                    
                        <div class="category_box">
                            <div class="category_menu">
                                <form  class="ct_de_menu">
                                      
                                        
                                        <a href="#" id="ct_de_menu_num">추천맛집  </a>
                                        <a href="#" id="ct_de_menu_num">테마  </a>
                                        <a href="#" id="ct_de_menu_num">리뷰  </a>
                                                                                                                                        
                                   
                                       
                                    
                                
                                </form>
                            </div>

                        </div>
                        
                        <br><br>
                        
                        
     <div id="map" style="width:922px;height:200px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7cdc8b55964d8909243d354220777e13"></script>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.504608, 127.004338),
			level: 2
		};

		var map = new kakao.maps.Map(container, options);
	</script>

	<br><br>
	<h3>추천 태그</h3>
                        <div class="recom_tag">
                            <form class="recom_tag_list">

                                <input type="button" class="recom_tag_list_button" id="a"value="전체보기">
                                <input type="button" class="recom_tag_list_button" id="o"value="백년가게">
                                <input type="button" class="recom_tag_list_button" id="k"value="착한가게">
                             

                                
                            </form>
                            
                        </div>
                        

						<br><br>
                        <h3>추천 맛집</h3>
                    
                             
                         
                         <div class ="cont_size">
                             <div class=attraction_menu_line>
                            	 <c:forEach items="${list }" var="list">
                            
                              		 <div class="attraction_menu">
                              		 <input type="hidden" value="${list.placeNo }"> 
                              		 <input type="hidden" value="${list.placeCategory }"> 
                              		 
      
                               		
                                   <!--  <a href="#"> -->
                                        <img src=${ list.placeUrl } width="200px" height="200px"> <br>
                                        <strong>${list.placeScore }</strong> <br>
                                        <label>${list.placeName }</label> <br>  
                                        <label>${list.placePhone } </label>      
                                        
                                        
                                        
                                        
                                                                      
                                   <!--  </a> -->
                                   
                                   
	                      
                               </div> 
                               </c:forEach>
                           
                            </div>

                            
                         </div>  
                        
                        </div>
                    </div>
            </div>

        </div>
        	 <script>
											        $(function(){
											        	$("#a").on("click",function()  {
											    			
											        		
											    			$(".cont_size").css("display","none");
											        		
											    			
											    		});
											    	});
											    	
											       </script>
                                                  
       											
        
       
              <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.at?currentPage=${ pi.currentPage-1 }&placeCategory=${at.placeCategory }&regionNo=${at.regionNo}">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.at?currentPage=${ p }&placeCategory=${at.placeCategory }&regionNo=${at.regionNo}">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.at?currentPage=${ pi.currentPage+1 }&placeCategory=${at.placeCategory }&regionNo=${at.regionNo}">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.at?currentPage=${ pi.currentPage+1 }&placeCategory=${at.placeCategory }&regionNo=${at.regionNo}">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
           
         
            
			
            <br><br>
        </div>
        <br><br>
    </div>
 
       <script>
    	$(function(){
    		$(".attraction_menu").click(function(){
    			var placeNo = $(this).children().eq(0).val();
    			
    			location.href="<%=request.getContextPath()%>/detail.at?placeNo=" +placeNo;
    		});
    	});
    	
    </script>
    
            
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
