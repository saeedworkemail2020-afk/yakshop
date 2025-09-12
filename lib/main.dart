import 'package:amozeshyar/Core/screen_size.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenSize().getScreenSize(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );
    return GetMaterialApp(home: SplashscreenView());
  }
}
