import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';

class Regist {
  int waterDrunk = 0;
  DateTime? date;
  double meta = 92.0;

  Regist({required this.waterDrunk});

  void addWater(int value) => this.waterDrunk += value;

  double progressValue() => waterDrunk / meta;
}
