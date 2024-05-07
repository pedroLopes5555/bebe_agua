import 'package:bebe_agua/models/regist.dart';
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
          Id INTEGER PRIMARY KEY AUTOINCREMENT,
          WaterDrunk REAL,
          Date TEXT
        );
      ''');

        // Insert 5 test values into the database
        await _insertTestValues(db);
      },
      version: 1,
    );
  }
  Future<void> _insertTestValues(Database db) async {
    // Create test Regist instances
    final testRegists = [
      Regist(waterDrunk: 10, date: DateTime(2024, 5, 1)),
      Regist(waterDrunk: 20, date: DateTime(2024, 5, 2)),
      Regist(waterDrunk: 15, date: DateTime(2024, 5, 3)),
      Regist(waterDrunk: 25, date: DateTime(2024, 5, 4)),
      Regist(waterDrunk: 30, date: DateTime(2024, 5, 5)),
    ];

    // Insert test Regist instances into the database
    for (final regist in testRegists) {
      await db.insert(
        'Regist',
        regist.toDB(),
      );
    }
  }





  Future<List<Regist>> getAllRegists() async{
    if(_database == null) {
      throw Exception('data base not inivtialized');
    }
    List result = await _database!.rawQuery("SELECT * FROM Regist");

    return result
        .map((e) => Regist.fromDB(e))
        .toList();
  }


  Future<void> insertRegist(Regist regist) async{
    if(_database == null) {
      throw Exception('data base not inivtialized');
    }
    await _database!.insert('Regist', regist.toDB());
  }

}