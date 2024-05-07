import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LOTRDatabse{

  Database? _database;


  Future<void> init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'lort.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE Regist (
            Id INTEGER PRIMARY KEY,
            WatterDrunk REAL,
            Date TEXT
          );
        ''');
      },
      version: 1,
    );
  }
}