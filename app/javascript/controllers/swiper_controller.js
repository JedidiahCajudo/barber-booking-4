import { Controller } from "@hotwired/stimulus"
import Swiper, { Navigation } from "swiper"
import "swiper/css"
import "swiper/css/navigation"

// Register Swiper modules you want to use
Swiper.use([Navigation])

export default class extends Controller {
  connect() {
    this.swiper = new Swiper(this.element, {
      slidesPerView: 4,
      spaceBetween: 20,
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      loop: false,
      watchOverflow: true,
      allowTouchMove: true,
      breakpoints: {
        // Mobile - 1 per view
        0: {
          slidesPerView: 1,
        },
        // Tablet - 2 per view
        768: {
          slidesPerView: 2,
        },
        // Desktop - 4 per view
        1440: {
          slidesPerView: 4,
        },
      },
    })
  }
}
