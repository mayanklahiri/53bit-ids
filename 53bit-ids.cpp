#include <chrono>
#include <iostream>
#include <random>
#include <map>

using namespace std;
using namespace std::chrono;


int main(int argc, char **argv) {
  std::random_device rd;
  std::default_random_engine gen(rd());
  std::uniform_int_distribution<unsigned long long> random(0, 9007199254740991);

  map<unsigned long long, int> generated;
  int collisions = 0;

  high_resolution_clock::time_point t0 = high_resolution_clock::now();

  for (unsigned long i = 0; i < 100000000; i++) {
    unsigned long n = random(gen);
    if (generated.find(n) != generated.end()) {
      collisions++;
    } else {
      generated[n] = 1;
    }
    if (i % 1000000 == 0) {
      high_resolution_clock::time_point t1 = high_resolution_clock::now();
      duration<double, std::milli> time_delta = t1 - t0;
      cout << static_cast<int>(time_delta.count()) << " " << i << " " << collisions << endl;
    }
  }

  return 0;
}
