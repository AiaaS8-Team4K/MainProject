<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
    <style>
    	.header {
    		position: fixed;
    		left: 0;
    		right: 0;
    		z-index: 1000;
    		top: 0;
    		overflow: hidden;
    		background: white;
    		height: 6vh;
    		width: 100vw;
        	transition: height 0.3s ease;
        	display: flex;
		}
        #headGrid{
            padding: 0;
            margin: 0 auto;
            width: 85vw;
            height: 100%;
            display: flex;
            position: relative;
        	justify-content: space-between;
        }
        .logoBox{
        	width: 15vw;
        	height: 6vh;
        }
        
        .logoBox img{
        	width: 100%;
        	height: 100%;
         	object-fit: contain;
        }
        .navBox{
        	width: 55vw;
        	height: 100%;
        	display: inline-flex;
        }
        .menuNav{
        	padding:0;
        	margin:0 auto;
        	margin-top: 2vh;
        	width: 100%;
        	display:flex;
        	justify-content: space-around;
        }
        
        .navBox > .menuNav > ul{
            list-style: none;
            display: flex;
            flex-direction: column;
            width: 20%;
        	padding:0;
        	margin:0 auto;
        }
        
        .navBox > .menuNav > ul > li:first-child{
            font-size: calc( 0.8vw + 0.8vh );
            margin: 0 0 2vh;
        }
        
        .navBox > .menuNav > ul > li{
            font-size: calc( 0.6vw + 0.6vh );
            margin: 0 0 1vh;
        }
        
        a{
        	text-decoration: none;
        	color: black;
       	}
       	
		.do-hyeon-regular {
  			font-family: "Do Hyeon", sans-serif;
  			font-weight: 400;
  			font-style: normal;
		}
       	
        #menuIcon {
            display: none;
            font-size: calc( 2vw + 2vh );
            cursor: pointer;
            position: fixed;
            right: 4vw;
            top: 2vh;
            z-index: 1002;
            background-color: transparent;
            border-radius: 5px;
            transition: transform 0.3s ease;
        }
        #menuIcon.open {
            transform: rotate(90deg);
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        .overlay.show {
            display: block;
        }@media (min-width: 769px) {
        	/* hover 관련 내용 작성 */
        	.header:hover {
        	height: 20vh;
        	}
            }
        @media (max-width: 768px) {
            #menuIcon {
                display: block;
            }
            .navBox > .menuNav.show{
            	display: flex;
                flex-direction: column;
                position: fixed;
                background-color: #f9f9f9;
                width: 20vw;
                right: 0;
                top: 0;
                bottom: 0;
                margin: 0;
                padding: 60px 0 20px;
                z-index: 1001;
                overflow-y: auto;
            }
            .navBox > .menuNav > ul {
                display: none;
            }
            .navBox > .menuNav > ul.show {
                display: flex !important;
                flex-direction: column;
                width: 50%;
            }
            .navBox > .menuNav > ul > li {
                padding: 0.5vw;
                text-align: right;
            }
        }
    </style>
</head>
<body>
	<header class="header">
	    <div id="headGrid">
	        <div class="box logoBox">
	            <a href="${pageContext.request.contextPath}/"><img src="images/Logo3.png" alt="Logo"></a>
	        </div>
            <div class="box navBox">
                <nav class="menuNav">
                    <ul>
                        <li><a href="frame"><span class="do-hyeon-regular">전기차 전력</span></a></li>
                        <li><a href="frame"><span class="do-hyeon-regular">예측</span></a></li>
                        <li><a href="frame"><span class="do-hyeon-regular">분석</span></a></li>
                        <li><a href="frame"><span class="do-hyeon-regular">데이터 제공</span></a></li>
                    </ul>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/budget"><span class="do-hyeon-regular">에너지 예산</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">예측</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">분석</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">데이터 제공</span></a></li>
                    </ul>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/greenHouse"><span class="do-hyeon-regular">온실가스배출량</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">예측</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">분석</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">데이터 제공</span></a></li>
                    </ul>
                    <ul>
                        <li><a href="#"><span class="do-hyeon-regular">가뭄 홍수 발생</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">예측</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">분석</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">데이터 제공</span></a></li>
                    </ul>
                </nav>
                <div id="menuIcon">☰</div>
            </div>
        </div>
    </header>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var menuIcon = document.getElementById('menuIcon');
            var menuNav = document.querySelector('.menuNav');
            var uls = document.querySelectorAll('.navBox > .menuNav > ul');
            var overlay = document.createElement('div');
            overlay.className = 'overlay';
            document.body.appendChild(overlay);

            if (menuIcon && uls) {
                menuIcon.addEventListener('click', function() {
                	uls.forEach(function(ul) {
                    ul.classList.toggle('show');
                });
                    overlay.classList.toggle('show');
                    menuIcon.classList.toggle('open');
                    menuNav.classList.toggle('show');
                });

                overlay.addEventListener('click', function() {
                    uls.forEach(function(ul) {
                        ul.classList.remove('show');
                    });
                    overlay.classList.remove('show');
                    menuIcon.classList.remove('open');
                    menuNav.classList.remove('show');
                });
            }
        });
    </script>
</body>
</html>