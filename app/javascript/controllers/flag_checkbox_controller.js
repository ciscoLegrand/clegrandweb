import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["output", "checkbox", "flag"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  change(e) {
    e.preventDefault()
    this.flagTarget.classList.toggle('hidden')
    this.flagTarget.innerHTML = 'Flagged changed!!'
    console.log('Flag changed!!')
  }

}
