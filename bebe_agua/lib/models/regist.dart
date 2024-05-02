import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Regist {
  int waterDrunk = 0;
  DateTime? date;
  double meta = 92.0;

  Regist(int? waterDrunk){
    if (waterDrunk == null){
      this.waterDrunk = 0;
    }else{
      this.waterDrunk = waterDrunk;
    }
  }


  void addWater(int value) => this.waterDrunk += value;

  double progressValue() => waterDrunk / meta;
}
