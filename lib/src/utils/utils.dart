class Utils {
  
  // - getCurrentEpoch

  static int getCurrentEpoch() {
    DateTime now = DateTime.now();
    int epoch = now.millisecondsSinceEpoch ~/ 1000;
    return epoch;
  }
}
