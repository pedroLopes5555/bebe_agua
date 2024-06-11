import 'package:bebe_agua/data/lotr_database.dart';
import 'package:bebe_agua/models/regist.dart';
import 'package:bebe_agua/pages/main_page.dart';
import 'package:bebe_agua/pages/splash_screen.dart';
import 'package:bebe_agua/data/lotr_api.dart';
import 'package:bebe_agua/repository/repositoy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'http/http_client.dart';

//create: (_) => RegistRepository(client: HttpClient()),

void main() {

  LOTRDatabse _lotrDatabase = LOTRDatabse();
  runApp(MultiProvider(providers: [
    Provider<Repository>(create: (_) => Repository(lotrDatabase: _lotrDatabase)),
  ],
  child: const MainApp(),));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    final repository = context.read<Repository>();

    return FutureBuilder(
      future: repository.initDatabase(),
      builder: (_, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            title: 'BEBE ÁGUA',
            home: MainPage(),
          );
        } else {
          return const MaterialApp(
            title: 'BEBE ÁGUA',
            home: Center(child: CircularProgressIndicator(),)
            //home: SplashScreen(),
          );
        }
      },
    );
  }
}
