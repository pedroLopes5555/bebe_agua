import 'package:bebe_agua/models/regist.dart';

class Repository{


  List<Regist> getDayRegist(){
    var regist = Regist(waterDrunk: 10);
    var regist1 = Regist(waterDrunk: 12);
    var regist2 = Regist(waterDrunk: 13);
    return [regist, regist1, regist2];

  }

}