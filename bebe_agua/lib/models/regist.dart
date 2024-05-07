import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Regist {
  int waterDrunk = 0;
  DateTime? date;
  double meta = 92.0;

  Regist({required this.waterDrunk, this.date});

  factory Regist.fromDB(Map<String, dynamic> map) {
    return Regist(waterDrunk: map['WatterDrunk'], date: map['Date']);
  }

  Map<String, dynamic> toDB() {
    return {'WaterDrunk': waterDrunk, 'date': date};
  }

  void addWater(int value) => this.waterDrunk += value;

  double progressValue() => waterDrunk / meta;
}
