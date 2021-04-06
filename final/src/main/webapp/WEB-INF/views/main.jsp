<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:include page="common/menubar1.jsp"/>


	<div class="container-fluid myContainer"  style="margin-top:55px;padding:0">
		<div id="demo" class="carousel slide" data-ride="carousel">

		  <!-- Indicators -->
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		    <li data-target="#demo" data-slide-to="2"></li>
		    <li data-target="#demo" data-slide-to="3"></li>
		    <li data-target="#demo" data-slide-to="4"></li>
		  </ul>
		  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="resources/mainPhotos/3.jpg" class="mainPhoto" width="3855" height="2168">
		    </div>
		    <div class="carousel-item">
		      <img src="resources/mainPhotos/2.JPG"  class="mainPhoto" width="6000" height="4000">
		    </div>
		    <div class="carousel-item">
		      <img src="resources/mainPhotos/1.jpg" class="mainPhoto" width="1990" height="1119">
		    </div>
		   	<div class="carousel-item">
		      <img src="resources/mainPhotos/4.jpg" class="mainPhoto" width="2728" height="1534">
		    </div>
		   	<div class="carousel-item">
		      <img src="resources/mainPhotos/5.jpg"  class="mainPhoto" width="4096" height="2304">
		    </div>
		  </div>
		  
		  <!-- Left and right controls -->
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>
	
	</div>
	
   
	
	<script>
	

	</script>
	<jsp:include page="common/footer.jsp"/>