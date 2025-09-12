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

  InteractionModel() {
    interactionscaffoldkey = GlobalKey<ScaffoldState>();

    interactionformkey = GlobalKey<FormState>();
    usernametext = TextEditingController();
    milktext = TextEditingController();
    skintext = TextEditingController();
    usernamenode = FocusNode();
    milknode = FocusNode();
    skinnode = FocusNode();
  }
}
