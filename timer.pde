class Timer {

  int counter = 0;


  Timer(int c) {
    this.counter = c;
  }


  // Starting the timer
  void start() {
    this.counter++;
  }

  void reset() {
    counter = 0;
  }

}

