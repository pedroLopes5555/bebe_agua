import 'package:bebe_agua/models/regist.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LOTRDatabse{

  Database? _database;
  Future<void> init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'lort1.db'),
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



  Future<List<Regist>> getTodayRegists() async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }

    // Get today's date in ISO 8601 format (YYYY-MM-DD)
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    List<Map<String, dynamic>> result = await _database!.rawQuery(
      "SELECT * FROM Regist WHERE Date = ?",
      [formattedDate],
    );

    return result.map((e) => Regist.fromDB(e)).toList();
  }



  Future<int> getWaterDrunkToday() async {
    if (_database == null) {
      throw Exception('Database not initialized');
    }

    // Get today's date in ISO 8601 format (YYYY-MM-DD)
    DateTime now = DateTime.now();
    String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    // Execute SQL query to retrieve the sum of water drunk today
    List<Map<String, dynamic>> result = await _database!.rawQuery(
      "SELECT SUM(WaterDrunk) AS total FROM Regist WHERE Date = ?",
      [formattedDate],
    );

    // Extract the total water drunk from the result
    double totalWaterDrunk = result[0]['total'] ?? 0.0;

    return totalWaterDrunk.toInt();
  }



  Future<void> insertRegist(Regist regist) async{
    if(_database == null) {
      throw Exception('data base not inivtialized');
    }
    await _database!.insert('Regist', regist.toDB());
  }

}