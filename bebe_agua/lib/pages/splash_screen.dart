import 'dart:async';

import 'package:flutter/material.dart';
import '../widgets/logo_animation.dart';
import '../pages/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const MainPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        const Center(
            //call logo animation here
            child: LogoAnimation()),
        bottomText("O Pedro manda beber água :)")
      ],
    ));
  }

  Widget bottomText(String text) => Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ));
}
