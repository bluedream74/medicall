import { Controller } from 'stimulus';

export default class extends Controller {
  addSchedule(event) {
    event.preventDefault();
    const schedulesElement = document.querySelector('#schedules');
    const content = schedulesElement.dataset.template;
    schedulesElement.insertAdjacentHTML('beforeend', content);
  }
}
