class Diary {

  final int _year;
  final int _month;
  final int _day;

  Diary() : _year = DateTime.now().year, _month = DateTime.now().month, _day = DateTime.now().day;

  int get day => _day;

  int get month => _month;

  int get year => _year;
}