import 'package:flutter/cupertino.dart';

class HistoyPage extends StatefulWidget {
  const HistoyPage({super.key});

  @override
  State<HistoyPage> createState() => _HistoyPageState();
}

class _HistoyPageState extends State<HistoyPage> {
  @override
  Widget build(BuildContext context) {
    return const Expanded(child: Text("Pagina de Historico"));
  }
}
