import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["source", "button"];

  copyToClipboard() {
    const text = this.sourceTarget.innerText.replace(/^\$\s*/, '');
    navigator.clipboard.writeText(text).then(() => {
      console.log('Texto copiado al portapapeles:', text);
      this.showNotification("Texto copiado al portapapeles");
      this.buttonTarget.textContent = "✅ Copiado!"; 
      setTimeout(() => {
        this.buttonTarget.textContent = "📋 Copiar";
      }, 2000);
    }).catch(err => {
      console.error('Error al copiar el texto: ', err);
    });
  }
  showNotification(message) {
    const notification = document.createElement('div');
    notification.className = 'fixed bottom-4 right-4 bg-green-500 text-white p-4 rounded shadow-lg';
    notification.innerText = message;

    document.body.appendChild(notification);

    setTimeout(() => {
      notification.remove();
    }, 2000);
  }
}
