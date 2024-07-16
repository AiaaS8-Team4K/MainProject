document.addEventListener('DOMContentLoaded', function() {
    
    new fullpage('#fullpage', {
    licenseKey: 'gplv3-license',
    autoScrolling: true,
    navigation: true,
    navigationPosition: 'right',
    controlArrows: false,
    anchors: ['hero', 'philosophy', 'history', 'partners', 'location'],
    verticalCentered: true,  // 섹션 내용을 수직 중앙 정렬
    scrollOverflow: false,
    fitToSection: false,
    responsiveHeight: 600,
    afterRender: function() {
        // 초기 로드 시 첫 번째 섹션 중앙 정렬
        this.setAllowScrolling(false);
        setTimeout(() => this.setAllowScrolling(true), 1000);
    },
    onLeave: function(origin, destination, direction) {
        // 섹션 전환 시 애니메이션 효과
        origin.item.style.opacity = 0;
        destination.item.style.opacity = 1;
    },
    afterLoad: function(origin, destination, direction) {
        // 섹션 로드 완료 후 처리
        destination.item.style.opacity = 1;
    },
        afterRender: initializeCarousel
    });
    
	console.log("fullPage initialized");

    function initializeCarousel() {
        const carousel = document.querySelector('.carousel');
        const images = carousel.querySelectorAll('img');
        const heroText1 = carousel.querySelector('.hero-text h1');
        const heroText2 = carousel.querySelector('.hero-text h3');
        const prevBtn = document.querySelector('.prev');
        const nextBtn = document.querySelector('.next');
        let currentIndex = 0;

        function showImage(index) {
            images.forEach(img => img.classList.remove('active'));
            images[index].classList.add('active');
            heroText1.textContent = images[index].getAttribute('dataText1');
            heroText2.textContent = images[index].getAttribute('dataText2');
        }

        function nextImage() {
            currentIndex = (currentIndex + 1) % images.length;
            showImage(currentIndex);
        }

        function prevImage() {
            currentIndex = (currentIndex - 1 + images.length) % images.length;
            showImage(currentIndex);
        }

        if (prevBtn && nextBtn) {
            nextBtn.addEventListener('click', nextImage);
            prevBtn.addEventListener('click', prevImage);
        }

        // Auto-play
        setInterval(nextImage, 5000);
    }
});