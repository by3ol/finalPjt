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
min-height:calc(100vh - 480px);
    }
    tr{
        text-align: center;
    }
    tr:hover{
    cursor:pointer;}
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

<div class="inner" style="margin-top:70px">
<c:choose>
<c:when test="${empty sessionScope.loginUser }">
<div align="center"><h4>로그인 후 확인하실 수 있습니다 ~ ^^</h4></div>
</c:when>
<c:otherwise>
      <table id="questionList"class="table table-hover">
        <thead>
          <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
  	<c:forEach items="${ list }" var="list">
  	<c:if test="${list.writer eq sessionScope.loginUser.memberId}">
	<tr>
	<td>${list.questionNo }</td>
	<td>${list.questionTitle }</td>
	<td>${list.datetime }</td>
	</tr>
	</c:if>
	</c:forEach>
        </tbody>
      </table>
      <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="questionlist.cu?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="questionlist.cu?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="questionlist.cu?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="questionlist.cu?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
      </c:otherwise>
      </c:choose>
 
</div>
       <script>
    	$(function(){
    		$("#questionList tbody tr").click(function(){
    			location.href="detailquestion.cu?questionNo=" + $(this).children().eq(0).text();
    		});
    	});
    </script>

    <!-- 이쪽에 푸터바 포함할꺼임 -->
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>