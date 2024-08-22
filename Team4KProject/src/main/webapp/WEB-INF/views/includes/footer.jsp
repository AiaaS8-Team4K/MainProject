<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
    <style>
        .footer {
            background: #333;
            color: #fff;
            padding: 0;
            margin: 0;
            border-top-left-radius: 2vw;
            border-top-right-radius: 2vw;
    		bottom: 0;
    		position: fixed;
    		z-index: 998;
    		width: 100vw;
    		height: 3vh;
            transition: height 0.3s ease;
            overflow: hidden;
        }
        
        .footer:hover {
            height: 14vh;
        }
        .footer-default-content {
            height: 100%;
            width: 100%;
            position: relative;
            transition: transform 0.3s ease; /* 글씨 이동에 대한 트랜지션*/
            color: #A6A6A6;
            text-align:center;
        }
        /* .footer:hover .footer-default-content {
            transform: translateY(-1vh); /* 화면 확대시 글씨도 위로 이동 //픽셀단위수정*/
        } */
        
        .footerNav{
        width: 100%;
        display : flex;
        justify-content: space-around;
        }
        
        .footerNav > ul{
            font-size: calc( 0.5vw + 0.5vh );
            list-style: none;
            display: inline-flex;
            flex-direction: column;
            width: 20%;
            justify-content: space-around;
            margin: 0;
            padding: 0;
        }
        .footer a{
        	text-decoration: none;
        	color: white;
       	}
       	.fCopyRight p{
       		width:100vw;
    		font-size: calc( 0.5vw + 0.5vh );
    		margin: 0 0 1vh;
       	}
    </style>
</head>
<body>
    <footer class="footer">
        <div class="footer-default-content">
            <div class="fCopyRight"><p>&copy; 2024 AIaaS8 Team4K. All rights reserved.</p></div>
            <div class="footerNav">
        	<ul>
        		<li><a href="#">메뉴 1-1</a></li>
        		<li><a href="#">메뉴 1-2</a></li>
        		<li><a href="#">메뉴 1-3</a></li>
        	</ul>
        	<ul>
        		<li><a href="#">메뉴 2-1</a></li>
        		<li><a href="#">메뉴 2-2</a></li>
        		<li><a href="#">메뉴 2-3</a></li>
        	</ul>
        	<ul>
        		<li><a href="#">메뉴 3-1</a></li>
        		<li><a href="#">메뉴 3-2</a></li>
        		<li><a href="#">메뉴 3-3</a></li>
        	</ul>
        	<ul>
        		<li><a href="#">메뉴 4-1</a></li>
        		<li><a href="#">메뉴 4-2</a></li>
        		<li><a href="#">메뉴 4-3</a></li>
        	</ul>
        	</div>
        </div>
    </footer>
</body>
</html>