import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="badge"
export default class extends Controller {
  static targets = ["badge", "badgewrapper"]

  connect() {
    console.log("coucou")

    // VANILLA
  // const el = document.querySelector(".badge");
  // const wrap = document.querySelector(".badge__wrapper");
//   let w = this.badgeTarget.clientWidth;
//   let h = this.badgeTarget.clientHeight;
//   let b = this.badgeTarget.getBoundingClientRect();
//   el.addEventListener("mousemove", (e) => {
//     let X = (e.clientX - b.left) / w;
//     let Y = (e.clientY - b.top) / h;

//     let rX = -(X - 0.5) * 26;
//     let rY = (Y - 0.5) * 26;

//     let bgX = 40 + 20 * X;
//     let bgY = 40 + 20 * Y;

//     console.log(X, Y);
//     document.documentElement.style.setProperty("--x", 100 * X + "%");
//     document.documentElement.style.setProperty("--y", 100 * Y + "%");

//     document.documentElement.style.setProperty("--bg-x", bgX + "%");
//     document.documentElement.style.setProperty("--bg-y", bgY + "%");

//     document.documentElement.style.setProperty("--r-x", rX + "deg");
//     document.documentElement.style.setProperty("--r-y", rY + "deg");
// });

  }

  mousemove(e){
    console.log("bonjour")
    let w = this.badgeTarget.clientWidth;
    let h = this.badgeTarget.clientHeight;
    let b = this.badgeTarget.getBoundingClientRect();

    let X = (e.clientX - b.left) / w;
    let Y = (e.clientY - b.top) / h;

    let rX = -(X - 0.5) * 26;
    let rY = (Y - 0.5) * 26;

    let bgX = 40 + 20 * X;
    let bgY = 40 + 20 * Y;

    console.log(X, Y);
    document.documentElement.style.setProperty("--x", 100 * X + "%");
    document.documentElement.style.setProperty("--y", 100 * Y + "%");

    document.documentElement.style.setProperty("--bg-x", bgX + "%");
    document.documentElement.style.setProperty("--bg-y", bgY + "%");

    document.documentElement.style.setProperty("--r-x", rX + "deg");
    document.documentElement.style.setProperty("--r-y", rY + "deg");
  }
}
