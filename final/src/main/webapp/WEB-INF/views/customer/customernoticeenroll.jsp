<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<title>Insert title here</title>
<style>
    h2{
        text-align: center;
        vertical-align: middle;
    }
 	#enrollForm>table{width:100%;}
    #enrollForm>table *{ margin:5px;}
    .inner{
        width: 100%; /* 가로 사이즈가 1200px 넘는 해상도에서는 max-width 설정 */
  height: 100%; /* align-items 등으로 수직 가운데 정렬을 위해, 알맞은 height 설정이 필요함 */
  margin: 0 auto; /* 가운데 정렬: 동일 요소에 width 가 설정되어 있을 때에만 적용 */
  padding: 0rem 2rem; /* 좌우 padding 을 살짝 주어서, 좌우에 딱 붙지 않도록 함 */
  overflow: hidden; /* 넘치는 영역에 대해서는 표시안되도록 작성해야 함 */
  display:flexbox;
  justify-content: center;
    }
    label{
        font-size: x-large;
    }
</style>
</head>
<body>
    <div class="inner">
    <h2> 게시글 작성 </h2>
    <hr>

 
    <div class="container">
        <form action="insertNotice.cu" method="post">
          <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="noticeTtile" placeholder="제목을 입력하세요.">
          </div>
          
          <div class="form-group">
            <label for="content">내용</label>
            <textarea
             class="form-control" id="content" name="noticeContent" rows="15" placeholder="공지글을 입력하세요."></textarea>
          </div>
          
        </form>
    </div>
    

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    
                </div>
         
     
            </div>
</body>
</html>