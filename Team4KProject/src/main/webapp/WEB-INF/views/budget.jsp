<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.css"
	integrity="sha512-earFJuyxuk1UIfnUubV3DGk2ysSejjmhMPb/4OXsqII9qmIbEwa1AaXrTqo4ivYizpbfyjXFZi6wENs94/BKWQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.extensions.min.js"
	integrity="sha512-CG4suntOelKyziz99VyC3BrbQ60IOtpJ9RYQvI/0d6TdYWStN69gCb9OpPMlym+3OmNAr357Kv6FVqTk25Ej5Q=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<link rel="stylesheet" href="css/budget.css">
<style>
</style>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="js/budget.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에너지 자원 수입 비용 예측</title>
</head>
<body>
	<jsp:include page="./includes/header.jsp" flush="true" />
	<div id="fullpage">


		<div class="section calculator">
			<div class="container">

				<span class="sec1title"> <span class="sec1titleline1">수입
						비용 예측 서비스</span> <br>에너지 자원 시세를 분석하여 미래의 자원 수입 비용을 예측한다.
				</span>

				<div id="sec1backgroundbox">
					<hr id=boxTopLine>
					<div class="predict-calculator">
						<!-- 왼쪽에 배치할 폼 -->
						<div class="form-container">




							<form name="budget_Calculator">
								<table class="calculator">
									<thead>
										<tr>
											<th colspan="2">내년도 예상 수입액 <br> <span
												id="budgetPredict">0</span> 달러
											</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th colspan="2">국제 자원 시세</th>
										</tr>
										<tr>
											<td>원유</td>
											<td style="text-align: right;">배럴당 <input type="number"
												id="oilPrice" value="0" /> 달러
											</td>
										</tr>
										<tr>
											<td>석탄</td>
											<td style="text-align: right;">톤당 <input type="number"
												id="coalPrice" value="0" /> 달러
											</td>
										</tr>
										<tr>
											<td>천연가스</td>
											<td style="text-align: right;">1MMBtu당 <input
												type="number" id="LNGPrice" value="0" /> 달러
											</td>
										</tr>
										<tr>
											<td>우라늄</td>
											<td style="text-align: right;">파운드당 <input type="number"
												id="uranPrice" value="0" /> 달러
											</td>
										</tr>
										<tr style="height: 300px">
											<td colspan="2" style="font-size: 12px; text-align: center;">
												<!--  천연가스 1000 입방피트는 약 1.03MMBTU-->
											</td>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
						<!-- 오른쪽에 배치할 텍스트와 이미지 -->
						<div class="text-container">
							<div class="section1text">
								<div class="textConTop">
									<hr
										style="background: black; height: 2px; border: 0; margin-bottom: 5px; max-width: 440px;">
									<span
										style="font-size: 80px; font-weight: 400; line-height: 1.2;">01</span><br>
									<span
										style="font-size: 28px; font-weight: 500; margin-top: 28px; display: inline-block;">예측
										내용 소개</span>
								</div>
								<p
									style="width: 35%; font-size: 20px; font-weight: 200; margin-top: 40px; text-align: left;">
									이 모델은 대한민국에서 사용되는 주요 에너지 자원 네 가지의, 특정 연도 국제 시세와 그 명년도의 국내 에너지
									자원 수입 비용과의 관계를 분석하여 만들어졌습니다. 즉, 특정 연도의 국제 시세를 바탕으로 그 다음해의 수입
									비용을 예측합니다. 좌측의 계산기는 예측 내용을 계산하여 출력합니다. 예측에 사용된 관계 분석 모델 개선을
									통하여, 중요성이 높은 두 가지 자원의 국제 시세인 원유와 천연가스 시세만을 계산에 사용하여 예측의 정확도를
									높입니다. 예측된 금액은 실제와 다를 수 있습니다.</p>
							</div>
							<!-- <div class="3dScatterPlot">
								<img src="images/3dScatterPlot.png" alt="3D 산점도"
									style="width: 680px; height: auto;"> 
							</div>-->
						</div>
					</div>
				</div>
			</div>
		</div>






		<div class="section introduce">
			<div class="container">
				<div id="sec2backgroundbox">
					<div class="model-introduce">

						<!-- 왼쪽 섹션의 내용 -->
						<div class="sec2leftImages">
							<div class="equation">
								<!-- 첫 번째 수식 -->
								<p
									style="border: 1px solid; width: 480px; text-align: left; font-size: 80%; padding: 10px;">
									y = 4.100 × 10<sup>8</sup> x<sub>1</sub> + (-2.378 × 10<sup>8</sup>)x<sub>2</sub>
									+ 2.018 × 10<sup>4</sup> x<sub>3</sub> + (-2.283 × 10<sup>8</sup>)x<sub>4</sub>
									+ (-7.093 × 10<sup>9</sup>)
								</p>

								<!-- 두 번째 수식 -->
								<p
									style="border: 1px solid; width: 480px; text-align: left; font-size: 80%; padding: 10px;">
									y = 3.517 × 10<sup>8</sup> x<sub>1</sub> + (-1.943 × 10<sup>8</sup>)x<sub>2</sub>
									+ (-1.406 × 10<sup>10</sup>)
								</p>

								<!-- R스튜디오 서머리 -->
								<p
									style="border: 1px solid; width: 480px; text-align: left; padding: 10px;">
									> summary(model)<br> Call:<br> lm(formula =
									import_budget_sum ~ oil_price + lng_price, data = data)<br>

									Residuals:<br> Min 1Q Median 3Q Max<br> -4.194e+10
									-1.264e+10 1.495e+09 9.586e+09 1.062e+11<br> Coefficients:<br>
									Estimate Std. Error t value Pr(>|t|)<br> (Intercept)
									-1.406e+10 1.238e+10 -1.135 0.266<br> oil_price 3.517e+08
									6.556e+07 5.365 9.21e-06 ***<br> lng_price -1.943e+08
									1.331e+08 -1.459 0.155<br> ---<br> Signif. codes: 0
									‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1<br> <br>
									Residual standard error: 2.735e+10 on 29 degrees of freedom<br>
									Multiple R-squared: 0.7961, Adjusted R-squared: 0.782<br>
									F-statistic: 56.6 on 2 and 29 DF, p-value: 9.722e-11<br>

								</p>
							</div>

						</div>
						<div class="sec2text" style="margin-left: 3%;">
							<hr id="sec2Line"
								style="max-width: 600px; margin-left: 0; margin-right: auto; background: black; height: 2px; border: 0;">
							<span
								style="width: 45%; font-size: 72px; font-weight: 600; line-height: 1.2; display: inline-block;">02</span><br>
							<span
								style="font-size: 24px; font-weight: 600; margin-top: 10px; display: inline-block;">모델
								소개</span>
							<p
								style="width: 45%; font-size: 20px; font-weight: 200; margin-left: 0; text-align: left;">
								최초 모델을 생성시 4가지 자원의 국제시세를 사용하였지만, 우라늄과 석탄 시세의 경우 AIC수치와 p값을 기반으로
								국내 수입예산의 변화에 미치는 영향이 미미하여 예측 모델에서 제거되었습니다. AIC수치란, 모델의 적합도를 판단하는
								수치이며, p값은 자원 국제시세가 예측 모델을 생성하는데에 통계적으로 유의미한지 판단하는 지표입니다. 두 수치 모두
								낮을수록 유의미합니다. 우라늄과 석탄의 경우 다른 자원들의 시세에 비해 높은 수치의 p값을 가지고 있었으며, 두
								자원의 시세를 모델에서 제거하는 것이 최적의 AIC수치를 도출 가능하여 제거되었습니다. 실제로도 우라늄의 경우,
								해외의 농축 공장을 거쳐 국내 반입되어 발전에 사용되며, 농축 공장의 경우 장기계약을 체결하여 우라늄 원광을
								공급받아 국제 시세에 큰 영향을 받지 않습니다. 또한 석탄과 우라늄 모두, 원유와 원유의 대체자원으로서 사용되는
								천연가스에 비해 국내 전체 에너지 자원 수입 비용의 변화에 큰 영향을 미치지 않습니다. 예측 모델에 사용된 변수는
								원유 시세와 천연가스의 시세이며, 명년도 수입 예산 예측을 위해 원유 시세는 p값이 9.21e-06로 매우 작아서
								모델에 통계적으로 매우 유의미한 역할을 합니다. 또한, 모델의 설명력을 보여주는 지표인 결정계수(Multiple
								R-squared)값은 0.7961로, 전체 변동성의 약 79.61퍼센트나 설명 가능합니다. 모델이 종속변수(명년도
								수입 비용)를 유의미하게 설명하는지를 보여주는 F-통계량(F-statistic)과 p값(p-value)의 경우,
								F-통계량이 56.6으로 매우 크고, p값이 9.722e-11으로 매우 작아서, 모델의 신뢰도를 판단하는 수치들을
								살펴보았을 때, 모델의 전체적인 적합도는 매우 높으며, 예측 성능이 양호하다고 판단할 수 있습니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section effect">
			<form action="index" method="get">
				<h2>모델 신뢰도 증명 플롯</h2>

				<div class="effect-items">


					<div class="sec3Plots">

						<div class="item" data-animation="fade-left">
							<img src="images/Minjunchart4.png" alt="첫번째 플롯" class="plot-img">
							<h3>잔차 vs 적합값 플롯</h3>
							<p>Residual vs Fitted</p>
						</div>

						<div class="item" data-animation="fade-left">
							<img src="images/Minjunchart1.png" alt="두번째 플롯" class="plot-img">
							<h3>정규 Q-Q 플롯</h3>
							<p>Normal Q-Q</p>
							<br>
						</div>

						<div class="item" data-animation="fade-left">
							<img src="images/Minjunchart2.png" alt="세번째 플롯" class="plot-img">
							<h3>스케일-위치 플롯</h3>
							<p>Scale-Location Plot</p>
							<br>
						</div>

						<div class="item" data-animation="fade-left">
							<img src="images/Minjunchart3.png" alt="네번째 플롯" class="plot-img">
							<h3>잔차 vs 영향력 플롯</h3>
							<p>Residual vs Leverage Plot</p>
						</div>

					</div>
				</div>

				<p
					style="text-align: center; max-width: 1400px; margin: 0 auto; font-size: 16px;">
					왼쪽에서 첫번째 플롯이 ‘잔차 vs 적합값 플롯(Residual vs fitted)’이며, 기울기가 0이 되는것이
					이상적입니다. 현재 기울기가 0으로, 이상적인 형태를 보이고 있습니다. 두 번째 플롯인 ‘정규 Q-Q 플롯(Normal
					Q-Q plot)’의 경우 잔차가 정규 분포를 따르는지 확인하기 위한 그래프로, 대각선 직선(주로 45도)에 가깝게
					점들이 분포합니다. 현재 이상적인 플롯의 형태를 보여주고 있습니다. 세 번째 플롯인 ‘스케일-위치
					플롯(Scale-Location plot)’의 경우 기울기가 0인 직선이 이상적이며, 이상치를 확인 가능합니다. 점들이
					x축과 평행하여 고르게 분포하여, 수평선의 형태로 보이는 것이 좋습니다. 네 번째 플롯인 ‘잔차 vs 영향력
					플롯(Residual vs Leverage plot)’의 경우 이상치가 있는지에 대한 정보를 제공합니다. 잔차가 매우
					크거나 작아서 이상치로 고려되는 점이 없이 무작위 패턴으로 점들이 분포되면 이상적입니다. <strong>네
						개의 플롯을 확인해 봤을때, 이 모델은 유의한 것으로 판단 가능합니다.</strong>
					<!-- residual vs fitted, normal qq, scale location, residual vs
					leverage 잔차 vs 적합값 플롯 / 기울기 0이 되는 것이 이상적 정규 QQ플롯 잔차가 정규 분포를 따르는지
					확인하기 위한 그래프 스케일-위치 플롯 / 기울기가 0인 직선이 이상적, 이상치 확인 가능 잔차 vs 영향력 플롯 /
					설명변수가 얼마나 극단에 치우쳐 있는지를 뜻한다. -->
				</p>
			</form>
		</div>



		<div class="section chart">


			<div class="chart-grid">

				<div id="chartIndex" style="justify-contents: start;">
					<hr id="sec4Line">
					<span
						style="font-size: 72px; font-weight: 600; line-height: 1.2; display: inline-block;">04</span><br>
					<span
						style="font-size: 24px; font-weight: 600; margin-top: 10px; display: inline-block;">레퍼런스
						데이터 소개</span><br>
					<!-- <span style="width: 45%; font-size: 20px; font-weight: 200; display: inline-block;">
								독립변수로 사용한 데이터는 크게 다섯종류 입니다. 네가지 에너지 자원들의 국제 시세와, 국내로 수입되는 이 자원들의 수입액 데이터입니다.
								현재 차트에서는 수입액 데이터만을 제공하고 있지만, 출처 페이지로 이동 시 각 자원들의 수입액을 확인 가능합니다.</span> -->
				</div>


				<div id="chartContainer" style="">
					<canvas id="oilChart"></canvas>
				</div>

				<div id="chartContainer">
					<canvas id="coalChart"></canvas>
				</div>

				<div id="chartContainer">
					<canvas id="LNGChart"></canvas>
				</div>

				<div id="chartContainer">
					<canvas id="uranChart"></canvas>
				</div>

				<div id="chartContainer">
					<canvas id="newChart"></canvas>
				</div>
				<p style="grid-column: span 3; text-align: center; font-size: 12px;">
					차트를 클릭하면 출처 페이지로 <span style="font-weight: 600;">이동</span>합니다.
				</p>
			</div>
		</div>






		<!--  <div class="section sectionName">
			<p style="text-align: center;">마지막 섹션. 여기에는 무엇을 넣어야 할까. 원래대로라면
				머신러닝 돌린 내용을 넣어야 하지만...</p>
		</div>-->
	</div>
	<jsp:include page="./includes/footer.jsp" flush="true" />
	<script>

	// 첫 번째 차트 (국제 원유 시세)
			var oilData = {
				labels : [ '1980', '1981', '1982', '1983', '1984', '1985', '1986',
						'1987', '1988', '1989', '1990', '1991', '1992', '1993',
						'1994', '1995', '1996', '1997', '1998', '1999', '2000',
						'2001', '2002', '2003', '2004', '2005', '2006', '2007',
						'2008', '2009', '2010', '2011', '2012', '2013', '2014',
						'2015', '2016', '2017', '2018', '2019', '2020', '2021',
						'2022', '2023', '2024' ],
				datasets : [ {
					label : '국제 원유 시세 (배럴 당 달러)',
					data : [ 37.9, 36.9, 32.9, 30.1, 29.1, 27.8, 14.4, 18.2, 14.7,
							17.8, 24.5, 21.5, 20.6, 18.5, 17.2, 18.4, 22.2, 20.6,
							14.4, 19.2, 30.3, 25.9, 26.1, 31.1, 41.4, 56.5, 66.1,
							72.3, 99.6, 61.7, 79.4, 95.1, 94.2, 98, 93.1, 48.8,
							43.2, 50.9, 64.8, 56.9, 39.4, 68, 94.8, 77.6, 78.8 ],
					fill : false,
					borderColor : 'rgb(75, 192, 192)',
					tension : 0.1
				} ]
			};

			var oilCtx = document.getElementById('oilChart').getContext('2d');
			var oilChart = new Chart(oilCtx, {
				type : 'line',
				data : oilData,
				options : {}
			});

			document
					.getElementById('oilChart')
					.addEventListener(
							'click',
							function() {
								window.location.href = 'https://www.ibisworld.com/de/bed/weltmarktpreis-fuer-rohol/432/';
							});

			document.getElementById('oilChart').addEventListener('mouseover',
					function() {
						this.style.cursor = 'pointer';
					});

			document.getElementById('oilChart').addEventListener('mouseout',
					function() {
						this.style.cursor = 'default';
					});

			// 두 번째 차트 (국제 석탄 시세)
			var coalData = {
				labels : [ '1980', '1981', '1982', '1983', '1984', '1985', '1986',
						'1987', '1988', '1989', '1990', '1991', '1992', '1993',
						'1994', '1995', '1996', '1997', '1998', '1999', '2000',
						'2001', '2002', '2003', '2004', '2005', '2006', '2007',
						'2008', '2009', '2010', '2011', '2012', '2013', '2014',
						'2015', '2016', '2017', '2018', '2019', '2020', '2021',
						'2022', '2023', '2024' ],
				datasets : [ {
					label : '국제 석탄 시세 (톤 당 달러)',
					data : [ 49.8, 54.1, 55.2, 53.5, 52.7, 53, 49.8, 48.7, 47.8,
							47.4, 47.4, 47.5, 46.3, 45.3, 44.5, 44.3, 45.5, 45.5,
							44.5, 41.8, 39, 41.8, 45.5, 44.5, 63.8, 81.7, 90.8,
							89.1, 133.7, 118.4, 146.1, 186.2, 151.3, 115.3, 99.3,
							88.5, 83, 138, 140.7, 136.7, 104.5, 158, 282.4, 208,
							228 ],
					fill : false,
					borderColor : 'rgb(73,91,191)',
					tension : 0.1
				} ]
			};

			var coalCtx = document.getElementById('coalChart').getContext('2d');
			var coalChart = new Chart(coalCtx, {
				type : 'line',
				data : coalData,
				options : {}
			});

			document
					.getElementById('coalChart')
					.addEventListener(
							'click',
							function() {
								window.location.href = 'https://www.ibisworld.com/de/bed/weltmarktpreis-fuer-kokskohle/437/';
							});

			document.getElementById('coalChart').addEventListener('mouseover',
					function() {
						this.style.cursor = 'pointer';
					});

			document.getElementById('coalChart').addEventListener('mouseout',
					function() {
						this.style.cursor = 'default';
					});

			// 세 번째 차트 (국제 천연가스 시세)
			var LNGData = {
				labels : [ '1980', '1981', '1982', '1983', '1984', '1985', '1986',
						'1987', '1988', '1989', '1990', '1991', '1992', '1993',
						'1994', '1995', '1996', '1997', '1998', '1999', '2000',
						'2001', '2002', '2003', '2004', '2005', '2006', '2007',
						'2008', '2009', '2010', '2011', '2012', '2013', '2014',
						'2015', '2016', '2017', '2018', '2019', '2020', '2021',
						'2022', '2023', '2024' ],
				datasets : [ {
					label : '국제 천연가스 시세 (1000세제곱피트당 달러)',
					data : [ 2.9, 3.3, 3.5, 3.3, 3.2, 3.1, 2.8, 2.1, 2, 1.9, 2.3,
							2.3, 2.2, 2.4, 2.2, 2.2, 2.8, 2.6, 2.3, 2.2, 4.1, 4,
							3.2, 4.7, 5.1, 7.6, 7.6, 7.8, 11.1, 6.3, 6.3, 7.3, 7.1,
							7.8, 7.2, 4.7, 3.5, 4.3, 5.4, 3.7, 2.6, 10, 23.4, 7.8,
							8.4 ],
					fill : false,
					borderColor : 'rgb(167,73,191)',
					tension : 0.1
				} ]
			};

			var LNGCtx2 = document.getElementById('LNGChart').getContext('2d');
			var LNGChart = new Chart(LNGCtx2, {
				type : 'line',
				data : LNGData,
				options : {}
			});

			document
					.getElementById('LNGChart')
					.addEventListener(
							'click',
							function() {
								window.location.href = 'https://www.ibisworld.com/de/bed/weltmarktpreis-fuer-erdgas/434/';
							});

			document.getElementById('LNGChart').addEventListener('mouseover',
					function() {
						this.style.cursor = 'pointer';
					});

			document.getElementById('LNGChart').addEventListener('mouseout',
					function() {
						this.style.cursor = 'default';
					});

			// 네 번째 차트 (국제 우라늄 시세)

			var uranData = {
				labels : [ '1980', '1981', '1982', '1983', '1984', '1985', '1986',
						'1987', '1988', '1989', '1990', '1991', '1992', '1993',
						'1994', '1995', '1996', '1997', '1998', '1999', '2000',
						'2001', '2002', '2003', '2004', '2005', '2006', '2007',
						'2008', '2009', '2010', '2011', '2012', '2013', '2014',
						'2015', '2016', '2017', '2018', '2019', '2020', '2021',
						'2022', '2023', '2024' ],
				datasets : [ {
					label : '국제 우라늄 시세 (톤 당 달러)',
					data : [ 31.8, 24.2, 19.9, 23, 17.3, 14.4, 17, 16.8, 14.7,
							10.1, 9.7, 8.5, 8.6, 10.1, 9.4, 11.7, 15.6, 12.1, 10.4,
							10, 8.3, 8.6, 9.8, 11.2, 18, 27.9, 47.7, 99.2, 64.2,
							46.7, 46, 56.2, 48.9, 38.6, 33.5, 36.8, 26.5, 22.1,
							24.5, 25.9, 29.4, 32.9, 40.8, 48.6, 52.2 ],
					fill : false,
					borderColor : 'rgb(191,189,73)',
					tension : 0.1
				} ]
			};

			var uranCtx = document.getElementById('uranChart').getContext('2d');
			var uranChart = new Chart(uranCtx, {
				type : 'line',
				data : uranData,
				options : {}
			});

			document
					.getElementById('uranChart')
					.addEventListener(
							'click',
							function() {
								window.location.href = 'https://www.ibisworld.com/de/bed/weltmarktpreis-fuer-uran/435/';
							});

			document.getElementById('uranChart').addEventListener('mouseover',
					function() {
						this.style.cursor = 'pointer';
					});

			document.getElementById('uranChart').addEventListener('mouseout',
					function() {
						this.style.cursor = 'default';
					});

			// 다섯 번째 차트 (에너지 수입액)
			var newData = {
				labels : [ '1981', '1982', '1983', '1984', '1985', '1986', '1987',
						'1988', '1989', '1990', '1991', '1992', '1993', '1994',
						'1995', '1996', '1997', '1998', '1999', '2000', '2001',
						'2002', '2003', '2004', '2005', '2006', '2007', '2008',
						'2009', '2010', '2011', '2012', '2013', '2014', '2015',
						'2016', '2017', '2018', '2019', '2020', '2021' ],
				datasets : [ {
					label : '에너지 수입액 합계(백만달러)',
					data : [ 7763, 7580, 6936, 7263, 7322, 4996, 5926, 5920, 7516,
							10909, 12754, 14654, 15088, 15472, 19053, 24242, 27309,
							18276, 22746, 37887, 33893, 32289, 38306, 49600, 66697,
							85566, 94977, 141475, 91161, 121655, 172489, 184800,
							178698, 174138, 102715, 80942, 109467, 145970, 126702,
							86553, 137200 ],
					fill : false,
					borderColor : 'rgb(191,73,73)',
					tension : 0.1
				} ]
			};

			var newCtx = document.getElementById('newChart').getContext('2d');
			var newChart = new Chart(newCtx, {
				type : 'line',
				data : newData,
				options : {}
			});

			document
					.getElementById('newChart')
					.addEventListener(
							'click',
							function() {
								window.location.href = 'https://kosis.kr/statHtml/statHtml.do?orgId=339&tblId=DT_F_Y160&conn_path=I2'; // 링크 수정 필요
							});

			document.getElementById('newChart').addEventListener('mouseover',
					function() {
						this.style.cursor = 'pointer';
					});

			document.getElementById('newChart').addEventListener('mouseout',
					function() {
						this.style.cursor = 'default';
					});
			
			
			//여기서부터 계산기
			 function calculateBudget() {
	            const oilPrice = parseFloat(document.getElementById('oilPrice').value) || 0;
	            const LNGPrice = parseFloat(document.getElementById('LNGPrice').value) || 0;

	            const budgetPredict = (oilPrice * 351700000) + (LNGPrice * (-194300000)) - 14060000000;

	            document.getElementById('budgetPredict').innerText = budgetPredict.toLocaleString();
	        }

	        document.querySelectorAll('input[type="number"]').forEach(input => {
	            input.addEventListener('input', calculateBudget);
	        });

	        // 초기 계산
	        calculateBudget();
	</script>


</body>
</html>
