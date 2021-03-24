<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />

    <title>공지사항 상세화면</title>
  </head>
  <style>
    .content {
      
      display: flex;
      flex-wrap: wrap;
      flex-direction: column; /*수직 정렬*/
      align-items: center;
     
    }
    .border{
        width: 80%;
        border:0.5px solid black ;
        border-radius: 10px;
        padding: 0.5rem;
        margin-bottom: 2rem;
    }
  </style>
  <body>
  <jsp:include page="../common/menubar1.jsp" />
  
    <div class="content">
        <h3>제목</h3>
     <div>수정할거 들어가야함</div>

      <div>
        <button class="btn btn-primary" onclick="postFormSubmit(1);">
          수정하기
        </button>
        <button class="btn btn-danger" onclick="postFormSubmit(2);">
          삭제하기
        </button>
      </div>
    </div>
    <script>
      function postFormSubmit(num) {
        var postForm = $('#postForm');

        if (num == 1) {
          postForm.attr('action', 'deleteNotice.cu');
        } else {
          postForm.attr('action', 'updateNotice.cu');
        }
        postForm.submit();
      }
    </script>
  </body>
</html>
