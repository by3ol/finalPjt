<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<title>문의확인</title>
</head>
<style>
.inner{
       width: 1200px;
       margin: 0 auto;
       overflow: hidden; /* 넘치는 영역에 대해서는 표시안되도록 작성해야 함 */

    }
    tr{
        text-align: center;
    }
    #hov:hover tbody tr:hover td{
        background: grey;
    color: white;
    }
     #pagingArea{width:fit-content;margin:auto;}
</style>
<body>
<jsp:include page="../common/menubar1.jsp"/>
<br><br><br><br>
<div class="banner">문의확인</div>
<jsp:include page="../common/customerbar.jsp" />


      <table id="questionList"class="table">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
	<c:forEach items="${ q }" var = "q">
	<tr>
	<td>${q.questionNo }</td>
	<td>${q.questionTitle }</td>
	<td>${q.datetime }</td>
	</tr>
	</c:forEach>
        </tbody>
      </table>

       <script>
    	$(function(){
    		$("#questionList tbody tr").click(function(){
    			location.href="detail.cu?bno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>

    <!-- 이쪽에 푸터바 포함할꺼임 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>