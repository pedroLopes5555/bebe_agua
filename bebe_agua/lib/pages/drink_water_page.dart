import 'package:bebe_agua/data/lotr_database.dart';
import 'package:bebe_agua/data/notification_api.dart';
import 'package:bebe_agua/repository/repositoy.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../models/regist.dart';

class DrinkWaterPage extends StatefulWidget {
  const DrinkWaterPage({super.key});

  @override
  State<DrinkWaterPage> createState() => _DrinkWaterPageState();
}

class _DrinkWaterPageState extends State<DrinkWaterPage> {
  //controller for the drink button

//drink button
  final _inputFieldController = TextEditingController();
  int _watterDrunkToday = 0;

  Widget drinkButton() => ElevatedButton(
      onPressed: () {
        setState(() {
          var watterDrunk = int.tryParse(_inputFieldController.text);
          if (watterDrunk == null) {
            openDialog(
                "Nao podes beber ${_inputFieldController.text} Marianaaaa");
          } else {
            //when is pressed add watter drunk
            //_watterDrunkToday += int.tryParse(_inputFieldController.text) ?? 0;
            //create an instance of regist
            var regist = Regist(
                waterDrunk: double.parse(_inputFieldController.text),
                date: DateTime.now());
            //get the database instance dependency
            final repository = context.read<Repository>();
            //incert the regist on the database
            repository.saveRegists(regist);
          }
          //clear input box
          _inputFieldController.clear();
        });
      },
      //style the elevated button
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
      child: const Text("Bebe Agua"));

  @override
  Widget build(BuildContext context) {
    final repository = context.read<Repository>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        progressCircle(repository),
        inputWatterDrunk(),
        Expanded(
          child: buildButton(),
        )
      ],
    );
  }

  Widget buildButton() {
    return Container(
      //distance from other elements
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //call drink Button
              drinkButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputWatterDrunk() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: TextFormField(
          //set the controller
          controller: _inputFieldController,
          //set keyboard type
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
              hintText: "numero de golos kkk",
              labelText: "Quantos golos deste?",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.abc)),
        ),
      );

  /*
  FutureBuilder(future: database.getWaterDrunkToday(), builder: (_, snapshot){
  if (snapshot.connectionState == ConnectionState.done){
  _watterDrunkToday = snapshot.data ?? 0;
  */

  Widget progressCircle(Repository repository) {
    return FutureBuilder(
        future: repository.getWaterDrunkToday(),
        builder: (_, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            _watterDrunkToday = snapshot.data ?? 0;
            var percentage = _watterDrunkToday / 93;

            //so the progress bar dont overload
            if (percentage > 1.0) {
              percentage = 1.0;
            }
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.center,
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 40.0,
                animation: true,
                percent: percentage,
                center: Text(
                  "${(percentage * 100).toStringAsFixed(1)}%",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                progressColor: Colors.blue,
                backgroundColor: Colors.grey,
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            );
          } else {
            var percentage = _watterDrunkToday / 93;

            //so the progress bar dont overload
            if (percentage > 1.0) {
              percentage = 1.0;
            }
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.center,
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 40.0,
                animation: true,
                percent: percentage,
                center: Text(
                  "${(percentage * 100).toStringAsFixed(1)}%",
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                progressColor: Colors.blue,
                backgroundColor: Colors.grey,
                animateFromLastPercent: true,
                circularStrokeCap: CircularStrokeCap.round,
              ),
            );
          }
        });
    //var percentage = regist.progressValue();
    //double progressValue() => waterDrunk / meta;
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
