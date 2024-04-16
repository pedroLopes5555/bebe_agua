class Day {
  int _waterDrunk = 0;
  DateTime _date = DateTime.now(); // Initialize _date here
  double _meta = 92.0;

  // Constructor
  Day(int waterDrunk, DateTime date) {
    _waterDrunk = waterDrunk;
    _date = date;
  }

  // Getters for private fields
  int get waterDrunk => _waterDrunk;
  DateTime get date => _date;
  double get meta => _meta;

  // Setters for private fields
  set waterDrunk(int value) {
    _waterDrunk = value;
  }

  set date(DateTime value) {
    _date = value;
  }

  set meta(double value) {
    _meta = value;
  }

  void addWater(int quantity) => waterDrunk += quantity;

  double progressValue() => _waterDrunk / meta;
}
