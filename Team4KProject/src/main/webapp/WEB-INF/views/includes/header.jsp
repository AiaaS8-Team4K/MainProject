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
    	header {
    	position: fixed;
    	left: 0;
    	right: 0;
    	z-index: 1000;
    	top: 0;
		}
        #headGrid{
            padding: 0;
            margin: 0 auto;
            width: 85vw;
            height: 8vh;
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            grid-template-rows: repeat(2,1fr);
            position: relative;
        }
        .logoBox{
            grid-column: 1/2;
            grid-row: 1/3;
        }
        
        .logoBox img{
            height: 100%;
            width: auto;
        }
        
        .navBox{
            grid-column: 2/7;
            grid-row: 2/3;
        }
        .navBox > #menuNav > ul{
            font-size: calc( 0.7vw + 0.7vh );
            list-style: none;
            display: flex;
            width: 100%;
            justify-content: space-around;
            margin: 0;
            padding: 0;
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
        }
        @media (max-width: 768px) {
            #menuIcon {
                display: block;
            }
            .navBox > #menuNav > ul {
                display: none;
                flex-direction: column;
                position: fixed;
                background-color: #f9f9f9;
                width: 20vw;
                right: 0;
                top: 0;
                bottom: 0;
                padding: 60px 0 20px;
                z-index: 1001;
                /* box-shadow: -2px 0 5px rgba(0,0,0,0.1); */
                overflow-y: auto;
            }
            .navBox > #menuNav > ul.show {
                display: flex !important;
            }
            .navBox > #menuNav > ul > li {
                padding: 15px;
                text-align: right;
            }
        }
    </style>
</head>
<body>
    <header>
        <div id="headGrid">
            <div class="box logoBox">
                <a href="#"><img src="images/Logo2.png" alt="Logo"></a>
            </div>
            <!-- <div class="box memberBox">
                <nav id="memberNav">
                    <ul>
                        <li><a href="#">로그인</a></li>
                        <li><a href="#">회원가입</a></li>
                    </ul>
                </nav>
            </div> -->
            <div class="box navBox">
                <nav id="menuNav">
                    <ul>
                        <li><a href="#"><span class="do-hyeon-regular">전기차 전력소비 예측</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">에너지 수입비용 예측</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">온실가스 배출량 예측</span></a></li>
                        <li><a href="#"><span class="do-hyeon-regular">기후변화 영향 예측</span></a></li>
                    </ul>
                </nav>
                <div id="menuIcon">☰</div>
            </div>
        </div>
    </header>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var menuIcon = document.getElementById('menuIcon');
            var menuNav = document.querySelector('.navBox > #menuNav > ul');
            var overlay = document.createElement('div');
            overlay.className = 'overlay';
            document.body.appendChild(overlay);

            if (menuIcon && menuNav) {
                menuIcon.addEventListener('click', function() {
                    menuNav.classList.toggle('show');
                    overlay.classList.toggle('show');
                    menuIcon.classList.toggle('open');
                });

                overlay.addEventListener('click', function() {
                    menuNav.classList.remove('show');
                    overlay.classList.remove('show');
                    menuIcon.classList.remove('open');
                });
            }
        });
    </script>
</body>
</html>