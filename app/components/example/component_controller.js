import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['hello'];

  connect() {
    const cssValue = window.getComputedStyle(this.helloTarget, ':after').getPropertyValue('content');
    this.helloTarget.classList = '';
    this.helloTarget.innerText += ` ${cssValue} JS works!`;
  }
}
