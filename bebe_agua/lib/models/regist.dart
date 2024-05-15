import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Regist {
  double? _waterDrunk = 0;
  DateTime? _date;
  double _meta = 92.0;

  Regist({required double? waterDrunk, DateTime? date})
      : _waterDrunk = waterDrunk,
        _date = date;

  factory Regist.fromDB(Map<String, dynamic> map) {
    return Regist(
        waterDrunk: map['WaterDrunk'], date: DateTime.parse(map['Date']));
  }

  Map<String, dynamic> toDB() {
    // Format the date using ISO 8601 format
    String? formattedDate = _date?.toIso8601String();
    return {'WaterDrunk': _waterDrunk, 'Date': formattedDate};
  }

  double? getWaterDrunk() => _waterDrunk;

  DateTime? getDateTime() => _date;

  double getMeta() => _meta;

//void addWater(int value) => value += this.waterDrunk ?? 0;

//double progressValue() => (waterDrunk ?? 0) / meta;
}
