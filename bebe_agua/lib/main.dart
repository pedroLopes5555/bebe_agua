import 'package:bebe_agua/data/lotr_database.dart';
import 'package:bebe_agua/models/regist.dart';
import 'package:bebe_agua/pages/main_page.dart';
import 'package:bebe_agua/pages/splash_screen.dart';
import 'package:bebe_agua/repository/regists_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'http/http_client.dart';

//create: (_) => RegistRepository(client: HttpClient()),

void main() {
  runApp(MultiProvider(providers: [
    Provider<RegistRepository>(
      create: (_) => RegistRepository(client: HttpClient()),
    ),
    Provider<LOTRDatabse>(create: (_) => LOTRDatabse())
  ]));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final lotrDatabase = context.read<LOTRDatabse>();

    return FutureBuilder(
      future: lotrDatabase.init(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            title: 'BEBE ÁGUA',
            home: MainPage(),
          );
        } else {
          return const MaterialApp(
            title: 'BEBE ÁGUA',
            home: SplashScreen(),
          );
        }
      },
    );

    /*return const MaterialApp(
      title: 'BEBE ÁGUA',
      home: SplashScreen(),
      //home: MainPage(),
    );*/
  }
}
