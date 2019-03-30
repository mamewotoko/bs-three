// Generated by BUCKLESCRIPT VERSION 4.0.18, PLEASE EDIT WITH CARE
'use strict';

var Three = require("three");
var Caml_format = require("bs-platform/lib/js/caml_format.js");

console.log("Three.js BuckleScript binding r1");

var partial_arg = document;

function createDiv(param) {
  return partial_arg.createElement("div");
}

var mainDiv = document.getElementById("main");

var newDiv = createDiv(/* () */0);

var ratio = window.innerWidth / window.innerHeight;

var scene = new Three.Scene();

var camera = new Three.PerspectiveCamera(45.0, ratio, 1.0, 1000.0);

var renderer = new Three.WebGLRenderer();

renderer.setSize(window.innerWidth, window.innerHeight);

mainDiv.appendChild(renderer.domElement);

var geometry = new Three.BoxGeometry(1, 1, 1);

var material = new Three.MeshBasicMaterial({
      color: Caml_format.caml_int_of_string("0x00ff00")
    });

var cube = new Three.Mesh(geometry, material);

var v = {
  x: 0,
  y: 32,
  z: 0
};

var vv = new Three.Vector3(0, 1, 0);

scene.add(cube);

cube.rotation.x = 10.0;

camera.position.z = 5.0;

function render(renderer, t) {
  cube.setRotationFromAxisAngle(vv, t);
  return renderer.render(scene, camera);
}

var angle = /* record */[/* contents */0.0];

function animate(timestamp) {
  render(renderer, angle[0]);
  angle[0] = (angle[0] + 0.05) % 3.141;
  window.requestAnimationFrame(animate);
  return /* () */0;
}

animate(0.0);

exports.createDiv = createDiv;
exports.mainDiv = mainDiv;
exports.newDiv = newDiv;
exports.ratio = ratio;
exports.scene = scene;
exports.camera = camera;
exports.renderer = renderer;
exports.geometry = geometry;
exports.material = material;
exports.cube = cube;
exports.v = v;
exports.vv = vv;
exports.render = render;
exports.angle = angle;
exports.animate = animate;
/*  Not a pure module */
