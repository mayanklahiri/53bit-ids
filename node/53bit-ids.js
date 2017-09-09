// Associative array and collision counter.
const generated = {};
var collisions = 0;
var sizeGenerated = 0;

// Experiment start time.
const startTime = Date.now();

// Run experiment
console.log('time size collisions');
while(true) {
  const n = Math.floor(Math.random() * Number.MAX_SAFE_INTEGER);
  if (generated[n]) {
    collisions++;
  } else {
    generated[n] = 1;
    sizeGenerated++;
  }
  if (sizeGenerated % 100000 === 0) {
    const timeDelta = Date.now() - startTime;
    console.log(timeDelta, sizeGenerated, collisions);
  }
}
