import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["firstLevel", "secondLevel"];

  connect() {
    this.loadSecondLevelOptions();
  }

  loadSecondLevelOptions() {
    const selectedCommand = this.firstLevelTarget.value;
    fetch(`/docker.json?command=${selectedCommand}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    })
    .then(response => response.json())
    .then(data => {
      const secondLevelOptions = data.second_level || [];
      const options = secondLevelOptions.map(option => {
        return `<option value="${option.value}">${option.value}</option>`;
      }).join('');
      this.secondLevelTarget.innerHTML = options;
      this.secondLevelTarget.classList.remove('hidden');
    });
  }

  handleFirstLevelChange() {
    this.loadSecondLevelOptions();
  }
}
