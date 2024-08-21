document.addEventListener('DOMContentLoaded', function() {

    const allItems = document.querySelectorAll('.item');
    allItems.forEach(item => {
        const animation = item.dataset.animation || 'fade-up';
        item.style.opacity = '0';
        item.style.transform = getInitialTransform(animation);
        item.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
    });

    // fullPage.js 초기화
    let fullpageInstance;
    fullpageInstance = new fullpage('#fullpage', {
        licenseKey: 'gplv3-license',
        autoScrolling: true,
        navigation: true,
        navigationPosition: 'right',
        controlArrows: false,
        anchors: ['prediction','sectionName', 'calculator', 'reference'],
        verticalCentered: true,
        scrollOverflow: false,
        fitToSection: false,
        responsiveHeight: 600,
        afterRender: function() {
            setTimeout(() => fullpageInstance.setAutoScrolling(true), 1000);

            initThreeJS();
        },
        afterLoad: function(origin, destination, direction){
            animateItems(destination.item);
            resetItems(origin.item);
        }
    });

    function animateItems(section) {
        const items = section.querySelectorAll('.item');
        items.forEach((item, index) => {
            setTimeout(() => {
                item.style.opacity = '1';
                item.style.transform = 'translate(0, 0)';
            }, index * 100);
        });
    }

    function resetItems(section) {
        const items = section.querySelectorAll('.item');
        items.forEach(item => {
            const animation = item.dataset.animation || 'fade-up';
            item.style.opacity = '0';
            item.style.transform = getInitialTransform(animation);
        });
    }

    function getInitialTransform(animation) {
        switch (animation) {
            case 'fade-up':
                return 'translateY(20vh)';
            case 'fade-down':
                return 'translateY(-20vh)';
            case 'fade-left':
                return 'translateX(20vw)';
            case 'fade-right':
                return 'translateX(-20vw)';
            default:
                return 'translateY(20vh)';
        }
    }

    // Three.js 초기화 함수
    function initThreeJS() {
        const container = document.getElementById('threejs-container');
        if (!container) return;

        const scene = new THREE.Scene();
        const camera = new THREE.PerspectiveCamera(75, container.clientWidth / container.clientHeight, 0.1, 1000);
        const renderer = new THREE.WebGLRenderer({ canvas: document.getElementById('threejs-canvas') });

        renderer.setSize(container.clientWidth, container.clientHeight);
        renderer.setPixelRatio(window.devicePixelRatio);

        // 배경색 설정
 scene.background = new THREE.Color(0x87CEEB); // 하늘색 배경

        // 안개 효과 추가
        scene.fog = new THREE.FogExp2(0x87CEEB, 0.1); // 하늘색과 같은 색상으로 안개 설정, 밀도 낮춤

        // 구체 메쉬 제거 (기본적으로 화면에 표시될 요소 없음)

        // 카메라 위치 설정
        camera.position.z = 10;

        function animate() {
            requestAnimationFrame(animate);
            renderer.render(scene, camera);
        }

        animate();

        // 리사이즈 처리
        window.addEventListener('resize', () => {
            const width = container.clientWidth;
            const height = container.clientHeight;
            renderer.setSize(width, height);
            camera.aspect = width / height;
            camera.updateProjectionMatrix();
        });

        if (fullpageInstance) {
            fullpageInstance.on('afterLoad', function(origin, destination, direction){
                if (destination.index === fullpageInstance.getActiveSection().index) {
                    const width = container.clientWidth;
                    const height = container.clientHeight;
                    renderer.setSize(width, height);
                    camera.aspect = width / height;
                    camera.updateProjectionMatrix();
                }
            });
        }
    }

    // 에너지원당 온실가스 배출량 상수 (kg/MWh)
    const emissionFactors = {
        coal: 72531,
        oil: 118047,
        lng: 59873,
        nuclear: 33657,
        renewable: 21769
    };

    // 온실가스 배출량 계산기 초기화
    function calculateEmissions() {
        console.log("calculateEmissions 함수가 호출되었습니다."); // 함수 호출 확인
        const coal = parseFloat(document.getElementById('coal').value) || 0;
        const oil = parseFloat(document.getElementById('oil').value) || 0;
        const lng = parseFloat(document.getElementById('lng').value) || 0;
        const nuclear = parseFloat(document.getElementById('nuclear').value) || 0;
        const renewable = parseFloat(document.getElementById('renewable').value) || 0;

        // 각 에너지원 사용량에 대해 MWh로 환산하여 총 배출량 계산
        const totalEmissionsMWh = 
            (coal * 72531) + 
            (oil * 118047) + 
            (lng * 59873) + 
            (nuclear * 33657) + 
            (renewable * 21769);

        console.log("계산된 총 배출량 (MWh):", totalEmissionsMWh); // 계산 결과 확인

        // result의 초기값을 비워두고, 값이 있을 때만 출력
        if (totalEmissionsMWh > 0) {
            document.getElementById('result').innerText = totalEmissionsMWh.toFixed(2);
        } else {
            document.getElementById('result').innerText = '';
        }
    }

    // 각 input 요소에 이벤트 리스너를 추가
    document.querySelectorAll('.calculator-items input').forEach(input => {
        input.addEventListener('input', calculateEmissions);
    });

});
