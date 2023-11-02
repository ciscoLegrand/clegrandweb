import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['dockerList']
  connect() {
    console.log('toogle connected!')
  }

  hidden() {
    console.log('hidden')
    this.dockerListTarget.classList.toggle('hidden')
  }
}