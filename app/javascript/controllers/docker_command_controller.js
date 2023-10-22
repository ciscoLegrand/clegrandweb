import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ["firstLevel", "secondLevel", "bash", "explanation"];

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
        return `<option value="${option.value}">${option.description}</option>`;
      }).join('');
      this.secondLevelTarget.innerHTML = options;
      this.secondLevelTarget.classList.remove('hidden');
    });
  }

  handleFirstLevelChange() {
    this.loadSecondLevelOptions();
  }

  handleSecondLevelChange() {
    const selectedCommand = this.firstLevelTarget.value;
    const selectedFlag = this.secondLevelTarget.value;
    fetch(`/docker.json?command=${selectedCommand}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      }
    })
    .then(response => response.json())
    .then(data => {
      const secondLevelOption = data.second_level.find(option => option.value === selectedFlag);
      if(secondLevelOption) {
        let index = 0;
        const text = secondLevelOption.usage;
        this.bashTarget.innerHTML = `
          <span class="text-green-500">$</span> 
          <span class="text-pink-500" data-clipboard-target="source"></span><br>
        `;
        
        const spanElement = this.bashTarget.querySelector('[data-clipboard-target="source"]');
        
        const intervalId = setInterval(() => {
          // Aquí agregamos el cursor al final de la cadena que estamos escribiendo.
          spanElement.innerHTML = text.slice(0, index) + '<span class="text-pink-400 animate-pulse ml-2">|</span>';
          index += 1;
          if (index === text.length) {
            clearInterval(intervalId);
            // Una vez que todos los caracteres han sido escritos, eliminamos el cursor.
            spanElement.innerHTML = text;
  
            this.explanationTarget.classList.remove('hidden');
            this.explanationTarget.innerHTML =`
              <div class="flex flex-col gap-8 px-8">
                <span class="text-slate-200">Value: ${secondLevelOption.value}</span>
                <span class="text-slate-200">Flag: ${secondLevelOption.flag}</span>
                <span class="text-slate-200">${secondLevelOption.description}</span>
                <span class="text-slate-200">Usage: ${secondLevelOption.usage}</span>
                <span class="text-slate-200 text-2xl">${secondLevelOption.result}</span>
              </div>
            `;
          }
        }, 50);
      }
    });
  }
  
}
