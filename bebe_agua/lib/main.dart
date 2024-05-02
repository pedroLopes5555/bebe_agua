import 'dart:io';

import 'package:bebe_agua/models/regist.dart';
import 'package:bebe_agua/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Regist regist = Regist(waterDrunk: 0);

  runApp(Provider(
    create: (BuildContext context) {return regist;},
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'BEBE ÁGUA',
      home: SplashScreen(),
      //home: MainPage(),
    );
  }
}
