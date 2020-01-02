#! /bin/sh
# replace "dummy_new" to call OrbitControls
mkdir -p js && $(npm bin)/bsb -make-world && $(npm bin)/browserify src/main.bs.js > js/main.browser.js
