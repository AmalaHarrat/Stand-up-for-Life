import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="score-animation"
export default class extends Controller {
  static values = {
    scoring: Number
  }
  static targets = ["circle"]

  connect() {
    // console.log(this.scoringValue);
    // console.log(this.scoringValue);
    setTimeout(this.increase(), 1000)
    // console.log(counter  this.scoringValue);

  }

  increase() {
    let counter = 0

    while (counter <= this.scoringValue){
      console.log("test")
      this.circleTarget.setAttribute("stroke-dashoffset", counter)
      // setTimeout(() => {counter++},50);
      counter++
      console.log(this.circleTarget.getAttribute("stroke-dashoffset"))
      console.log(counter)
    }
  }
}
