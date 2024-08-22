<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.css" integrity="sha512-earFJuyxuk1UIfnUubV3DGk2ysSejjmhMPb/4OXsqII9qmIbEwa1AaXrTqo4ivYizpbfyjXFZi6wENs94/BKWQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.extensions.min.js" integrity="sha512-CG4suntOelKyziz99VyC3BrbQ60IOtpJ9RYQvI/0d6TdYWStN69gCb9OpPMlym+3OmNAr357Kv6FVqTk25Ej5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=7i70a5jjwg"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <link rel="stylesheet" href="css/weather.css">
  <script src="js/weather.js"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  
  <title>이상기후 관련 서비스</title>
</head>
<body>
  <jsp:include page ="./includes/header.jsp" flush="true"/>
	<div id="fullpage">
	    <div class="section predictionWeather">
	        <h2 style="position: relative; bottom:50px;">강수량 및 가뭄지수 예측 서비스</h2>
	        <div class="background"></div>
	        <div style="display:flex; align-items: center; flex-direction: row; justify-content:center;">
	            <div id="map" style="width:500px;height:90%;margin: 0 40px;"></div>
	            <div id="chartContainer">
	                <canvas id="myChart1"></canvas>
	                <canvas id="myChart2"></canvas>
	            </div>
			    <div id="chartDescriptionContainer">
			        <!-- 입력값 폼 -->
			        <form id="inputForm">
			            <label for="inputValue">온실가스 배출량 입력:</label>
			            <input type="text" id="inputValue" name="inputValue">
			            <button type="button" id="submitButton">입력</button>
			        </form>
			
			        <!-- 설명 텍스트 박스 -->
			        <div id="chartDescription">
			            <h3>데이터 설명</h3>
			            <p>차트에서 각 라인이 어떤 데이터를 나타내는지 설명할 수 있습니다.</p>
			        </div>
			    </div>
	        </div>
        	<script>
				var mapOptions = {
				    center: new naver.maps.LatLng(35.73689722, 127.5158),
				    zoom: 7
				};	
				var map = new naver.maps.Map('map', mapOptions);
				
				var markerSeoul = new naver.maps.Marker({
				    position: new naver.maps.LatLng(37.514575, 127.0495556),
				    map: map
				});
				
				var markerGangneung = new naver.maps.Marker({
				    position: new naver.maps.LatLng(37.74913611, 128.8784972),
				    map: map
				});
				
				var markerDeagu= new naver.maps.Marker({
				    position: new naver.maps.LatLng(35.86952722, 128.6061745),
				    map: map
				});
				
				var markerJeonju= new naver.maps.Marker({
				    position: new naver.maps.LatLng(35.80918889, 127.1219194),
				    map: map
				});
				
				var markerUlsan = new naver.maps.Marker({
				    position: new naver.maps.LatLng(35.56971228, 129.3328162),
				    map: map
				});
				
				var markerBusan= new naver.maps.Marker({
				    position: new naver.maps.LatLng(35.1798, 129.075),
				    map: map
				});
				
				var markerMokpo= new naver.maps.Marker({
				    position: new naver.maps.LatLng(34.80878889, 126.3944194),
				    map: map
				});
				
				var markerJeju= new naver.maps.Marker({
				    position: new naver.maps.LatLng(33.49631111, 126.5332083),
				    map: map
				});
				
				var markerBoryung= new naver.maps.Marker({
				    position: new naver.maps.LatLng(36.330575, 126.6148861),
				    map: map
				});
				
				naver.maps.Event.addListener(markerDeagu, 'click', function() {
				    alert('대구 마커가 클릭되었습니다!');
				});
				
				
			</script>

			
		<!-- chart1 -->
		 <script>
	        var ctx1 = document.getElementById('myChart1').getContext('2d');
	        var myChart = new Chart(ctx1, {
	            type: 'line',
	            data: {
	                labels: ['Label 1', 'Label 2','Label3'], // X축 레이블
	                datasets: [{
	                    label: '온실가스 배출량',
	                    data: [10, 20, 30], // 첫 번째 라인의 데이터
	                    borderColor: 'blue', // 첫 번째 라인의 색상
	                    borderWidth: 1
	                }, {
	                    label: '강수량',
	                    data: [20, 30, 45], // 두 번째 라인의 데이터
	                    borderColor: 'red', // 두 번째 라인의 색상
	                    borderWidth: 1
	                },
	                ]
	            },
	            options: {}
	        });
	    </script>
		<!-- chart2 -->
		<script>
        var ctx2 = document.getElementById('myChart2').getContext('2d');
        var myChart = new Chart(ctx2, {
            type: 'line',
            data: {
                labels: ['Label 1', 'Label 2','Label3'], // X축 레이블
                datasets: [{
                    label: '온실가스 배출량',
                    data: [10, 20, 30], // 첫 번째 라인의 데이터
                    borderColor: 'blue', // 첫 번째 라인의 색상
                    borderWidth: 1
                }, {
                    label: '가뭄지수',
                    data: [20, 30, 45], // 두 번째 라인의 데이터
                    borderColor: 'red', // 두 번째 라인의 색상
                    borderWidth: 1
                },
                ]
            },
            options: {}
        });
		
		</script>

	   </div>
	   
        
        <!-- section2 -->
        <div class="section modelWeather">
            
        </div>
        
        
        <!-- section3 -->
        <div class="section dataWeather">
        
        </div>
    </div>
    <jsp:include page ="./includes/footer.jsp" flush="true"/>
</body>
</html>
