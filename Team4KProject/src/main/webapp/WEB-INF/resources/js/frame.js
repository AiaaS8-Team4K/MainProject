document.addEventListener('DOMContentLoaded', function() {

    const allItems = document.querySelectorAll('.item');
    allItems.forEach(item => {
        const animation = item.dataset.animation || 'fade-up';
        item.style.opacity = '0';
        item.style.transform = getInitialTransform(animation);
        item.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
    });

    // fullPage.js 초기화
	new fullpage('#fullpage', {
        licenseKey: 'gplv3-license',
        autoScrolling: true,
        navigation: true,
        navigationPosition: 'right',
        controlArrows: false,
        anchors: ['prediction','sectionName', 'reference'],
        verticalCentered: true,
        scrollOverflow: false,
        fitToSection: false,
        responsiveHeight: 600,
        afterRender: function() {
            setTimeout(() => fullpage_api.setAutoScrolling(true), 1000); // 스크롤을 다시 활성화합니다.

            // Three.js 초기화 호출
            initThreeJS(); // 이 부분에서 Three.js를 초기화합니다.
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
                return 'translateY(20vh)'; // 기본값은 fade-up
        }
    }

    // Three.js 초기화 함수
    function initThreeJS() {
        const container = document.getElementById('threejs-container');
        if (!container) return; // Three.js 컨테이너가 없는 경우 종료

        const scene = new THREE.Scene();
        
        // 배경색 설정
        scene.background = new THREE.Color(0xffffff);

        const camera = new THREE.PerspectiveCamera(75, container.clientWidth / container.clientHeight, 0.1, 1000);
        const renderer = new THREE.WebGLRenderer({ canvas: document.getElementById('threejs-canvas') });

        renderer.setSize(container.clientWidth, container.clientHeight);
        renderer.setPixelRatio(window.devicePixelRatio);

        // 큐브 생성 - 표면
        const geometry = new THREE.BoxGeometry(3, 3, 3);
        const material = new THREE.MeshBasicMaterial({ color: 0xff69b4 }); // 표면 색상을 핫핑크로 설정
        const cube = new THREE.Mesh(geometry, material);
        scene.add(cube);
        
        // 큐브의 모서리 생성
        const edges = new THREE.EdgesGeometry(geometry); // 큐브의 모서리만 추출
        const edgeMaterial = new THREE.LineBasicMaterial({ color: 0x99ff99 }); // 모서리 색상 설정 (연한 녹색)
        const lineSegments = new THREE.LineSegments(edges, edgeMaterial);
        scene.add(lineSegments);
        
        // 카메라 위치 설정
        camera.position.z = 5;
        
        // OrbitControls 추가
        const controls = new THREE.OrbitControls(camera, renderer.domElement);
        controls.enableDamping = true; // 감속 효과 추가
        controls.dampingFactor = 0.05;
        controls.rotateSpeed = 0.1;
        
        // 애니메이션 함수
        function animate() {
            requestAnimationFrame(animate);
            controls.update(); // 컨트롤 업데이트
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

        // fullPage.js와의 호환성 - 섹션 변경 시 렌더러 크기 업데이트
        fullpage_api.on('afterLoad', function(origin, destination, direction){
            if (destination.index === fullpage_api.getActiveSection().index) {
                const width = container.clientWidth;
                const height = container.clientHeight;
                renderer.setSize(width, height);
                camera.aspect = width / height;
                camera.updateProjectionMatrix();
            }
        });
    }
});
