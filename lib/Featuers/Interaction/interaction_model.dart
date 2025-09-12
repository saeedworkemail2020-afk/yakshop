import 'package:get/get.dart';
import 'package:flutter/material.dart';

class InteractionModel extends GetxController {
  late GlobalKey<ScaffoldState> interactionscaffoldkey;

  late GlobalKey<FormState> interactionformkey;
  late TextEditingController usernametext;
  late TextEditingController milktext;
  late TextEditingController skintext;
  late FocusNode usernamenode;
  late FocusNode milknode;
  late FocusNode skinnode;

  late RxBool hidepassword;
  late RxBool visibilitymaincont = false.obs;
  InteractionModel() {
    interactionscaffoldkey = GlobalKey<ScaffoldState>();

    interactionformkey = GlobalKey<FormState>();
    usernametext = TextEditingController();
    milktext = TextEditingController();
    skintext = TextEditingController();
    usernamenode = FocusNode();
    milknode = FocusNode();
    skinnode = FocusNode();
    // state managment variables
    hidepassword = true.obs;
  }
  void tesxtfieldlength(value) {
    if (usernametext.text.length > 8) {
      usernametext.text =
          value[0] +
          value[1] +
          value[2] +
          value[3] +
          value[4] +
          value[5] +
          value[6] +
          value[7];
    }
  }
}
