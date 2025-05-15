import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    console.log("Swiper controller connected, element:", this.element)

    this.swiper = new window.Swiper(this.containerTarget, {
      slidesPerView: 4,
      spaceBetween: 20,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      loop: false,
      allowTouchMove: true,
      breakpoints: {
        768: { slidesPerView: 1 },
        1024: { slidesPerView: 2 },
        1440: { slidesPerView: 4 }
      }
    })

    console.log("Swiper instance:", this.swiper)
  }
}
