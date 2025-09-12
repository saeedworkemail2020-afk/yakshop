import 'dart:async';

import 'package:amozeshyar/Featuers/Interaction/interaction_view.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_controller.dart';
import 'package:flutter/material.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

class _SplashscreenViewState extends State<SplashscreenView> {
  final controller = SplashscreenController();
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InteractionView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/splashscreen/grass.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/splashscreen/yaks.gif'),
                    width: controller.screenSize.splashscreen,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
