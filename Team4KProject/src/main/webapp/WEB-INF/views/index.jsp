<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Team4K 메인화면</title>
	<link rel="stylesheet" href="css/index.css">
	<script type="text/javascript" src="js/index.js" ></script>
</head>
<body>
	<jsp:include page ="./includes/header.jsp" flush="true"/>
    <main class="main-content">
        <section class="hero">
    		<div class="carousel">
        		<img src="images/indexHero1.jpg" alt="Hero Image 1" class="active" dataText1="Abundant energy makes a light heart." dataText2="에너지 안보 지킴이 서비스">
        		<a href="#"><img src="images/indexHero2.png" alt="Hero Image 2" dataText1="예산 지킴이" dataText2="두번째 텍스트"></a>
        		<a href="#"><img src="images/mq1280.jpg" alt="Hero Image 3" dataText1="탄소배출량 지킴이" dataText2="세번째 텍스트"></a>
        		<a href="#"><img src="images/mq1920.jpg" alt="Hero Image 4" dataText1="네번째 텍스트" dataText2="네번째 텍스트"></a>
        		<div class="hero-text">
                	<h1>Abundant energy makes a light heart.</h1>
                	<h3>에너지 안보 지킴이 서비스</h3>
            	</div>
            <!-- <img src="/htmlEdu/layout/images/mq1920.jpg" alt="Hero Image"> -->
    			<div class="carousel-buttons">
        			<button class="prev">&#10094;</button>
        			<button class="next">&#10095;</button>
    			</div>
    		</div>
        </section>
        <section class="philosophy">
            <div class="container">
                <h2>Philosophy</h2>
                <div class="philosophy-items">
                    <div class="item">
                        <img src="images/mq1280.jpg" alt="고객중심">
                        <h3>고객중심</h3>
                        <p>최고의 가치를 제공합니다.</p>
                    </div>
                    <div class="item">
                        <img src="images/mq1280.jpg" alt="최고의 품질">
                        <h3>최고의 품질</h3>
                        <p>믿을 수 있는 제품입니다.</p>
                    </div>
                    <div class="item">
                        <img src="images/mq1280.jpg" alt="신속한 대응">
                        <h3>신속한 대응</h3>
                        <p>신속하게 대응합니다.</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="history">
            <div class="container">
                <h2>History</h2>
                <div class="history-items">
                    <div class="item">
                        <h3>2020 ~ 2009</h3>
                        <p>2020: ~ 내용</p>
                    </div>
                    <div class="item">
                        <h3>2009 ~ 2001</h3>
                        <p>2009: ~ 내용</p>
                    </div>
                    <div class="item">
                        <h3>1990's</h3>
                        <p>1996: ~ 내용</p>
                    </div>
                </div>
            </div>
        </section>
        <section class="partners">
            <div class="container">
                <h2>Our Partner</h2>
                <img src="images/mq1280.jpg" alt="세계 지도">
            </div>
        </section>
        <section class="location">
            <div class="container">
                <h2>Location</h2>
                <div class="location-items">
                    <div class="item">
                        <img src="images/mq1280.jpg" alt="유안 공장">
                        <h3>유안 공장</h3>
                        <p>주소: ~</p>
                    </div>
                    <div class="item">
                        <img src="images/mq1280.jpg" alt="진천 공장">
                        <h3>진천 공장</h3>
                        <p>주소: ~</p>
                    </div>
                </div>
            </div>
        </section>
    </main>
	<jsp:include page ="./includes/footer.jsp" flush="true"/>
</body>
</html>