import 'package:bebe_agua/models/regist.dart';

class Day {
  List<Regist>? _regists;


  Day({required List<Regist> regists});


  bool isGoalAchived() {
    if(_regists== null){
      return false;
    }
      double result = 0;
      for(int i = 0; i < _regists!.length; i++){
        result += _regists![i].waterDrunk ?? 0;
      }

      return (result >= 92);

  }

  void addRegist(Regist regist){
    _regists!.add(regist);
  }
}