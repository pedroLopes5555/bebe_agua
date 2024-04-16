import 'package:flutter/material.dart';

class LogoAnimation extends StatefulWidget {
  const LogoAnimation({super.key});

  @override
  State<LogoAnimation> createState() => _LogoAnimationState();
}

class _LogoAnimationState extends State<LogoAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    //create controiller
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);

    _sizeAnimation = Tween<double>(begin: 90, end: 100)
        .animate(CurvedAnimation(curve: Curves.easeInOut, parent: _controller));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _sizeAnimation.value / 300, // Normalize to [0, 1]
          child: Image.asset(
            'lib/images/watter_botle.png',
          ),
        );
      },
    );
  }
}
