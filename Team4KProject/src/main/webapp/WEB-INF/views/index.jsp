<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Team4K 메인화면</title>
	<link rel="stylesheet" href="css/index.css">
</head>
<body>
	<jsp:include page ="./includes/header.jsp" flush="true"/>
    <main class="main-content">
        <section class="hero">
            <img src="images/indexHero.jpg" alt="Hero Video"></img>
            <!-- <img src="/htmlEdu/layout/images/mq1920.jpg" alt="Hero Image"> -->
            <div class="hero-text">
                <h1>Abundant energy makes a light heart.</h1>
                <h3>에너지 안보 지킴이 서비스</h3>
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