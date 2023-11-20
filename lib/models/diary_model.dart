class Diary {

  final int id;
  final int year;
  final int month;
  final int day;

  Diary({this.id = 0,required this.year,required this.month,required this.day});

  Map<String, dynamic> toMap() {
    return {
      'year': year,
      'month': month,
      'day': day
    };
  }
}