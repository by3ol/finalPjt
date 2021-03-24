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
    </style>
  </head>
  <body>
    <jsp:include page="../common/menubar.jsp" />

    <br /><br />
    <div class="innerOuter">
      <h2>게시글 수정</h2>
      <br />

      <form
        id="noticeupdate"
        method="post"
        action=""
        enctype="multipart/form-data"
      >
        <input type="hidden" name="noticeNo" value="${ n.noticeNo }" />
        <table align="center">
          <tr>
            <th><label for="title">제목</label></th>
          </tr>
          <tr>
            <td>
              <input
                type="text"
                id="title"
                class="form-control"
                name="boardTitle"
                value="${ n.noticeTitle }"
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
                name="boardContent"
                id="content"
                rows="10"
                style="resize: none"
              > ${ n.noticeContent }
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
