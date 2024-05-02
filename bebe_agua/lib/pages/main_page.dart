import 'dart:async';

import 'package:bebe_agua/pages/history_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import '../models/regist.dart';
import 'package:bebe_agua/pages/drink_water_page.dart';

class MainPage extends StatefulWidget {



  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late AnimationController progressCircleController;
  int _selectIndex = 0;

  static const List<Widget> _widgetPageOptions = <Widget>[
    DrinkWaterPage(),
    HistoryPage(),
  ];

  void _onMenuClick(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Bebe água :)",
        ),
      ),
      body: _widgetPageOptions.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "principal"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_view_day), label: "historico")
        ],
        currentIndex: _selectIndex,
        onTap: _onMenuClick,
      ),
    );
  }

}
