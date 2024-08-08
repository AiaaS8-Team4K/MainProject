<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link rel="stylesheet" href="css/frame.css">
<link rel="stylesheet" href="css/budget.css">
<script src="js/frame.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>에너지 자원 수입 비용 예측</title>
</head>
<body>
	<jsp:include page="./includes/header.jsp" flush="true" />
	<div id="fullpage">


		<div class="section intention">
			<div class="container">
				<h2 style="display: inline-block;">수입 비용 예측 서비스</h2>
				<p>에너지 자원 시세를 분석하여 미래의 자원 수입 비용을 예측한다.</p>
				<div class="predict-calculator">
					<!-- 왼쪽에 배치할 폼 -->
					<div class="form-container">
						<form action="<c:url value='/budgetCalculate'/>" method="post"
							name="budget_Calculator" onsubmit="return infoConfirm()">
							<table class="calculator">
								<caption>명년도 수입 예산 예측</caption>
								<thead>
									<tr>
										<th colspan="2">내년도 예상 수입액 <br> ${result} ??달러
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th colspan="2">국제 자원 시세</th>
									</tr>
									<tr>
										<td>원유</td>
										<td style="text-align: right;">배럴당 <input type="number" />
											달러
										</td>
									</tr>
									<tr>
										<td>석탄</td>
										<td style="text-align: right;">톤당 <input type="number" />
											달러
										</td>
									</tr>
									<tr>
										<td>천연가스</td>
										<td style="text-align: right;">1000입방 피트당 <input
											type="number" /> 달러
										</td>
									</tr>
									<tr>
										<td>우라늄</td>
										<td style="text-align: right;">파운드당 <input type="number" />
											달러
										</td>
									</tr>
									<tr colspan="2"
										style="display: flex; justify-content: center; gap: 10px; padding-top: 400px;">
										<td><input type="submit" value="계산하기"> <input
											type="reset" value="초기화"></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<!-- 오른쪽에 배치할 텍스트와 이미지 -->
					<div class="text-container">
						<div class="section1text">
							<p style="width: 50%; font-size: 16px;">
								**섹션 1에 들어갈 내용.** <br> 이 모델은 대한민국에서 사용되는 주요 에너지 자원 네 가지의 특정
								연도 국제 시세와 그 명년도의 국내 에너지 자원 수입 비용과의 관계를 분석하여 만들어졌습니다. 즉, 특정 연도의
								국제 시세를 바탕으로 다음해의 수입 비용을 예측합니다. 좌측의 계산기는 현재의 국제 시세를 바탕으로 내년의 수입
								비용을 예측합니다. 예측에 사용된 관계 분석 모델에서, 중요성이 높은 두 가지 자원의 국제 시세만을 사용하여 예측의
								정확도를 높입니다. 예측된 금액은 실제와 다를 수 있습니다. <br>
								<br> 3D 산점도에 대한 해석 내용이 아래에 들어가야 함.
							</p>
						</div>
						<div class="3dScatterPlot">
							<img src="<c:url value='/images/3dScatterPlot.png'/>"
								alt="3D 산점도" style="width: 750px; height: auto;">
						</div>
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
						<h3>모델 1, 4가지 종속변수</h3>
					</div>
					<div class="item">
						<img src="images/mq1280.jpg" alt="분석 서비스 기능">
						<h3>모델 2, 2가지 종속변수</h3>
						<p>석유와 천연가스</p>
					</div>
					<div class="item">
						<img src="images/mq1280.jpg" alt="레퍼런스 데이터 소개">
						<h3>모델 summary</h3>
						<p>서머리 앤 대머리</p>
					</div>

					<div class="section1text">
						<p>**섹션 2에 들어갈 내용** 1. 모델 변화(스텝와이즈 기법, StepAIC함수 사용) 진행과정 / 3.
							왜 특정 자원은 빼도 되는지에 대한 근거. 처음에 모델을 생성할 때 4가지 자원의 국제시세를 사용하였지만, 우라늄과
							석탄 시세의 경우 AIC수치와 p값을 기반으로 국내 수입예산의 변화에 미치는 영향이 미미하여 예측 모델에서
							제거되었습니다. AIC수치란, 모델의 적합도를 판단하는 수치이며, p값은 자원 국제시세가 예측 모델을 생성하는데에
							통계적으로 유의미한지 판단하는 지표입니다. 두 수치 모두 낮을수록 유의미합니다. 우라늄과 석탄의 경우 다른 자원들의
							시세에 비해 높은 수치의 p값을 가지고 있었으며, 두 자원의 시세를 모델에서 제거하는 것이 최적의 AIC수치를 도출
							가능하여 제거되었습니다. 실제로도 우라늄의 경우, 해외의 농축 공장을 거쳐 국내 반입되어 발전에 사용되며, 농축
							공장의 경우 장기계약을 체결하여 우라늄 원광을 공급받아 국제 시세에 큰 영향을 받지 않습니다. 또한 석탄과 우라늄
							모두 원유와 원유의 대체자원으로서 사용되는 천연가스에 비해 국내 전체 에너지 자원 수입 비용의 변화에 큰 영향을
							미치지 않습니다. 2번 내용을 이걸 쓰기보다는 서머리 내용에 대한 설명을 쓰자. + 데이터 전처리는 어떻게 했는지에
							대한 내용 추가할것 예측 모델에 사용된 변수는 원유 시세와 천연가스의 시세이며, 명년도 수입 예산 예측을 위해 원유
							시세는 p값이 9.21e-06로 매우 작아서 모델에 통계적으로 매우 유의미한 역할을 합니다. 또한, 모델의 설명력을
							보여주는 지표인 결정계수(Multiple R-squared)값은 0.7961로, 전체 변동성의 약 79.61퍼센트나
							설명 가능합니다. 모델이 종속변수(명년도 수입 비용)를 유의미하게 설명하는지를 보여주는
							F-통계량(F-statistic)과 p값(p-value)의 경우, F-통계량이 56.6으로 매우 크고, p값이
							9.722e-11으로 매우 작아서, 모델의 신뢰도를 판단하는 수치들을 살펴보았을 때, 모델의 전체적인 적합도는 매우
							높으며, 예측 성능이 양호하다고 판단할 수 있습니다. 1. 차트들에 대한 설명. 왜 이 모델이 신뢰성이 있는가.
							호버로 차트 위에 마우스 올리면 아래 내용이 뜨도록 하면 되지 않을까. 다중선형 회귀모델의 경우 신뢰성을 보여주는
							플롯이 크게 네가지가 있습니다. 왼쪽에서 첫번째 플롯이 ‘잔차 vs 적합값 플롯(Residual vs
							fitted)’이며, 기울기가 0이 되는것이 이상적입니다. 현재 기울기가 0으로, 이상적인 형태를 보이고 있습니다.
							두 번째 플롯인 ‘정규 Q-Q 플롯(Normal Q-Q plot)’의 경우 잔차가 정규 분포를 따르는지 확인하기 위한
							그래프로, 대각선 직선(주로 45도)에 가깝게 점들이 분포합니다. 현재 이상적인 플롯의 형태를 보여주고 있습니다. 세
							번째 플롯인 ‘스케일-위치 플롯(Scale-Location plot)’의 경우 기울기가 0인 직선이 이상적이며,
							이상치를 확인 가능합니다. 점들이 x축과 평행하여 고르게 분포하여, 수평선의 형태로 보이는 것이 좋습니다. 네 번째
							플롯인 ‘잔차 vs 영향력 플롯(Residual vs Leverage plot)’의 경우 이상치가 있는지에 대한
							정보를 제공합니다. 잔차가 매우 크거나 작아서 이상치로 고려되는 점이 없이 무작위 패턴으로 점들이 분포되면
							이상적입니다. residual vs fitted, normal qq, scale location, residual
							vs leverage 잔차 vs 적합값 플롯 / 기울기 0이 되는 것이 이상적 정규 QQ플롯 잔차가 정규 분포를
							따르는지 확인하기 위한 그래프 스케일-위치 플롯 / 기울기가 0인 직선이 이상적, 이상치 확인 가능 잔차 vs 영향력
							플롯 / 설명변수가 얼마나 극단에 치우쳐 있는지를 뜻한다.</p>
					</div>

				</div>
			</div>
		</div>


		<div class="section sectionName">
			<form action="index" method="get">
				<input type="button" onclick="submit()">
				<p style="text-align:center;">
				여기에 레퍼런스 데이터 차트가 올것임. 차트 js로 독립변수 데이터들 차트를 그리고 그 차트들에 하이퍼텍스트 링크를 걸것임.
				</p>
			</form>
		</div>
		<div class="section sectionName"></div>
		<div class="section sectionName"></div>
	</div>
	<jsp:include page="./includes/footer.jsp" flush="true" />
</body>
</html>
