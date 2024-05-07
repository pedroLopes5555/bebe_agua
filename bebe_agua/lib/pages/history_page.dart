import 'package:bebe_agua/repository/regists_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/lotr_database.dart';
import '../models/regist.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Regist> regists = [];


  @override
  void initState() {
    super.initState();
    _loadRegists();
  }



  // Method to refresh the list of regists
  Future<void> _loadRegists() async {
    final database = context.read<LOTRDatabse>(); // Get the database instance
    regists = await database.getAllRegists();
    setState(() {}); // Update UI
  }


  @override
  Widget build(BuildContext context) {
    final repository = context.read<RegistRepository>();
    final LOTRDatabse database = context.read<LOTRDatabse>();
    return Center(
      child: Column(
          children:[
            CircularProgressIndicator()
          ] ),
    );
  }


  /*


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
   */
}
