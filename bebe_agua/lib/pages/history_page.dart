import 'package:bebe_agua/repository/regists_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

import '../data/lotr_database.dart';
import '../models/day.dart';
import '../models/regist.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Day> days = [];

  @override
  Widget build(BuildContext context) {
    var database = context.read<LOTRDatabse>();

    return FutureBuilder(
        future: database.getDays(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            days = snapshot.data ?? [];
            return Text("ok");
          } else {
            return CircularProgressIndicator();
          }
        });
  }

/*
  Widget list(BuildContext contex,List<Day> days) => ListView.separated(
    padding: const EdgeInsets.all(10),
    separatorBuilder: (_, index) => const Divider(color: Colors.grey, thickness: 0.5,),
    itemCount: days.length,
    itemBuilder: (_,index) => ListTile(title: Text(days[index].),)

  );

*/
}

/*return FutureBuilder(future: database.getWaterDrunkToday(), builder: (_, snapshot){
      if (snapshot.connectionState == ConnectionState.done){
        _watterDrunkToday = snapshot.data ?? 0;
        var percentage = _watterDrunkToday / 93;
*/
