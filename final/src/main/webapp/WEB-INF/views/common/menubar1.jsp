<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
        @import url('https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap'); /*로고*/
        @import url('https://fonts.googleapis.com/css2?family=Indie+Flower&family=Sunflower:wght@300;500&display=swap');/*전체적인*/
        @media screen and (min-width : 360px){
        .mmContainer{
            display:none;
        }
        .mm2Container{
             display: block;
         }
        }
       
        @media screen and (min-width : 960px){
         .mmContainer{
             display: block;
         }
         .mm2Container{
             display: none;
         }
        }
            
        
        .headerContainer{
            width: 100%;
        }
        .logoContainer{
            width: 15%;
            margin: 0%;
            padding: 0%;
            float: left;
            
        }
        a{
           font-size: 13px;
        }
        .logo{
            margin-left: 80px;
            
            color: rgba(120, 180, 255, 1.0);

            font-size: 32px;

            text-decoration: none;

           
        }
        .mmContainer{
            width: 80%;
            margin-top: 10px;
            float: right;
        }
        .myPageContainer{
            width: 100%;
        }
        .myPageContainer .myPage{
            
            width: 30px;
            height: 30px;
           
        }
        .menuContainer{
            float: right;
            margin-right: 120px;
            
            
            
        }
        .mmContainer .menu li{
            list-style: none;
            float: left;
            margin-left: 15px;
        }
        .mmContainer .menu li a{
            text-decoration: none;
            color: black;
        }
        .myPageContainer{
            float: right;
            margin-right: 120px;
            
            
        }
        .menu{
            margin: 0;
            padding: 0;
            border: 0;
            outline: 0;
        }
        .mm2Container li{
            list-style: none;
            float: right;
            margin-top: 20px;
            margin-right: 120px;
            border: none;
            background-color: white;
        }

        .mm2Container li ul li{
            float: right;
        }
        .mm2Container li ul li{
            display: none;
        }
        .mm2Container li:hover ul li{
            display: block;
        } 


        .myPageBar li{
            float: right;
            list-style: none;
            padding-left: 20px;
            
        }
        .myPageBar li a{
           text-decoration: none;
           color: black;
        }
        .menuBar{
            top: 5px;
            width: 100%;
        }
    </style>
</head>
<body>
    <header id="header">
        <div class="headerContainer">
            <div class="logoContainer">
            <h1 class="logo"><a class="logo" href="">
                Drommetur</a>
            </h1>
        </div>
        <div class="mmContainer">
            <div class="myPageContainer">
                <ul class="myPageBar">
            <li><a href="">MyPage</a></li>
            <li class="login"><a href="">Login</a></li>
        </ul>
            </div>
            
            <div class="menuContainer">
                <ul class="menu">
                <div class="menuBar">
                <li id=""><a href="">여행</a></li>
                <li id=""><a href="">맛집</a></li>
                <li id=""><a href="">숙박</a></li>
                <li id=""><a href="">명소/액티비티</a></li>
                <li id=""><a href="">이동수단</a></li>
                <li id=""><a href="">리뷰</a></li>
                <li id=""><a href="">공지사항</a></li>
                <li id=""><a href="">고객센터</a></li>
                </div>
            </ul>
            </div>
            
        
        </div>
        <div class="mm2Container">
            <ul>
                <li><img src="images/3.PNG">
                <ul>
                <li id=""><a href="">MyPage</a></li>
                <li id=""><a href="">Login</a></li>
                <li id=""><a href="">여행</a></li>
                <li id=""><a href="">맛집</a></li>
                <li id=""><a href="">숙박</a></li>
                <li id=""><a href="">명소/액티비티</a></li>
                <li id=""><a href="">이동수단</a></li>
                <li id=""><a href="">리뷰</a></li>
                <li id=""><a href="">공지사항</a></li>
                <li id=""><a href="">고객센터</a></li>
                </ul>
            </li>
            </ul>
        </div>
        </div>
    </header>
