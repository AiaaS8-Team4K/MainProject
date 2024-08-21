<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.css" integrity="sha512-earFJuyxuk1UIfnUubV3DGk2ysSejjmhMPb/4OXsqII9qmIbEwa1AaXrTqo4ivYizpbfyjXFZi6wENs94/BKWQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.25/fullpage.extensions.min.js" integrity="sha512-CG4suntOelKyziz99VyC3BrbQ60IOtpJ9RYQvI/0d6TdYWStN69gCb9OpPMlym+3OmNAr357Kv6FVqTk25Ej5Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
  
  
  <link rel="stylesheet" href="css/greenHouse.css">
  <script src="js/greenHouse.js"></script>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Team4K 온실가스배출량</title>
</head>
<body>
  <jsp:include page ="./includes/header.jsp" flush="true"/>
  	<div id="fullpage">
		
		<div class="section prediction">
    <div class="container">
        <h2>온실가스 배출량 예측 서비스</h2>
        <div class="prediction-items">
            <!-- 3D Plotly 그래프를 포함하는 iframe -->
            <div id="plotly-container" class="item fade-in">
                <iframe src="${pageContext.request.contextPath}/plotly_graph.html" 
                        width="100%" height="600px" frameborder="0"></iframe>
            </div>
		            <!-- 기존 내용들 
		            <div class="item fade-in">
		                <h3>에너지 안보</h3>
		                <p>지속 가능한 에너지 안보</p>
		            </div>
		            <div class="item fade-in">
		                <h3>에너지 소비량</h3>
		                <p>효율적인 에너지 소비량 증가</p>
		            </div>
		            <div class="item fade-in">
		                <h3>전기차 보급률</h3>
		                <p>전기차 보급률로 인한 수요 증가</p>
		            </div> 
		            <div class="item fade-in">
		                <h3>이상기후현상 증가</h3>
		                <p>이상기후로 인한 기후변화의 영향</p>
		            </div>
		            -->
		        </div>
		    </div>
		</div>

		
        <div class="section calculator">
    <div class="container">
        <h2>온실가스 배출량 계산기</h2>
        <div class="calculator-items">
            <div class="input-group">
                <label for="coal">석탄</label>
                <input type="text" id="coal" placeholder="0">
                <span>kg</span>
            </div>
            <div class="input-group">
                <label for="oil">석유</label>
                <input type="text" id="oil" placeholder="0">
                <span>kg</span>
            </div>
            <div class="input-group">
                <label for="lng">LNG</label>
                <input type="text" id="lng" placeholder="0">
                <span>kg</span>
            </div>
            <div class="input-group">
                <label for="nuclear">원자력</label>
                <input type="text" id="nuclear" placeholder="0">
                <span>kg</span>
            </div>
            <div class="input-group">
                <label for="renewable">신재생</label>
                <input type="text" id="renewable" placeholder="0">
                <span>kg</span>
            </div>
            <div class="result">
                <h3>결과:</h3>
                <span id="result"></span> MWh
            </div>
        </div>
    </div>
</div>

        
        <div class="section reference">
    <div class="container">
        <h2>레퍼런스 소개</h2>
        <div class="reference-items">
            <div class="row">
            	<a href="https://michalsnik.github.io/aos/" target="_blank">
	                <div class="item fade-in">
	                    <h3>디자인 참조1</h3>
	                    <p>AOS</p>
	                </div>
	             </a>
                <div class="item fade-in">
                    <h3>참조 2</h3>
                    <p>블라블라</p>
                </div>
                <div class="item fade-in">
                    <h3>참조 3</h3>
                    <p>블라블라</p>
                </div>
            </div>
            <div class="row">
                <div class="item fade-in">
                    <h3>참조 4</h3>
                    <p>블라블라</p>
                </div>
                <div class="item fade-in">
                    <h3>참조 5</h3>
                    <p>블라블라</p>
                </div>
                <div class="item fade-in">
                    <h3>참조 6</h3>
                    <p>블라블라</p>
                </div>
            </div>
            <div class="row">
                <div class="item fade-in">
                    <h3>참조 7</h3>
                    <p>블라블라</p>
                </div>
                <div class="item fade-in">
                    <h3>참조 8</h3>
                    <p>블라블라</p>
                </div>
                <div class="item fade-in">
                    <h3>참조 9</h3>
                    <p>블라블라</p>
                </div>
            </div>
        </div>
    </div>
</div>

        
   </div>
    <jsp:include page ="./includes/footer.jsp" flush="true"/>
</body>
</html>
