import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_controller.dart';
import 'package:flutter/material.dart';

class SplashscreenView extends StatefulWidget {
  const SplashscreenView({super.key});

  @override
  State<SplashscreenView> createState() => _SplashscreenViewState();
}

final controller = SplashscreenController();
final model = controller.model;

class _SplashscreenViewState extends State<SplashscreenView> {
  @override
  void initState() {
    super.initState();
    model.navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: model.Splashscreenscaffoldkey,
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
