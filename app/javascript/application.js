// app/javascript/application.js

import { Application } from "@hotwired/stimulus";
import "@hotwired/turbo-rails";
import "controllers";
import flatpickr from "flatpickr";  // Import flatpickr directly via Importmap
import "flatpickr/dist/flatpickr.css";  // Import flatpickr's CSS

// Initialize Stimulus
const application = Application.start();
application.debug = false;
window.Stimulus = application;

export { application };

// Flatpickr Initialization
document.addEventListener("DOMContentLoaded", function () {
  console.log("Flatpickr initializing..."); // Debugging line
  flatpickr(".flatpickr-input", {
    enableTime: true,  // Enable time selection
    dateFormat: "Y-m-d H:i",  // Date and time format
    minuteIncrement: 30,  // Only allow 30-minute increments
    time_24hr: true,  // 24-hour format for time
  });
});
