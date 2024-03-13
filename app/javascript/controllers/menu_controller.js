import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [ "items" ];

  open() {
    if (this.hasItemsTarget) {
        // Agregar la clase "block" para mostrar el elemento
        this.itemsTarget.classList.add('block');
        // Eliminar la clase "hidden" para mostrar el elemento
        this.itemsTarget.classList.remove('hidden');
      }
  }

  close() {
    this.itemsTarget.classList.add('hidden');
    this.itemsTarget.classList.remove('block');
  }
}
