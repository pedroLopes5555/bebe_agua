import 'package:bebe_agua/models/day.dart';
import 'package:bebe_agua/models/regist.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LOTRDatabse {
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
        //await _insertTestValues(db);
      },
      version: 1,
    );
  }

  Future<List<Regist>> getAllRegists() async {
    if (_database == null) {
      throw Exception('data base not inivtialized');
    }
    List result = await _database!.rawQuery("SELECT * FROM Regist");

    return result.map((e) => Regist.fromDB(e)).toList();
  }

  Future<List<Regist>> getTodayRegists() async {
    //id database null trhow excerion
    if (_database == null) {
      throw Exception('Database not initialized');
    }
    //get date from now
    var date = DateTime.now();
    //format to get the string to make the sql query
    //format month becouse of sql format
    String month =
        date.month.toString().length == 1 ? "0${date.month}" : "${date.month}";
    String todaydate = "${date.year}-$month-${date.day}%";

    //debug variable
    //String query = "SELECT * FROM Regist WHERE Date LIKE '$todaydate';";
    //query, % in the endo to get all the e regists from today
    List<Map<String, dynamic>> list = await _database!
        .rawQuery("SELECT * FROM Regist WHERE Date LIKE '$todaydate';");

    return list.map((e) => Regist.fromDB(e)).toList();
  }

  Future<int> getWaterDrunkToday() async {
    //id database null trhow excerion
    if (_database == null) {
      throw Exception('Database not initialized');
    }
    //get date from now
    var date = DateTime.now();
    //format to get the string to make the sql query
    String month =
        date.month.toString().length == 1 ? "0${date.month}" : "${date.month}";
    String todaydate = "${date.year}-$month-${date.day}%";

    //String query = "SELECT * FROM Regist WHERE Date LIKE '$todaydate';";
    //query, % in the endo to get all the e regists from today
    List<Map<String, dynamic>> list = await _database!
        .rawQuery("SELECT * FROM Regist WHERE Date LIKE '$todaydate';");

    double result = 0;
    //if the list is empty there is no regists, no water drunk
    if (list.isEmpty) {
      return 0;
    }
    //calc the water drunk
    for (Map<String, dynamic> element in list) {
      result += element['WaterDrunk'];
    }
    //return
    return result.toInt();
  }

  Future<void> insertRegist(Regist regist) async {
    if (_database == null) {
      throw Exception('data base not inivtialized');
    }
    await _database!.insert('Regist', regist.toDB());
  }

  Future<List<Day>> getDays() async {
    var regists = await getAllRegists();
    var debug = _agroupDays(regists);
    return _agroupDays(regists);
  }

  bool _isSameDay(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) {
      return false; // If any of the dates is null, they can't be on the same day
    }
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  List<Day> _agroupDays(List<Regist> regists) {
    List<Day> result = [];

    for (var registsElement in regists) {
      bool addedToExistingDay = false;
      DateTime? registsElementDate = registsElement.getDateTime();

      if (registsElementDate == null) {
        continue; // Skip this registsElement if its DateTime is null
      }

      // Check if registsElement can be added to an existing day
      for (var resultElement in result) {
        DateTime? firstRegistDate = resultElement.getRegists().first.getDateTime();
        if (firstRegistDate != null && _isSameDay(registsElementDate, firstRegistDate)) {
          resultElement.addRegist(registsElement);
          addedToExistingDay = true;
          break; // No need to continue checking days
        }
      }

      // If not added to an existing day, create a new one
      if (!addedToExistingDay) {
        Day day = Day();
        day.addRegist(registsElement);
        result.add(day);
      }
    }

    return result;
  }


}
