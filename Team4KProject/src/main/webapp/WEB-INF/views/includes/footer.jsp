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
            text-align: center;
            border-top-left-radius: 40%;
            border-top-right-radius: 40%;
    		bottom: 0;
    		position: fixed;
    		z-index: 998;
    		width: 100vw;
    		height: 5vh;
            font-size: calc( 2vw + 2vh );
            transition: height 0.3s ease;
            overflow: hidden;
        }
        
        .footer:hover {
            height: 20vh;
        }
        .footer-default-content {
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            transition: transform 0.3s ease; /* 글씨 이동에 대한 트랜지션*/
            color: #A6A6A6;
        }
        .footer:hover .footer-default-content {
            transform: translateY(-8vh); /* 화면 확대시 글씨도 위로 이동 //픽셀단위수정*/
        }
        
        .footerNav > ul{
            font-size: calc( 0.7vw + 0.7vh );
            list-style: none;
            display: flex;
            width: 100%;
            justify-content: space-around;
            margin: 0;
            padding: 0;
        }
        .footer a{
        	text-decoration: none;
        	color: white;
       	}
       	.fCopyRight{
       	}
       	
    </style>
</head>
<body>
    <footer class="footer">
        <div class="footer-default-content">
            <div class="fCopyRight"><p>&copy; 2024 AiaaS8 Team4K. All rights reserved.</p></div>
            <div class="footerNav">
        	<ul>
        		<li><a href="#">메뉴 1</a></li>
        		<li><a href="#">메뉴 2</a></li>
        		<li><a href="#">메뉴 3</a></li>
        	</ul>
        	</div>
        </div>
    </footer>
</body>
</html>