document.addEventListener('DOMContentLoaded', function() {

    const allItems = document.querySelectorAll('.item');
    allItems.forEach(item => {
        const animation = item.dataset.animation || 'fade-up';
        item.style.opacity = '0';
        item.style.transform = getInitialTransform(animation);
        item.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
    });

    new fullpage('#fullpage', {
    licenseKey: 'gplv3-license',
    autoScrolling: true,
    navigation: true,
    navigationPosition: 'right',
    controlArrows: false,
    anchors: ['hero', 'intention', 'introduce', 'effect', 'teamMember'],
    verticalCentered: true,  // 섹션 내용을 수직 중앙 정렬
    scrollOverflow: false,
    fitToSection: false,
    responsiveHeight: 600,
    afterRender: function() {
        // 초기 로드 시 첫 번째 섹션 중앙 정렬
        this.setAllowScrolling(false);
        setTimeout(() => this.setAllowScrolling(true), 1000);
    },
    afterLoad: function(origin, destination, direction){
        animateItems(destination.item);
        resetItems(origin.item);
    },
        afterRender: initializeCarousel
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