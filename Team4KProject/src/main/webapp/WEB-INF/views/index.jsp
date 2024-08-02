<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.css" integrity="sha512-earFJuyxuk1UIfnUubV3DGk2ysSejjmhMPb/4OXsqII9qmIbEwa1AaXrTqo4ivYizpbfyjXFZi6wENs94/BKWQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.extensions.min.js" integrity="sha512-CG4suntOelKyziz99VyC3BrbQ60IOtpJ9RYQvI/0d6TdYWStN69gCb9OpPMlym+3OmNAr357Kv6FVqTk25Ej5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Team4K 메인화면</title>
  <link rel="stylesheet" href="css/index.css">
  <script src="js/index.js"></script>
</head>
<body>
  <jsp:include page ="./includes/header.jsp" flush="true"/>
  <div id="fullpage">
    <main class="main-content">
        <div class="section hero">
            <div class="carousel">
                <img src="images/indexHero1.jpg" alt="Hero Image 1" class="active" dataText1="Abundant energy makes a light heart." dataText2="에너지 안보 지킴이 서비스">
                <a href="#"><img src="images/indexHero2.png" alt="Hero Image 2" dataText1="전기차 전력수요 예측" dataText2="두번째 텍스트"></a>
                <a href="#"><img src="images/mq1280.jpg" alt="Hero Image 3" dataText1="에너지자원 수입비용 예측" dataText2="세번째 텍스트"></a>
                <a href="#"><img src="images/mq1920.jpg" alt="Hero Image 4" dataText1="에너지 효율 예측" dataText2="네번째 텍스트"></a>
                <a href="#"><img src="images/mq1280.jpg" alt="Hero Image 5" dataText1="기후변화 강수량 예측" dataText2="다섯번째 텍스트"></a>
                <div class="hero-text">
                    <h1>Abundant energy makes a light heart.</h1>
                    <h3>에너지소비패턴 분석을 통한 미래 에너지 예측 서비스</h3>
                </div>
                <div class="carousel-buttons">
                    <button class="prev">&#10094;</button>
                    <button class="next">&#10095;</button>
                </div>
            </div>
        </div>
        <div class="section intention">
            <div class="container">
                <h2>기획의도</h2>
                <div class="intention-items">
                    <div class="item" data-animation="fade-right">
                        <h3>에너지 안보</h3>
                        <p>지속 가능한 에너지 안보</p>
                    </div>
                    <div class="item" data-animation="fade-left">
                        <h3>에너지 소비량</h3>
                        <p>효율적인 에너지 소비량 증가</p>
                    </div>
                    <div class="item" data-animation="fade-right">
                        <h3>전기차 보급률</h3>
                        <p>전기차 보급률로 인한 수요 증가</p>
                    </div> 
                    <div class="item" data-animation="fade-left">
                        <h3>이상기후현상 증가</h3>
                        <p>이상기후로 인한 기후변화의 영향</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="section introduce">
            <div class="container">
                <h2>서비스 소개</h2>
                <div class="introduce-items">
                   <div class="item" data-animation="fade-up">
                        <img src="images/mq1280.jpg" alt="예측 서비스 기능">
                        <h3>예측 서비스 기능</h3>
                    </div>
                    <div class="item" data-animation="fade-up">
                        <img src="images/mq1280.jpg" alt="분석 서비스 기능">
                        <h3>분석 서비스 기능</h3>
                    </div>
                    <div class="item" data-animation="fade-up">
                        <img src="images/mq1280.jpg" alt="레퍼런스 데이터 소개">
                        <h3>레퍼런스 데이터 소개</h3>
                        <p>신속하게 대응합니다.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="section effect">
            <div class="container">
                <h2>기대효과</h2>
                <div class="effect-items">
                    <div class="item" data-animation="fade-left">
                        <div class="img-container">
                            <img src="images/mq1280.jpg" alt="기대효과 이미지 1">
                            <h3>에너지<br>안보<br>강화</h3>
                            <div class="icon">
                                <img src="images/energyIcon.png" alt="아이콘">
                            </div>
                        </div>
                    </div>
                    <div class="item" data-animation="fade-left">
                        <div class="img-container">
                            <img src="images/mq1280.jpg" alt="기대효과 이미지 2">
                            <h3>효율적인<br>비용<br>집행</h3>
                            <div class="icon">
                                <img src="images/moneyIcon.png" alt="아이콘">
                            </div>
                        </div>
                    </div>
                    <div class="item" data-animation="fade-left">
                        <div class="img-container">
                            <img src="images/mq1280.jpg" alt="기대효과 이미지 3">
                            <h3>효과 3</h3>
                        </div>
                    </div>
                    <div class="item" data-animation="fade-left">
                        <div class="img-container">
                            <img src="images/mq1280.jpg" alt="기대효과 이미지 4">
                            <h3>효과 4</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section teamMember">
            <div class="container">
                <h2>팀원 소개</h2>
                <div class="teamMember-items">
                    <div class="item" data-animation="fade-up">
                        <img src="images/mq1280.jpg" alt="유안 공장">
                        <h3>유안 공장</h3>
                        <p>주소: ~</p>
                    </div>
                    <div class="item" data-animation="fade-up">
                        <img src="images/mq1280.jpg" alt="진천 공장">
                        <h3>진천 공장</h3>
                        <p>주소: ~</p>
                    </div>
                </div>
            </div>
        </div>
    </main>
    </div>
    <jsp:include page ="./includes/footer.jsp" flush="true"/>
</body>
</html>
