import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

class VfairsLogoScreenWidget extends StatefulWidget {
  const VfairsLogoScreenWidget({super.key});

  @override
  State<VfairsLogoScreenWidget> createState() => _VfairsLogoScreenWidgetState();
}

class _VfairsLogoScreenWidgetState extends State<VfairsLogoScreenWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15))
          ..repeat();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("vFairs"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
              filterQuality: FilterQuality.high,
              angle: controller.value * 1 * math.pi,
              child: Image.asset("assets/vfairs-logo-landscape-gradient.png"),
            );
          },
        ),
      ),
    );
  }
}
