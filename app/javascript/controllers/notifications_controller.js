import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="notifications"
export default class extends Controller {
  connect() {
    this.element.style.display = 'none'
  }

  show(event) {
    this.element.style.display = 'block'
    this.element.textContent = event.detail.message

    setTimeout(() => {
      this.element.style.display = 'none'
    }, 5000)
  }
}
