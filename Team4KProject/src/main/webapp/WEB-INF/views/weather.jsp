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
	        <h2 id = "regionHeader">강수량 및 가뭄지수 예측 서비스</h2>
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
				    <p>2022년<strong>'{{regionName}}'</strong> 평균기온: 13.2 °C</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 최저기온: -13.7 °C</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 최고기온: 36.1 °C</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 평균최고기온: 18 °C</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 합계 일조시간: 2325.2 hr</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 합계 일사량: 5325.9 (MJ/m2)</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 일 최다 강수량:176.2 mm</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 평균 해면기압: 1016.3 hPa</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 합계 소형 증발량: 1424.8 mm</p>
				    <p>2022년 <strong>'{{regionName}}'</strong> 합계 대형 증발량: 998.7 mm</p>
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
				
				var markerDaegu= new naver.maps.Marker({
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
				
			</script>

		<!-- animation & click event -->
			<script>
	/* 		    function updateHeader(regionName) {
			        // 해당 h2 태그의 내용을 변경
			        document.getElementById('regionHeader').innerHTML = regionName + ' 강수량 및 가뭄지수 예측';
			    }	
			
			 // 서울 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerSeoul, 'click', function() {
			        updateHeader('서울');
			        setMarkerAnimation('seoul');
			    });

			    // 대구 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerDaegu, 'click', function() {
			        updateHeader('대구');
			        setMarkerAnimation('daegu');
			    });

			    // 강릉 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerGangneung, 'click', function() {
			        updateHeader('강릉');
			        setMarkerAnimation('gangneung');
			    });

			    // 전주 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerJeonju, 'click', function() {
			        updateHeader('전주');
			        setMarkerAnimation('jeonju');
			    });

			    // 울산 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerUlsan, 'click', function() {
			        updateHeader('울산');
			        setMarkerAnimation('ulsan');
			    });

			    // 부산 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerBusan, 'click', function() {
			        updateHeader('부산');
			        setMarkerAnimation('busan');
			    });

			    // 목포 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerMokpo, 'click', function() {
			        updateHeader('목포');
			        setMarkerAnimation('mokpo');
			    });

			    // 제주 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerJeju, 'click', function() {
			        updateHeader('제주');
			        setMarkerAnimation('jeju');
			    });

			    // 보령 마커 클릭 이벤트
			    naver.maps.Event.addListener(markerBoryung, 'click', function() {
			        updateHeader('보령');
			        setMarkerAnimation('boryung');
			    });
			    
			 // 각 지역에 대한 마커 정의
			    var markers = {
			        seoul: markerSeoul,
			        daegu: markerDaegu,
			        gangneung: markerGangneung,
			        jeonju: markerJeonju,
			        ulsan: markerUlsan,
			        busan: markerBusan,
			        mokpo: markerMokpo,
			        jeju: markerJeju,
			        boryung: markerBoryung
			    };

			    // 현재 애니메이션이 적용된 마커를 저장할 변수
			    var currentActiveMarker = null;

			    // 마커 애니메이션을 설정하는 함수
			    function setMarkerAnimation(region) {
			        // 현재 활성화된 마커가 있다면 애니메이션 중지
			        if (currentActiveMarker) {
			            currentActiveMarker.setAnimation(null);
			        }

			        // 선택된 지역의 마커에만 애니메이션 설정
			        if (markers[region]) {
			            markers[region].setAnimation(naver.maps.Animation.BOUNCE);
			            currentActiveMarker = markers[region];
			        }
			    }

			    // 페이지 로드 시 기본 지역 설정
			    window.onload = function() {
			        var defaultRegion = 'seoul';
			        updateHeader('서울');  // 기본 지역 이름으로 서울 선택
			        setMarkerAnimation(defaultRegion);
			    };

			    // 마커 클릭 시 애니메이션 및 헤더 업데이트
			    naver.maps.Event.addListener(markerSeoul, 'click', function() {
			        updateHeader('서울');
			        setMarkerAnimation('seoul');
			    });

			    naver.maps.Event.addListener(markerDaegu, 'click', function() {
			        updateHeader('대구');
			        setMarkerAnimation('daegu');
			    });

			    naver.maps.Event.addListener(markerGangneung, 'click', function() {
			        updateHeader('강릉');
			        setMarkerAnimation('gangneung');
			    });

			    naver.maps.Event.addListener(markerJeonju, 'click', function() {
			        updateHeader('전주');
			        setMarkerAnimation('jeonju');
			    });

			    naver.maps.Event.addListener(markerUlsan, 'click', function() {
			        updateHeader('울산');
			        setMarkerAnimation('ulsan');
			    });

			    naver.maps.Event.addListener(markerBusan, 'click', function() {
			        updateHeader('부산');
			        setMarkerAnimation('busan');
			    });

			    naver.maps.Event.addListener(markerMokpo, 'click', function() {
			        updateHeader('목포');
			        setMarkerAnimation('mokpo');
			    });

			    naver.maps.Event.addListener(markerJeju, 'click', function() {
			        updateHeader('제주');
			        setMarkerAnimation('jeju');
			    });

			    naver.maps.Event.addListener(markerBoryung, 'click', function() {
			        updateHeader('보령');
			        setMarkerAnimation('boryung');
			    }); */
			    
			</script>
			
			<script>
    function updateHeader(regionName) {
        // 해당 h2 태그의 내용을 변경
        document.getElementById('regionHeader').innerHTML = regionName + ' 강수량 및 가뭄지수 예측';
    }

    // chartDescription 내부의 지역 이름을 업데이트하는 함수
	function updateChartDescription(regionName) {
	    const description = document.getElementById('chartDescription');
	    const paragraphs = description.getElementsByTagName('p');
	    for (let i = 0; i < paragraphs.length; i++) {
	        paragraphs[i].innerHTML = paragraphs[i].innerHTML.replace(/{{regionName}}/g, regionName);
	    }
	}

    // 각 지역에 대한 마커 정의
    var markers = {
        seoul: markerSeoul,
        daegu: markerDaegu,
        gangneung: markerGangneung,
        jeonju: markerJeonju,
        ulsan: markerUlsan,
        busan: markerBusan,
        mokpo: markerMokpo,
        jeju: markerJeju,
        boryung: markerBoryung
    };

    // 현재 애니메이션이 적용된 마커를 저장할 변수
    var currentActiveMarker = null;

    // 마커 애니메이션을 설정하는 함수
    function setMarkerAnimation(region) {
        // 현재 활성화된 마커가 있다면 애니메이션 중지
        if (currentActiveMarker) {
            currentActiveMarker.setAnimation(null);
        }

        // 선택된 지역의 마커에만 애니메이션 설정
        if (markers[region]) {
            markers[region].setAnimation(naver.maps.Animation.BOUNCE);
            currentActiveMarker = markers[region];
        }
    }

    // 마커 클릭 시 애니메이션 및 헤더 업데이트
    function onMarkerClick(regionName, regionKey) {
        updateHeader(regionName);
        setMarkerAnimation(regionKey);
        updateChartDescription(regionName);
    }

    // 페이지 로드 시 기본 지역 설정
    window.onload = function() {
        var defaultRegion = 'seoul';
        onMarkerClick('서울', defaultRegion);
    };

    // 마커 클릭 이벤트 등록
    naver.maps.Event.addListener(markerSeoul, 'click', function() {
        onMarkerClick('서울', 'seoul');
    });

    naver.maps.Event.addListener(markerDaegu, 'click', function() {
        onMarkerClick('대구', 'daegu');
    });

    naver.maps.Event.addListener(markerGangneung, 'click', function() {
        onMarkerClick('강릉', 'gangneung');
    });

    naver.maps.Event.addListener(markerJeonju, 'click', function() {
        onMarkerClick('전주', 'jeonju');
    });

    naver.maps.Event.addListener(markerUlsan, 'click', function() {
        onMarkerClick('울산', 'ulsan');
    });

    naver.maps.Event.addListener(markerBusan, 'click', function() {
        onMarkerClick('부산', 'busan');
    });

    naver.maps.Event.addListener(markerMokpo, 'click', function() {
        onMarkerClick('목포', 'mokpo');
    });

    naver.maps.Event.addListener(markerJeju, 'click', function() {
        onMarkerClick('제주', 'jeju');
    });

    naver.maps.Event.addListener(markerBoryung, 'click', function() {
        onMarkerClick('보령', 'boryung');
    });

</script>
			
			
			
		<!-- chart1 -->
		 <script>
	        var ctx1 = document.getElementById('myChart1').getContext('2d');
	        var myChart = new Chart(ctx1, {
	            type: 'line',
	            data: {
	                labels: ['1850', '1851', '1852', '1853', '1854', 
	                    '1855', '1856', '1857', '1858', '1859',
	                    '1860', '1861', '1862', '1863', '1864',
	                    '1865', '1866', '1867', '1868', '1869',
	                    '1870', '1871', '1872', '1873', '1874',
	                    '1875', '1876', '1877', '1878', '1879',
	                    '1880', '1881', '1882', '1883', '1884',
	                    '1885', '1886', '1887', '1888', '1889',
	                    '1890', '1891', '1892', '1893', '1894',
	                    '1895', '1896', '1897', '1898', '1899',
	                    '1900', '1901', '1902', '1903', '1904',
	                    '1905', '1906', '1907', '1908', '1909',
	                    '1910', '1911', '1912', '1913', '1914',
	                    '1915', '1916', '1917', '1918', '1919',
	                    '1920', '1921', '1922', '1923', '1924',
	                    '1925', '1926', '1927', '1928', '1929',
	                    '1930', '1931', '1932', '1933', '1934',
	                    '1935', '1936', '1937', '1938', '1939',
	                    '1940', '1941', '1942', '1943', '1944',
	                    '1945', '1946', '1947', '1948', '1949',
	                    '1950', '1951', '1952', '1953', '1954',
	                    '1955', '1956', '1957', '1958', '1959',
	                    '1960', '1961', '1962', '1963', '1964',
	                    '1965', '1966', '1967', '1968', '1969',
	                    '1970', '1971', '1972', '1973', '1974',
	                    '1975', '1976', '1977', '1978', '1979',
	                    '1980', '1981', '1982', '1983', '1984',
	                    '1985', '1986', '1987', '1988', '1989',
	                    '1990', '1991', '1992', '1993', '1994',
	                    '1995', '1996', '1997', '1998', '1999',
	                    '2000', '2001', '2002', '2003', '2004',
	                    '2005', '2006', '2007', '2008', '2009',
	                    '2010', '2011', '2012', '2013', '2014',
	                    '2015', '2016', '2017', '2018', '2019',
	                    '2020', '2021', '2022'], // X축 레이블
	                datasets: [{
	                    label: '온실가스 배출량',
	                    data: [0.000000000, 0.001975888, 0.003308025, 0.004892240, 0.006666034,
	                        0.007147663, 0.008010943, 0.009021736, 0.009656791, 0.011194064,
	                        0.008913182, 0.007353917, 0.007122525, 0.007565591, 0.007837514,
	                        0.007607391, 0.008463956, 0.009504910, 0.009362992, 0.009872384,
	                        0.014816548, 0.017852920, 0.020561700, 0.023164449, 0.023777581,
	                        0.025837036, 0.027076840, 0.028966608, 0.030643044, 0.032734030,
	                        0.036111493, 0.036412958, 0.039161904, 0.042218117, 0.042864231,
	                        0.043167602, 0.044748936, 0.047350306, 0.050404997, 0.050535539,
	                        0.058709893, 0.062545594, 0.063942088, 0.065372752, 0.067529144,
	                        0.070567574, 0.072803522, 0.075049730, 0.077956662, 0.083011697,
	                        0.087180603, 0.089784462, 0.092603400, 0.097329285, 0.100000785,
	                        0.103878990, 0.107317137, 0.116409943, 0.115012320, 0.118801132,
	                        0.120260325, 0.121026549, 0.123604323, 0.129820207, 0.122821780,
	                        0.121319270, 0.126453482, 0.130088811, 0.129670814, 0.118970350,
	                        0.134267515, 0.127296387, 0.132695436, 0.143093207, 0.144385216,
	                        0.147141839, 0.145752114, 0.154241466, 0.154497015, 0.161938382,
	                        0.156854437, 0.149605135, 0.143725350, 0.148480409, 0.156759140,
	                        0.161535092, 0.171163536, 0.178047667, 0.173444781, 0.179686473,
	                        0.192096562, 0.199187183, 0.201176876, 0.204973887, 0.208764392,
	                        0.191522865, 0.202518851, 0.215377601, 0.221819840, 0.217776849,
	                        0.247846643, 0.261233314, 0.267880895, 0.276119070, 0.284696204,
	                        0.306399342, 0.323209937, 0.334985766, 0.346811239, 0.368267532,
	                        0.363143917, 0.360079746, 0.359777132, 0.369725757, 0.380932343,
	                        0.384158097, 0.396955901, 0.409590270, 0.427072154, 0.442262417,
	                        0.472681807, 0.478626326, 0.496504428, 0.515065546, 0.512634082,
	                        0.518532322, 0.540211526, 0.553054057, 0.563386167, 0.574399963,
	                        0.575320254, 0.567445054, 0.568278208, 0.581822150, 0.613721464,
	                        0.619864253, 0.631391001, 0.640583798, 0.655089292, 0.663583862,
	                        0.670898925, 0.675237458, 0.667419879, 0.670221253, 0.670221067,
	                        0.670221067, 0.689698023, 0.699889626, 0.723375745, 0.755187681,
	                        0.725527221, 0.732998165, 0.736435929, 0.733295842, 0.752094537,
	                        0.793607426, 0.808270674, 0.820625761, 0.851267840, 0.857567355,
	                        0.873638339, 0.871882336, 0.910795752, 0.941374609, 0.956766990,
	                        0.951827462, 0.966001290, 0.973969511, 0.953645358, 0.967729491,
	                        0.979225191, 0.992019490, 0.951788980, 0.991847975, 1.000000000
	                        ], // 첫 번째 라인의 데이터
	                        	                        
	                    borderColor: 'black', // 첫 번째 라인의 색상
	                    borderWidth: 0.5
	                },{
	                    label: '강수량',
	                    data: [null,null,null,null,null,null,null,null,null,null,null,null,null,
	                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
	                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
	                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
	                    	null,null,null,null,null,null,null,null,
	                    	0.03393724, 0.44122746, 0.33750867, 0.42154993, 0.44153086, 
	                        0.46853329, 0.37673370, 0.52630895, 0.66314147, 0.72035368, 
	                        0.40455964, 0.46983356, 0.48890430, 0.70479369, 0.40031207, 
	                        0.65208911, 0.49687933, 0.41292476, 0.81735437, 0.76898405, 
	                        0.52938627, 0.43602635, 0.46892337, 0.68407594, 0.58079057, 
	                        0.38700589, 0.58620839, 0.51850728, 0.50017337, 0.64290049, 
	                        0.43966713, 0.43797677, 0.25589459, 0.90880721, 0.44010055, 
	                        0.46927011, 0.25771498, 0.45110957, 0.65594660, 0.63761269, 
	                        0.62764390, 0.61763176, 0.24930652, 0.32502601, 0.00000000, 
	                        0.44452150, 0.57381241, 0.57970700, 0.51248266, 0.71636616, 
	                        0.50797503, 0.55352809, 0.57320562, 0.49414875, 0.60172503, 
	                        0.40651006, 0.68407594, 0.75663141, 0.50624133, 0.85410888, 
	                        0.52032767, 0.53740465, 0.73183946, 0.71944348, 0.56839459, 
	                        0.74605583, 0.38132802, 0.52115118, 0.44170423, 0.45995146, 
	                        0.47642164, 0.48222954, 0.53359050, 0.51755374, 0.50619799, 
	                        0.39051664, 0.50138696, 0.52063107, 0.64853502, 0.51972087, 
	                        0.73816748, 0.30881588, 0.60194175, 1.00000000, 0.48105929, 
	                        0.60965673, 0.53935506, 0.43667649, 0.67194001, 0.52370839, 
	                        0.50359743, 0.99722607, 0.73023578, 0.49345527, 0.57979369, 
	                        0.58066054, 0.85111824, 0.62881415, 0.56783114, 0.70804438, 
	                        0.50450763, 0.56692094, 0.65694348, 0.86477115, 0.86295076, 
	                        0.69261442, 0.58750867, 0.32966366, 0.32238211, 0.40889390, 
	                        0.51356623, 0.53562760, 0.36537795, 0.69469487, 0.49332524, 
	                        0.74852635, 0.67202670
	                    ],
	                    borderColor: 'blue', // 두 번째 라인의 색상
	                    borderWidth: 0.5,
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
                labels: ['1850', '1851', '1852', '1853', '1854', 
                    '1855', '1856', '1857', '1858', '1859',
                    '1860', '1861', '1862', '1863', '1864',
                    '1865', '1866', '1867', '1868', '1869',
                    '1870', '1871', '1872', '1873', '1874',
                    '1875', '1876', '1877', '1878', '1879',
                    '1880', '1881', '1882', '1883', '1884',
                    '1885', '1886', '1887', '1888', '1889',
                    '1890', '1891', '1892', '1893', '1894',
                    '1895', '1896', '1897', '1898', '1899',
                    '1900', '1901', '1902', '1903', '1904',
                    '1905', '1906', '1907', '1908', '1909',
                    '1910', '1911', '1912', '1913', '1914',
                    '1915', '1916', '1917', '1918', '1919',
                    '1920', '1921', '1922', '1923', '1924',
                    '1925', '1926', '1927', '1928', '1929',
                    '1930', '1931', '1932', '1933', '1934',
                    '1935', '1936', '1937', '1938', '1939',
                    '1940', '1941', '1942', '1943', '1944',
                    '1945', '1946', '1947', '1948', '1949',
                    '1950', '1951', '1952', '1953', '1954',
                    '1955', '1956', '1957', '1958', '1959',
                    '1960', '1961', '1962', '1963', '1964',
                    '1965', '1966', '1967', '1968', '1969',
                    '1970', '1971', '1972', '1973', '1974',
                    '1975', '1976', '1977', '1978', '1979',
                    '1980', '1981', '1982', '1983', '1984',
                    '1985', '1986', '1987', '1988', '1989',
                    '1990', '1991', '1992', '1993', '1994',
                    '1995', '1996', '1997', '1998', '1999',
                    '2000', '2001', '2002', '2003', '2004',
                    '2005', '2006', '2007', '2008', '2009',
                    '2010', '2011', '2012', '2013', '2014',
                    '2015', '2016', '2017', '2018', '2019',
                    '2020', '2021', '2022'], // X축 레이블
                datasets: [{
                    label: '온실가스 배출량',
                    data: [0.000000000, 0.001975888, 0.003308025, 0.004892240, 0.006666034,
                        0.007147663, 0.008010943, 0.009021736, 0.009656791, 0.011194064,
                        0.008913182, 0.007353917, 0.007122525, 0.007565591, 0.007837514,
                        0.007607391, 0.008463956, 0.009504910, 0.009362992, 0.009872384,
                        0.014816548, 0.017852920, 0.020561700, 0.023164449, 0.023777581,
                        0.025837036, 0.027076840, 0.028966608, 0.030643044, 0.032734030,
                        0.036111493, 0.036412958, 0.039161904, 0.042218117, 0.042864231,
                        0.043167602, 0.044748936, 0.047350306, 0.050404997, 0.050535539,
                        0.058709893, 0.062545594, 0.063942088, 0.065372752, 0.067529144,
                        0.070567574, 0.072803522, 0.075049730, 0.077956662, 0.083011697,
                        0.087180603, 0.089784462, 0.092603400, 0.097329285, 0.100000785,
                        0.103878990, 0.107317137, 0.116409943, 0.115012320, 0.118801132,
                        0.120260325, 0.121026549, 0.123604323, 0.129820207, 0.122821780,
                        0.121319270, 0.126453482, 0.130088811, 0.129670814, 0.118970350,
                        0.134267515, 0.127296387, 0.132695436, 0.143093207, 0.144385216,
                        0.147141839, 0.145752114, 0.154241466, 0.154497015, 0.161938382,
                        0.156854437, 0.149605135, 0.143725350, 0.148480409, 0.156759140,
                        0.161535092, 0.171163536, 0.178047667, 0.173444781, 0.179686473,
                        0.192096562, 0.199187183, 0.201176876, 0.204973887, 0.208764392,
                        0.191522865, 0.202518851, 0.215377601, 0.221819840, 0.217776849,
                        0.247846643, 0.261233314, 0.267880895, 0.276119070, 0.284696204,
                        0.306399342, 0.323209937, 0.334985766, 0.346811239, 0.368267532,
                        0.363143917, 0.360079746, 0.359777132, 0.369725757, 0.380932343,
                        0.384158097, 0.396955901, 0.409590270, 0.427072154, 0.442262417,
                        0.472681807, 0.478626326, 0.496504428, 0.515065546, 0.512634082,
                        0.518532322, 0.540211526, 0.553054057, 0.563386167, 0.574399963,
                        0.575320254, 0.567445054, 0.568278208, 0.581822150, 0.613721464,
                        0.619864253, 0.631391001, 0.640583798, 0.655089292, 0.663583862,
                        0.670898925, 0.675237458, 0.667419879, 0.670221253, 0.670221067,
                        0.670221067, 0.689698023, 0.699889626, 0.723375745, 0.755187681,
                        0.725527221, 0.732998165, 0.736435929, 0.733295842, 0.752094537,
                        0.793607426, 0.808270674, 0.820625761, 0.851267840, 0.857567355,
                        0.873638339, 0.871882336, 0.910795752, 0.941374609, 0.956766990,
                        0.951827462, 0.966001290, 0.973969511, 0.953645358, 0.967729491,
                        0.979225191, 0.992019490, 0.951788980, 0.991847975, 1.000000000
                        ],
                    borderColor:'black',
                    borderWidth: 0.5
                },  {
                    label: '가뭄지수',
                    data: [null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	null,null,null,null,null,null,null,null,null,null,null,null,null,
                    	
                    	
                        0.43457748, 1.00000000, 0.58000964, 0.43338018, 0.34893626,
                        0.44911614, 0.68822854, 0.88122490, 0.57020602, 0.00000000,
                        0.12761233, 0.41999322, 0.93519466, 0.79257331, 0.43519324,
                        0.46685614, 0.56465853, 0.48177109, 0.79142447, 0.72407345,
                        0.51052627, 0.56200736, 0.72430720, 0.02274302, 0.16202903,
                        0.19747198, 0.33078289, 0.78375035, 0.04643247, 0.69016850,
                        0.74529988, 0.55057291, 0.84176915, 0.88869488
                    ],
                    borderColor: 'red', // 두 번째 라인의 색상
                    borderWidth: 0.5
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
