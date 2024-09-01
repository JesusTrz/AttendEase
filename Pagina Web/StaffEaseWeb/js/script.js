let currentIndex = 0;

const slides = document.querySelector('.slides');
const images = document.querySelectorAll('.slides img');
const totalSlides = images.length;

function showSlide(index) {
    slides.style.transform = `translateX(${-index * 100}%)`;
}

function nextSlide() {
    currentIndex = (currentIndex === totalSlides - 1) ? 0 : currentIndex + 1;
    showSlide(currentIndex);
}

setInterval(nextSlide, 3000); // Cambia la imagen cada 3 segundos
