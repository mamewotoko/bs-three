#! /bin/sh
# dummy_new: to call OrbitControls
bsb -make-world && sed -ie 's/\.dummy_new//' src/main.bs.js && browserify src/main.bs.js > src/main.browser.js
