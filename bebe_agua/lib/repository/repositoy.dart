



import 'package:bebe_agua/data/lotr_database.dart';

import '../models/day.dart';
import '../models/regist.dart';

class Repository{

  LOTRDatabse _lotrDatabse;

  Repository({required LOTRDatabse lotrDatabase}) : _lotrDatabse = lotrDatabase;

  Future<List<Regist>> getAllRegists() async{
    return await _lotrDatabse.getAllRegists();
  }

  Future<List<Regist>> getTodayRegists() async{
    return await _lotrDatabse.getTodayRegists();
  }

  Future<int> getWaterDrunkToday() async{
    return await _lotrDatabse.getWaterDrunkToday();
  }

  Future<void> saveRegists(Regist regist) async{
    await _lotrDatabse.insertRegist(regist);
  }

  Future<List<Day>> getDays() async {
    var regists = await getAllRegists();
    var debug = _agroupDays(regists);
    return _agroupDays(regists);
  }

  Future<void> initDatabase() async{
    await _lotrDatabse.init();
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



  bool _isSameDay(DateTime? date1, DateTime? date2) {
    if (date1 == null || date2 == null) {
      return false; // If any of the dates is null, they can't be on the same day
    }
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }




}