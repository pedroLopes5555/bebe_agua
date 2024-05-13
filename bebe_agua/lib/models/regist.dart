import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Regist {
  double? waterDrunk = 0;
  DateTime? date;
  double meta = 92.0;

  Regist({required this.waterDrunk, this.date});

  factory Regist.fromDB(Map<String, dynamic> map) {
    return Regist(waterDrunk: map['WaterDrunk'], date: DateTime.parse(map['Date']));
  }

  Map<String, dynamic> toDB() {
    // Format the date using ISO 8601 format
    String? formattedDate = date?.toIso8601String();
    return {'WaterDrunk': waterDrunk, 'Date': formattedDate};
  }

  //void addWater(int value) => value += this.waterDrunk ?? 0;

  //double progressValue() => (waterDrunk ?? 0) / meta;
}
