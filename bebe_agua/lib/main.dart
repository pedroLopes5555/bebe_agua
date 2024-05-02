import 'dart:io';

import 'package:bebe_agua/models/regist.dart';
import 'package:bebe_agua/pages/splash_screen.dart';
import 'package:bebe_agua/repository/regists_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'http/http_client.dart';

void main() {

  runApp(Provider(
      create: (_) => RegistRepository(client: HttpClient()),
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
