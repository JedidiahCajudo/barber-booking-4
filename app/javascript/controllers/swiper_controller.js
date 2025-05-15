import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.swiper = new window.Swiper(this.containerTarget, {
      slidesPerView: 4,
      spaceBetween: 20,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      loop: true,
      freeMode: true, // Makes the scrolling feel like free scroll
      allowTouchMove: true,  // Touch move enabled
      touchMoveStopPropagation: true,  // Prevent touch events from stopping propagation
      touchRatio: 1,  // Adjust swipe sensitivity (try 1 or 0.5)
      grabCursor: false, // Disable grab cursor for swipe interaction
      mousewheel: true,  // Enable mousewheel scroll
      centeredSlides: true,  // Keep the slides centered
      speed: 800,
    });
    console.log('Swiper initialized');
  }
}
