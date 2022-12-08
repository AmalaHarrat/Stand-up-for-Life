import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["life ", "animals", "people","our planet","life"],
      typeSpeed: 30,
      showCursor: false
      // loop: true
    })
  }
}
