import 'package:bebe_agua/repository/regists_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/regist.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<Regist> regists = [];



  @override
  Widget build(BuildContext context) {
    final repository = context.read<RegistRepository>();

    loadRegists(repository);

    return Column(
        children: [regists.isEmpty ? Text("a cerregar data") : buildRegistsList()]);
  }

  Widget buildRegistsList() {
    return ListView.separated(
        itemBuilder: (_, index) => ListTile(
              title: Text("${regists.elementAt(index).waterDrunk}"),
            ),
        separatorBuilder: (_, index) => Divider(
              color: Colors.green,
              thickness: 0.5,
            ),
        itemCount: regists.length);
  }

  void loadRegists(RegistRepository repository) async {
    regists = await repository.getRegists();

    setState(() {

    });
  }
}
