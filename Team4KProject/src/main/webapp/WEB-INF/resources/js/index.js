document.addEventListener('DOMContentLoaded', function() {
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
});