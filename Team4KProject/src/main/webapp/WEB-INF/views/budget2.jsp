<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.css" integrity="sha512-earFJuyxuk1UIfnUubV3DGk2ysSejjmhMPb/4OXsqII9qmIbEwa1AaXrTqo4ivYizpbfyjXFZi6wENs94/BKWQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.extensions.min.js" integrity="sha512-CG4suntOelKyziz99VyC3BrbQ60IOtpJ9RYQvI/0d6TdYWStN69gCb9OpPMlym+3OmNAr357Kv6FVqTk25Ej5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>에너지 자원 수입 비용 예측</title>
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
                <h2>섹션 1, 계산기</h2>
                <div class="intention-items">
                	<form action="<c:url value='/budgetCalculate'/>" method="post" name ="budget_Calculator" onsubmit="return infoConfirm()">
                	<fieldset class = "calculator" style="display: inline-block; width :600px; height:750px;">
                       		<legend>명년도 수입 예산 예측</legend>
                       		<li>
                       			<td>내년도 예상 수입액</td>
                       			<td>${result} 달러 </td>
                       			<!-- 컨트롤러에서 금액을 계산 후 모델.애드어트리뷰트("result", result)로 담아서 보냄. result는 애드어트리뷰트 전 윗줄에 String result = ???; 하는 식으로 계산 결과 넣기. -->
                       		</li>
                       		<li>
                       			<label>국제 자원 시세</label>
                       		</li>
                       		<li>
                       			<td>원유</td>
                       			<td>배럴당 <input type="number"/> 달러 </td>
                       		</li>
                       		<li>
                       			<td>석탄</td>
                       			<td>톤당 <input type="number"/> 달러 </td>
                       		</li>
                       		<li>
                       			<td>천연가스</td>
                       			<td>1000입방 피트당 <input type="number"/> 달러 </td>
                       		</li>
                       		<li>
                       			<td>우라늄</td>
                       			<td>파운드당 <input type="number"/> 달러 </td>
                       		</li>	                   		
                        </fieldset>	
                	</form>
                	
                	<div class="section1text" style= "text-align:center; margin-right:30%; margin-left:30%;">	
                	<p>**섹션 1에 들어갈 내용.**
                	<br>모델에 대한 간단한 설명이랑 계산기에 대한 간단한 설명. 계산기가 어떤 역할을 하는지.<br	>
					 이 모델은 대한민국에서 사용되는 주요 에너지 자원 네가지의 특정 연도 국제 시세와 그 명년도의 국내 에너지 자원 수입 비용과의 관계를 분석하여 만들어졌습니다. 
					 즉, 특정 연도의 국제시세를 바탕으로 다음해의 수입비용을 예측합니다. 
					 좌측의 계산기는 현재의 국제시세를 바탕으로 내년의 수입 비용을 예측합니다. 
					 예측에 사용된 관계 분석 모델에서, 중요성이 높은 두 가지 자원의 국제 시세만을 사용하여 예측의 정확도를 높입니다. 
					 예측된 금액은 실제와 다를 수 있습니다.
					 <br><br>
					 3d산점도에 대한 해석 내용이 아래에 들어가야 함.</p>
                	</div>
                   
                   <div class="3dScatterPlot">              
                   <img src="<c:url value='/images/3dScatterPlot.png'/>" alt="3d 산점도" style="width=150px; height=auto;">  
                   </div>
                   
                </div>
            </div>
        </div>
        <div class="section introduce">
            <div class="container">
                <h2>섹션 2, 모델 소개</h2>
                <div class="introduce-items">
                
                
                
                   <div class="item">
                        <img src="images/mq1280.jpg" alt="예측 서비스 기능">
                        <h3>예측 서비스 기능</h3>
                    </div>
                    <div class="item">
                        <img src="images/mq1280.jpg" alt="분석 서비스 기능">
                        <h3>분석 서비스 기능</h3>
                    </div>
                    <div class="item">
                        <img src="images/mq1280.jpg" alt="레퍼런스 데이터 소개">
                        <h3>레퍼런스 데이터 소개</h3>
                        <p>신속하게 대응합니다.</p>
                    </div>
                    
                    
                    
                </div>
            </div>
        </div>
        <div class="section effect">
            <div class="container">
                <h2>섹션 3, 레퍼런스 데이터 소개</h2>
                <div class="effect-items">
                    <div class="item">
                        <div class="img-container">
                            <img src="images/mq1280.jpg" alt="기대효과 이미지 1">
                            <h3>에너지<br>안보<br>강화</h3>
                            <div class="icon">
                                <img src="images/energyIcon.png" alt="아이콘">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="img-container">
                            <img src="images/mq1280.jpg" alt="기대효과 이미지 2">
                            <h3>효율적인<br>비용<br>집행</h3>
                            <div class="icon">
                                <img src="images/moneyIcon.png" alt="아이콘">
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="img-container">
                            <img src="images/mq1280.jpg" alt="기대효과 이미지 3">
                            <h3>효과 3</h3>
                        </div>
                    </div>
                    <div class="item">
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
                <h2>추가 서비스? 혹은 섹션 제거</h2>
                <div class="teamMember-items">
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
        </div>
    </main>
    </div>
    <jsp:include page ="./includes/footer.jsp" flush="true"/>
</body>
</html>
