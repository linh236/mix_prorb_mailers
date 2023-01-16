import RequestController from './request_controller';

// Connects to data-controller="template"
export default class extends RequestController {
  static targets = ["template"]

  connect() {
  }

  update(event) {
    if (event.preventDefault) {
      event.preventDefault();
    }
    const url = event.target.dataset.url;
    let is_template = event.target.dataset.template;
    this.sendPostUpdate({url: url, method: 'Put', body: {is_template: is_template}})
  }
}
