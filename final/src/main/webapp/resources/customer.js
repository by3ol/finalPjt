		//문의글 요소
		var questionNo=0;
		var category=$("#category");
		var questionTitle=$("#questionTitle");
		var questionContent=$("#questionContent");
		var $questionRegisterBtn=$("#questionRegisterBtn");
		
		
		
			
		

		$questionRegisterBtn.on("click",function(){ // 문의하기 클릭 했을 때
			
			if($category.val()=="질문유형"){
				alert("질문 유형을 정확히 골라주세요");
				return;
			}
			if(questionTitle.val()==""){
				alert("제목을 입력해주세요");
				return;
			}
			if(questionContent.val()==""){
				alert("문의 내용을 입력해주세요");
				return;
			}
			
			
			
			var category=$category.val();
			var questionTitle=$questionTitle.val();
			var questionContent=$questionContent.val();
			
			var questionObj={questionNo : questionNo, category :category, questionTitle:questionTitle ,questionContent: questionContent };
			var question =JSON.stringify(questionObj);
		
			
				$.ajax({
					
					type:"post",
					url:"insert.cu",
					data : question,
					contentType:'application/json',
					success : function(msg){
						
								
							alert("등록이 완료되었습니다.");
						
					},
					error: function(){
						
						alert("등록에 실패하였습니다.");
					}
					
					
					
				});
				
			
					
					
				});	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		