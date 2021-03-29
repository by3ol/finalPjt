<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>여행추천</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="resources/slick.css" />
    <link rel="stylesheet" type="text/css" href="resources/slick-theme.css" />

    <style type="text/css">
      .inner {
        max-width: 1200px;
        margin: 0 auto;
      }
      .lb-wrap {
        width: 50px;
        margin: 10px auto;
        position: relative;
      }
      .lb-wrap img {
        width: 100%;
        vertical-align: middle;
      }
      .lb-text {
        width: 100%;
        height: 100%;
        margin: 0 auto;
        padding-top: 4rem;
        text-align: center;
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 10;
        background-color: rgba(0, 0, 0, 0.6);
        color: white;
        font-size: xx-large;
      }

      * {
        box-sizing: border-box;
      }

      .slick-slide {
        margin: 0px 20px;
      }

      .slick-slide img {
        width: 100%;
      }

      .slick-prev:before,
      .slick-next:before {
        
        color: black;
       
      }

      .title {
        margin: 2rem;
        font-size: xx-large;
        text-align: center;
      }
      .slick-prev {
        height: 15px;
        width: 15px;
        background-size: contain;
        background-repeat: no-repeat;

        /* to position the arrows left and right at the bottom of slider */
        position: absolute;
        z-index: 10;
        bottom: 0;
      }
      
    </style>
  </head>
  <body>
    <jsp:include page="../common/menubar1.jsp" /><br><br><br>
    <div class="inner">
      <div class="title">맛집리스트</div>
      <hr />

      <section class="regular slider">
        <div class="lb-wrap">
          <div class="lb-text">이미지 위의 타이틀</div>
          <div class="lb-image">
            <img src="resources/한우.png" />
          </div>
        </div>
        <div class="lb-wrap">
          <div class="lb-text">이미지 위의 타이틀</div>
          <div class="lb-image">
            <img src="img/한우.png" />
          </div>
        </div>
        <div class="lb-wrap">
          <div class="lb-text">이미지 위의 타이틀</div>
          <div class="lb-image">
            <img src="img/한우.png" />
          </div>
        </div>
        <div class="lb-wrap">
          <div class="lb-text">이미지 위의 타이틀</div>
          <div class="lb-image">
            <img src="img/한우.png" />
          </div>
        </div>
        <div class="lb-wrap">
          <div class="lb-text">이미지 위의 타이틀</div>
          <div class="lb-image">
            <img src="img/한우.png" />
          </div>
        </div>
        <div class="lb-wrap">
          <div class="lb-text">이미지 위의 타이틀</div>
          <div class="lb-image">
            <img src="img/한우.png" />
          </div>
        </div>
      </section>
      <br />

      <div class="title">여행리스트</div>
      <hr />

      <section class="regular slider">
        <div>
          <img src="http://placehold.it/350x300?text=1" />
        </div>
        <div>
          <img src="http://placehold.it/350x300?text=2" />
        </div>
        <div>
          <img src="http://placehold.it/350x300?text=3" />
        </div>
        <div>
          <img src="http://placehold.it/350x300?text=4" />
        </div>
        <div>
          <img src="http://placehold.it/350x300?text=5" />
        </div>
        <div>
          <img src="http://placehold.it/350x300?text=6" />
        </div>
      </section>
<jsp:include page="../common/footer.jsp" />
      <script
        src="https://code.jquery.com/jquery-2.2.0.min.js"
        type="text/javascript"
      ></script>
      <script
        src="resources/slick.js"
        type="text/javascript"
        charset="utf-8"
      ></script>
      <script type="text/javascript">
        $(document).on("ready", function () {
          $(".regular").slick({
            dots: true,
            infinite: false,
            slidesToShow: 3,
            slidesToScroll: 2
          });
        });
      </script>
    </div>
  </body>
</html>
