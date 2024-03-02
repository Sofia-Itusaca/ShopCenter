import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        setTimeout(() => {
            this.element.style.display = 'none';
        }, 3000);
    }
}