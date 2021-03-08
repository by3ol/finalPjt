<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
@import
   url('https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300&display=swap')
   ;
@import url('https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap');


style>* {
   margin: 0;
   padding: 0;
   
}

@import url(font-awesome.min.css);

@import
   url("https://fonts.googleapis.com/css?family=Lato:300,400,700|Pacifico")
   ;

a {
   text-decoration: none;
}

.clearfix {
   content: '';
   display: block;
   clear: both;
}

logo {
   height: 75px;
   border: none;
   position: fixed;
   width: 100%;
   z-index: 9999;
   top: 0;
   left: 0;
   margin-top: 10px;
   margin-left: 10px;
   float: left;
}
a{
font-family: 'Sunflower', sans-serif;

}
#logo {
   line-height: 35px;
   
   font-family: "Indie Flower";
   color: rgba(120, 180, 255, 1.0);
   font-size: 45px;
   text-transform: none;
   font-weight: normal;
   text-decoration: none;
}

#logo:hover {
      color: skyblue;
}

.menu {
   
   margin-top: 0px;
   text-align: center;
   
}

.menu li {
   list-style: none;
   text-decoration: none;
}

.menu a {
   line-height: 40px;
   color: #353535;
   padding: 0 15px;
   font-size: 19px;
   font-weight: normal;
   display: block;
   text-decoration: none;
}

#h {
   margin-left:300px;
   margin-top: 0px;
   float: left;
}

#sv {
   display: inline-block;
}

#r {
   display: inline-block;
}

#n {
   display: inline-block;
}

#s {
   display: inline-block;
}

#l {
   margin-right:30px;
   float: right;
}
#lll{
   margin-right:300px;
   float: right;
}
#m {
   margin-right: 0px;
   float: right;
}

</style>
<script>

  
</script>
</head>
<body>
   <header>
      <ul class="menu">
         <li id="h"><a href="<%=request.getContextPath()%>" id="logo">Drommetur</a>
           
         <li id="s"><a href="<%=request.getContextPath()%>/self1.di" color="red">여행</a></li>
        
         <li id="s"><a href="<%=request.getContextPath()%>/self2.di">여행</a></li>
         <%
            
         %>
         <li id="n"><a href="<%=request.getContextPath()%>/list.nu">맛집</a></li>
         <li id="r"><a href="">숙박</a></li>
         <li id="sv"><a href="">이동수단</a></li>
         <li id="sv"><a href="">명소&액티비티</a></li>
         <li id="sv"><a href="">리뷰</a></li>
         <li id="sv"><a href="">리뷰</a></li>
         <li id="sv"><a href="">고객센터</a></li>
         <li id="lll"> <input id="searchImg" type="image" src="<%=request.getContextPath()%>/resources/image/점3개.png"  width="30px" height="30px"></a></li>
         <li id="l"> <input id="searchImg" type="image" src="<%=request.getContextPath()%>/resources/image/사람.png"  width="30px" height="30px"></a></li>
        
         <li id="l"> <input id="searchImg" type="image" src="<%=request.getContextPath()%>/resources/image/돋보기.png"  width="30px" height="30px"></a></li>
         
         
         <%
        
         %>
         <li id="l"><a href="<%=request.getContextPath()%>/logout.me">logout</a></li>
         <li id="m"><a href="<%=request.getContextPath()%>/myPage.me">myPage</a></li>
         
         
      </ul>
   </header>
