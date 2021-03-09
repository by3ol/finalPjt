<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>foodlist</title>
    <style>
        .ct_de_menu{
            background-color: orange;
        }
        
     
        .cont_size{
            background-color : gray;
            width :1000px;
            height:1000px;
            
        }
        .taste_menu_line{
            height:300px;
            width :100%;
            
        }
        .taste_menu{
            padding:10px;
            margin:15px;
            width:28%;
            height:300px;
            background-color: white;
            float:left;
            
        }
       
    </style>
</head>
<body>
      <div id="container" style="min-height:1000px;">
        <div id="contents">
            <div id="main_contents">
                    <div id="taste_find">
                        <div class="category_box">
                            <div class="category_menu">
                                <form  class="ct_de_menu">
                                      
                                        
                                        <a href="#" id="ct_de_menu_num">추천맛집  </a>
                                        <a href="#" id="ct_de_menu_num">테마  </a>
                                        <a href="#" id="ct_de_menu_num">리뷰  </a>
                                                                                                                                        
                                    
                                       
                                    </tr>
                                
                                </form>
                            </div>

                        </div>
                        <h3>추천 태그</h3>
                        <div class="recom_tag">
                            <form class="recom_tag_list">

                                <input type="button" id="recom_tag_list_button" value="여자들끼리">
                                <input type="button" id="recom_tag_list_button" value="남자들끼리">
                                <input type="button" id="recom_tag_list_button" value="백년가게">
                                <input type="button" id="recom_tag_list_button" value="데이트">
                                <input type="button" id="recom_tag_list_button" value="모임">
                                <input type="button" id="recom_tag_list_button" value="조용한자리">
                                <input type="button" id="recom_tag_list_button" value="비지니스">
                                <input type="button" id="recom_tag_list_button" value="핫플레이스">

                                
                            </form>
                            
                        </div>


                        <h3>추천 맛집</h3>
                    
                             
                         
                         <div class ="cont_size">
                             <div class=taste_menu_line>
                               <div class="taste_menu">
                                    <a href="#">
                                        <img src="img/dog.jpg" width="200px"> <br>
                                        <strong>3.8</strong> <br>
                                        <label>귀여운 강아지</label> <br>  
                                        <label>작고소중합니다.</label>                                    
                                    </a>
                               </div> 
                               <div class="taste_menu">
                                <a href="#">
                                    <img src="img/dog.jpg" width="200px"> <br>
                                    <strong>3.8</strong> <br>
                                    <label>귀여운 강아지</label> <br>  
                                    <label>작고소중합니다.</label>                                    
                                </a>
                           </div> 
                           <div class="taste_menu">
                            <a href="#">
                                <img src="img/dog.jpg" width="200px"> <br>
                                <strong>3.8</strong> <br>
                                <label>귀여운 강아지</label> <br>  
                                <label>작고소중합니다.</label>                                    
                            </a>
                                 </div> 
                            </div>

                            <div class=taste_menu_line>
                                <div class="taste_menu">
                                     <a href="#">
                                         <img src="img/dog.jpg" width="200px"> <br>
                                         <strong>3.8</strong> <br>
                                         <label>귀여운 강아지</label> <br>  
                                         <label>작고소중합니다.</label>                                    
                                     </a>
                                </div> 
                                <div class="taste_menu">
                                 <a href="#">
                                     <img src="img/dog.jpg" width="200px"> <br>
                                     <strong>3.8</strong> <br>
                                     <label>귀여운 강아지</label> <br>  
                                     <label>작고소중합니다.</label>                                    
                                 </a>
                            </div> 
                            <div class="taste_menu">
                             <a href="#">
                                 <img src="img/dog.jpg" width="200px"> <br>
                                 <strong>3.8</strong> <br>
                                 <label>귀여운 강아지</label> <br>  
                                 <label>작고소중합니다.</label>                                    
                             </a>
                                  </div> 
                             </div>
                         </div>  
                        
                        </div>
                    </div>
            </div>

        </div>
    
    
    </div>
</body>
</html>
