import 'package:amozeshyar/Core/screen_size.dart';
import 'package:amozeshyar/Featuers/Interaction/interaction_controller.dart';
import 'package:amozeshyar/Featuers/Interaction/interaction_view.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final interaction = InteractionController();
  @override
  Widget build(BuildContext context) {
    ScreenSize().getScreenSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    // return GetMaterialApp(home: InteractionView());
    return GetMaterialApp(home: SplashscreenView());
  }
}
