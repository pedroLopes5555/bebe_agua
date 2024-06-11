import 'package:bebe_agua/data/lotr_api.dart';
import 'package:bebe_agua/repository/repositoy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
    var repository = context.read<Repository>();

    return FutureBuilder(
        future: repository.getDays(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            days = snapshot.data ?? [];
            return buildListview(context, days);
          } else {
            return CircularProgressIndicator();
          }
        });
  }
 
  
  Widget buildListview(BuildContext context, List<Day> days){
    var buttons = generateElevatedButton(days);
    return ListView.builder(
      itemCount: buttons.length,
      itemBuilder: (context, index) {
        return buttons[index];
      },
    );
  }



  List<Widget> generateElevatedButton(List<Day> days){
    List<Widget> result = [];
    days.forEach((day) {
      result.add(Container(
        margin: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6.0), // Set the corner radius here
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Data:"),
                  Text('${day.getDate()?.day.toString().padLeft(2, '0')}/${day.getDate()?.month.toString().padLeft(2, '0')}/${day.getDate()?.year}'),
                ],
              ),
              Spacer(),
              day.isGoalAchived() ? const Icon(Icons.heart_broken_outlined) : const Icon(Icons.heart_broken, color: Colors.red,)
            ],
          ),
        ),
      )
      );
    });

    return result;
  }
  
  
}