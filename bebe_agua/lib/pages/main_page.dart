import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../models/regist.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  var regist = Regist(waterDrunk: 0);

  late AnimationController progressCircleController;

  //controller for the drink button
  final _inputFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bebe água :)",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          progressCircle(),
          const SizedBox(
            height: 50,
          ),
          inputWatterDrunk(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  drinkButton(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

//drink button
  Widget drinkButton() => ElevatedButton(
      onPressed: () {
        setState(() {
          var watterDrunk = int.tryParse(_inputFieldController.text);

          if (watterDrunk == null) {
            openDialog(
                "Nao podes beber ${_inputFieldController.text} Marianaaaa");
          } else {
            //when is pressed add watter drunk
            regist.addWater(int.parse(_inputFieldController.text));
          }
          //clear input box
          _inputFieldController.clear();
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
      child: const Text("Bebe Agua"));

//text field to input the watter drunk
  Widget inputWatterDrunk() => TextFormField(
        //set the controller
        controller: _inputFieldController,
        //set keyboard type
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
            hintText: "numero de golos kkk",
            labelText: "Quantos golos deste?",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.abc)),
      );

  Widget progressCircle() {
    var percentage = regist.progressValue();

    if (percentage > 1.0) {
      percentage = 1.0;
    }

    return CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 40.0,
      animation: true,
      percent: percentage,
      center: Text(
        "${(regist.progressValue() * 100).toStringAsFixed(1)}%",
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      progressColor: Colors.blue,
      backgroundColor: Colors.grey,
      animateFromLastPercent: true,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }

  Future openDialog(String message) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text("Ent pah !"),
            content: Text(message),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Okkkkk Pedro"))
            ],
          ));
}











































  // Widget progressCircle(double progress) => SizedBox(
  //       height: 200,
  //       width: 200,
  //       child: CircularProgressIndicator(
  //         value: progress,
  //         strokeWidth: 50,
  //         color: Colors.blue,
  //         backgroundColor: Colors.grey,
  //       ),
  //     );
