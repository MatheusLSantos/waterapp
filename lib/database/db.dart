import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB{
  DB._();
  static final DB instance = DB._();
  static DB? _database;
  
  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'database'),
      version: 1,
      onCreate: _onCreate
    );
  }

  _onCreate(db, version) async {
    await db.execute(_waterIntake);
    await db.execute(_diary);
  }

  String get _waterIntake => '''
    CREATE TABLE waterIntakes (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      waterIntakeVolume REAL NOT NULL,
      createdAt TEXT NOT NULL,
      diary INTEGER NOT NULL,
      FOREIGN KEY (diary) REFERENCES diarys (id)
    );
  ''';

  String get _diary => '''
  CREATE TABLE diarys (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    year INTEGER NOT NULL,
    month INTEGER NOT NULL,
    day INTEGER NOT NULL
  )
  ''';
}