// app/javascript/application.js

import { Application } from "@hotwired/stimulus";
import "@hotwired/turbo-rails";
import "controllers";

// Initialize Stimulus
const application = Application.start();
application.debug = false;
window.Stimulus = application;

export { application };
