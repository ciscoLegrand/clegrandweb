import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "output", "radio"]

  connect() {
    console.log("FlagCommandController connected!")
    this.updateOutput();  // Llama a updateOutput en la conexión para establecer el comando inicial
  }

  updateOutput() {
    const appName = this.getAppName();
    const command = this.getPresetsCommand();
    this.outputTarget.innerHTML = `
      <span class='text-green-400'>$ </span>
      <span class='text-blue-400'>rails new</span> 
      <span class='text-red-400'>${appName} </span>
      <span class='text-yellow-700'> ${command}</span>
    ` 
  }

  getAppName() {
    return this.inputTarget.value;
  }

  getPresetsCommand() {
    let command;
    const selectedFlag = this.getSelectedFlag();
    console.log('selectedFlag: ', selectedFlag  )
    switch (selectedFlag) {
      case 'none':
        command = "--database=sqlite3 --skip-git --skip-keeps --skip-bootsnap --skip-bundle --skip-asset-pipeline --skip-javascript --skip-action-cable --skip-active-job --skip-action-mailbox --skip-action-mailer --skip-active-record --skip-active-storage --skip-action-text --skip-hotwire --skip-jbuilder --skip-test --skip-system-test";
        break;
      case 'api':
        command = "--api --database=sqlite3 --skip-git --skip-keeps --skip-bootsnap --skip-bundle --skip-asset-pipeline --skip-javascript --skip-action-cable --skip-active-job --skip-action-mailbox --skip-action-mailer --skip-active-record --skip-active-storage --skip-action-text --skip-hotwire --skip-jbuilder --skip-test --skip-system-test";
        break;
      case 'minimal':
        command = "--minimal --database=sqlite3 --skip-git --skip-keeps --skip-bootsnap --skip-bundle --skip-asset-pipeline --skip-javascript --skip-action-cable --skip-active-job --skip-action-mailbox --skip-action-mailer --skip-active-record --skip-active-storage --skip-action-text --skip-hotwire --skip-jbuilder --skip-test --skip-system-test";
        break;
      default:
        command = "";
    }
    return command;
  }

  getSelectedFlag() {
    console.log('radioTargets: ', this.radioTargets);  // Agrega esta línea
    const selectedRadio = this.radioTargets.find(radio => radio.checked);
    console.log('selectedRadio: ', selectedRadio);
    return selectedRadio ? selectedRadio.value : '';
  }
}
