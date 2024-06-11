import 'package:bebe_agua/models/regist.dart';

class Day {
  List<Regist> _regists = [];


  Day();

  DateTime? getDate() => _regists[0].getDateTime();


  bool isGoalAchived() {
    if(_regists.isEmpty){
      return false;
    }
      double result = 0;
      for(int i = 0; i < _regists.length; i++){
        result += _regists[i].getWaterDrunk() ?? 0;
      }

      return (result >= 92);

  }

  void addRegist(Regist regist){
    _regists.add(regist);
  }


  List<Regist> getRegists() => _regists;

  //String getDateString() => "${}"

}