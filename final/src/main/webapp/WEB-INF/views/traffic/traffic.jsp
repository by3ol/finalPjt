<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
    #traffic_content{
   		padding-top : 80px;
        width:100%;
        height:1200px;
        float:left;
        background-color : black;
    }
    #traffic_content1{
        width:33%;
        float:left;
    }
    #traffic_content2{
        width:33%;
        float:left;
    }
    #traffic_content3{
        width:33%;
        float:left;
    }
   .trafficbtn{
       border: none;
       background-color: white;
       margin: 0;
       padding: 0;
   }
    #iframe{
        
  	border : none;

    }
</style>
</head>
<body>
<jsp:include page="../common/menubar1.jsp"/>

<div id=traffic_content>
    <div id=traffic_content1>
        <button class="trafficbtn">
          <img class="trafficImg" src="<%=request.getContextPath() %>/resources/images/brightTrain.png" id="train" width="100%" height="500px">
        </button>  
    </div>
    <script>
        $("#train").hover(
            function(){
                $(this).prop("src","<%=request.getContextPath() %>/resources/images/Train.jpg");

            },
            function(){
                $(this).prop("src","<%=request.getContextPath() %>/resources/images/brightTrain.png");

            });
    </script>
   
    <div id=traffic_content2>
        <button class="trafficbtn">
            <img class="trafficImg" src="<%=request.getContextPath() %>/resources/images/brightAir.png" id="air" width="100%" height="500px">
        </button>
    </div>
    <script>
        $("#air").hover(
            function(){
                $(this).prop("src","<%=request.getContextPath() %>/resources/images/Air.jpg");

            },
            function(){
                $(this).prop("src","<%=request.getContextPath() %>/resources/images/brightAir.png");

            });
    </script>
   
    <div id=traffic_content3>
        <button class="trafficbtn">
            <img class="trafficImg" src="<%=request.getContextPath() %>/resources/images/brightBus.png" id="bus" width="100%" height="500px">
        </button>
    </div>
    <script>
        $("#bus").hover(
            function(){
                $(this).prop("src","<%=request.getContextPath() %>/resources/images/Bus.jpg");

            },
            function(){
                $(this).prop("src","<%=request.getContextPath() %>/resources/images/brightBus.png");

            });
        $("#train").click(function(){      
        	$(".trafficImg").attr({"width":"100px","height":"100px"});
			$("#iframe").attr("src","https://www.letskorail.com/ebizprd/EbizPrdTicketpr21100W_pr21110.do");
        });
        $("#air").click(function(){
            $("#iframe").attr("src","https://flight.naver.com/flights/");
            $(".trafficImg").attr({"width":"100px","height":"100px"});
        });
        $("#bus").click(function(){
            $(".trafficImg").attr({"width":"100px","height":"100px"});
            $("#iframe").attr("src","https://txbus.t-money.co.kr/main.do");
        });
    </script>
   <iframe id="iframe" src="" width="100%" height="1000px"></iframe>
</div> 
</body>
</html>