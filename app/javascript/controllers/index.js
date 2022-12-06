// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import MapController from "./map_controller"
application.register("map", MapController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

const el = document.querySelector(".badge");
const wrap = document.querySelector(".badge__wrapper");
let w = el.clientWidth;
let h = el.clientHeight;
let b = el.getBoundingClientRect();
el.addEventListener("mousemove", (e) => {
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
});

