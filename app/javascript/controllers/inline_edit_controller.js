import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["form", "view"];

  toggle() {
    this.viewTarget.classList.toggle("hidden");
    this.formTarget.classList.toggle("hidden");
  }
}
