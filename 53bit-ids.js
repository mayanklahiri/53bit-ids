var generated = {};
var collisions = 0;

const startTime = Date.now();

for (var i = 0; i < 100000000; i++) {
  var key = Math.floor(Math.random() * Number.MAX_SAFE_INTEGER);
  if (key in generated) {
    collisions++;
  } else {
    generated[key] = 1;
  }
  if (i % 1000000 === 0) {
    const timeDelta = Date.now() - startTime;
    console.log(timeDelta, i, collisions);
  }
}
