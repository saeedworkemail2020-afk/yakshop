import 'dart:async';

import 'package:amozeshyar/Featuers/Interaction/interaction_view.dart';
import 'package:amozeshyar/Featuers/Splashscreen/splashscreen_controller.dart';
import 'package:get/get.dart';

class SplashscreenModel extends GetxController {
  SplashscreenModel();
  late SplashscreenController controller = SplashscreenController();

  Future<void> navigate() async {
    bool result = await controller.services.connectioncheck();
    await Future.delayed(Duration(seconds: 3));
    if (result == true) {
      Get.off(InteractionView());
    }
  }
}
