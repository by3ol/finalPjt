<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<jsp:include page="common/menubar1.jsp"/>


	<div class="container-fluid test"  style="margin-top:70px">
		
	<!-- 	<div>
		<p style="float:right"><i class="fas fa-times"></i></p>
			    <p>Card title</p>
		</div>
		<div class="d-flex " >
			<div style='width:30%'>
				<img src="http://tong.visitkorea.or.kr/cms/resource/70/1334870_image2_1.jpg" style='width:80px;height:50px;margin-top:20px;' >
			
			</div>
			
			
			<div style='width:70%'>
			  <div >
			  	
			    <p style="font-size:0.8em;margin-botton:0.8rem">Some example text. Some example text.</p>
			    <p style="font-size:0.8em;margin-botton:0.8rem">Some example text. Some example text.</p>
			    <a href="#" class="card-link" style="font-size:0.8em;margin-botton:0.8rem">Card link</a>
			    
			  </div>
			</div>
		</div> -->
		

		<button data-toggle="modal" data-target="#loginModal">button</button>
	</div>
	
   <div class="modal " id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h4 class="modal-title">Login</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button> 
            </div>

            <form action="login.me" method="post">
                <!-- Modal Body -->
                <div class="modal-body">
                    <label for="userId" class="mr-sm-2">ID :</label>
                    <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="userId"> <br>
                    <label for="userPwd" class="mr-sm-2">Password:</label>
                    <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd" name="userPwd">
                </div>
                
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                </div>
            </form>
            </div>
        </div>
    </div>
	
	<script>
	

	</script>
	<jsp:include page="common/footer.jsp"/>