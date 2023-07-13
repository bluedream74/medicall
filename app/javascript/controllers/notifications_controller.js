import { Notification } from "@hotwired/stimulus"

export default class extends Notification {
  connect() {
    super.connect()
    console.log('Do what you want here.')
  }
}

