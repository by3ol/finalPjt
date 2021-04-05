<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      #updateForm > table {
        width: 100%;
      }
      #updateForm > table * {
        margin: 5px;
      }
      h2{
      text-align:center;}
    </style>
  </head>
  <body>
    <jsp:include page="../common/menubar1.jsp" /><br><br><br><br>
    
<h2>게시글 수정</h2>
    <br /><br />
    <jsp:include page="../common/customerbar.jsp" />
    <div class="innerOuter">
      
      <br />

      <form
        id="noticeupdate"   method="post"   action="updateNotice.cu"      >
        <input type="hidden" name="noticeNo" value="${ n.noticeNo }" />
        <table align="center">
          <tr>
            <th><label for="title">제목</label></th>
          </tr>
          <tr>
            <td>
              <input
                type="text"
                class="form-control"
                name="noticeTitle"
                required
              />
            </td>
          </tr>

          <tr>
            <th colspan="2"><label for="content">내용</label></th>
          </tr>
          <tr>
            <th colspan="2">
              <textarea
                class="form-control"
                required
                name="noticeContent"
                rows="10"
                style="resize: none"          
              > 
              </textarea>
            </th>
          </tr>
        </table>
        <br />

        <div align="center">
          <button type="submit" class="btn btn-primary">수정하기</button>
          <button
            type="button"
            class="btn btn-danger"
            onclick="javascript:history.go(-1);"
          >
            이전으로
          </button>
        </div>
      </form>
    </div>
    <br /><br />

    <jsp:include page="../common/footer.jsp" />
  </body>
</html>
