<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/menubar1.jsp" />
	<br>
	<br>
	<br>
	<br>
	<div class="banner">문의확인</div>
	<jsp:include page="../common/customerbar.jsp" />
	<div class="inner ">
	<table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="3">${ q.questionTitle }</td>
                </tr>
                <tr>
                    
                    <th>작성일</th>
                    <td>${q.datetime }</td>
                </tr>
               
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px">${ q.questionTitle }</p></td>
                </tr>
            </table>
            <br>
	
			
	</div>
</body>
</html>