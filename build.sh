#! /bin/sh
# npm run build && sed -i -e 's/((\(.*\)));/\1/' -e 's/^make_ring/var obj = make_ring/' src/main.bs.js && browserify src/main.bs.js > src/m.js
# dummy_new: to call OrbitControls
npm run build && sed -ie 's/\.dummy_new//' src/main.bs.js && browserify src/main.bs.js > src/m.js
