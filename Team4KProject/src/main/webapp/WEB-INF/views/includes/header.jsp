<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
    <style>
        body {
            padding: 0;
            margin: 0 auto;
        }
        img {
            height: 100%;
            width: auto;
            object-fit: cover;
        }
        #headGrid{
            padding: 0;
            margin: 0 auto;
            width: 85vw;
            height: 8vh;
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            grid-template-rows: repeat(2,1fr);
        }
        .logoBox{
            grid-column: 1/2;
            grid-row: 1/3;
        }
        .memberBox{
            grid-column: 6/7;
            grid-row: 1/2;
        }
        .memberBox > #memberNav > ul{
            font-size: 0.5vw;
        	margin-top: 1.5vh;
            list-style: none;
            display: flex;
            width: 100%;
            justify-content: space-around;
        }
        .navBox{
            grid-column: 3/6;
            grid-row: 2/3;
        }
        .navBox > #menuNav > ul{
            font-size: 0.8vw;
            list-style: none;
            display: flex;
            width: 100%;
            justify-content: space-around;
        }
    </style>
</head>
<body>
        <header>
            <div id="headGrid">
                <div class="box logoBox">
                    <a href="#"><img src="images/Logo2.png"></a>
                </div>
                <div class="box memberBox">
                    <nav id="memberNav">
                        <ul>
                            <li><a>로그인</a></li>
                            <li><a>회원가입</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="box navBox">
                    <nav id="menuNav">
                        <ul>
                            <li><a>회사소개</a></li>
                            <li><a>에너지 분석 정보</a></li>
                            <li><a>에너지 예산 분석 정보</a></li>
                            <li><a>에너지 효율 분석 정보</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>
</body>
</html>