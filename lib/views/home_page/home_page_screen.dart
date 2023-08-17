import 'dart:math';

import 'package:flutter/material.dart';

import '../logo_screen/logo_screen_widget.dart';

class HomePageScreenWidget extends StatefulWidget {
  const HomePageScreenWidget({super.key});

  @override
  State<HomePageScreenWidget> createState() => _HomePageScreenWidgetState();
}

class _HomePageScreenWidgetState extends State<HomePageScreenWidget> {
  final random = Random();
  double boxHeight = 100;
  double boxWidget = 100;
  double opacity = 1;
  Color boxColor = Colors.amber;
  BorderRadius radius = BorderRadius.circular(10);
  double start = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const VfairsLogoScreenWidget()));
        },
        child: Text("Vfair"),
      ),
      appBar: AppBar(title: const Text("Home Page")),
      body: SingleChildScrollView(
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TweenAnimationBuilder(
                curve: Curves.bounceInOut,
                tween: Tween<double>(begin: start, end: 100),
                builder: (context, value, widgetChild) {
                  return Text(
                    "VFairs",
                    style: TextStyle(fontSize: value),
                  );
                },
                duration: const Duration(seconds: 2),
              ),
              Center(
                child: AnimatedContainer(
                  onEnd: () {
                    print("Hello World");
                  },
                  curve: Curves.easeOutSine,
                  height: boxHeight,
                  width: boxWidget,
                  decoration:
                      BoxDecoration(color: boxColor, borderRadius: radius),
                  duration: const Duration(seconds: 1),
                ),
              ),
              AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(seconds: 1),
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          opacity = opacity == 1 ? 0 : 1;
                        });
                      },
                      child: Image.asset(
                          "assets/vfairs-logo-landscape-gradient.png"))),
              TweenAnimationBuilder(
                curve: Curves.decelerate,
                onEnd: () {},
                tween: Tween<double>(begin: start, end: 250),
                builder: (context, value, widgetChild) {
                  return Image.asset(
                    "assets/vfairs-logo-landscape-gradient.png",
                    height: value,
                  );
                },
                duration: const Duration(seconds: 5),
              ),
              SizedBox(
                height: 30,
              ),

              //   AnimatedRotation(turns: turns, duration: duration)
            ]),
      ),
      bottomNavigationBar:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        IconButton(
            onPressed: () {
              changeBoxColor();
            },
            icon: const Icon(Icons.format_paint),
            iconSize: 35),
        IconButton(
            onPressed: () {
              changeBoxRadius();
            },
            icon: const Icon(Icons.circle),
            iconSize: 35),
        IconButton(
            onPressed: () {
              changeBoxSize();
            },
            icon: const Icon(Icons.height),
            iconSize: 35),
      ]),
    );
  }

  void changeBoxColor() {
    setState(() {
      boxColor = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  void changeBoxRadius() {
    setState(() {
      radius = BorderRadius.circular(random.nextInt(80).toDouble());
    });
  }

  void changeBoxSize() {
    setState(() {
      boxHeight = random.nextInt(700).toDouble();
      boxWidget = random.nextInt(400).toDouble();
    });
  }
}
