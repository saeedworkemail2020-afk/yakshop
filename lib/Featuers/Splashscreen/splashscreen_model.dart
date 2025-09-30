import 'dart:async';

import 'package:amozeshyar/Featuers/Interaction/interaction_view.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashscreenModel extends GetxController {
  late GlobalKey<ScaffoldState> Splashscreenscaffoldkey;
  SplashscreenModel() {
    Splashscreenscaffoldkey = GlobalKey<ScaffoldState>();
  }
  late SplashscreenController controller = SplashscreenController();

  get interactionscaffoldkey => null;
  Future<void> navigate() async {
    bool result = await controller.services.connectioncheck();
    await Future.delayed(Duration(seconds: 3));
    if (result == true) {
      controller.snackBar.showSnackBar(
        controller.services.message,
        Colors.green,
        Splashscreenscaffoldkey.currentState!.context,
      );
      Get.off(InteractionView());
    }
    if (result == false) {
      controller.snackBar.showSnackBar(
        controller.services.message,
        Colors.red,
        Splashscreenscaffoldkey.currentState!.context,
      );
      controller.services.connectioncheck();
    }
  }
}
